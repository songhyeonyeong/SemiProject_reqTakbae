package com.kh.jinkuk.border.announcment.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.border.announcment.model.vo.InsertAnnouncment;
import com.kh.jinkuk.member.model.vo.Images;

public class AnnouncmentDao {
	
	private Properties prop = new Properties();
	
	public AnnouncmentDao() {
		
		String fileName = AnnouncmentDao.class.getResource("/sql/border/announcment/announcment.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	//페이징 처리 후 전체 게시판 조회용 메소드
		public ArrayList<Announcment> selectList(Connection con, int currentPage, int limit, String gongdiv) {
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			ArrayList<Announcment> list = null;
			
			String query = prop.getProperty("selectList");
			
			try {
				pstmt = con.prepareStatement(query);
				
				int startRow = (currentPage - 1) * limit + 1;
				int endRow = startRow + limit - 1;
				
				pstmt.setString(1,gongdiv);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				list = new ArrayList<Announcment>();
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Announcment a = new Announcment();
					a.setRnum(rset.getInt("RNUM"));
					a.setG_NO(rset.getInt("G_NO"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setG_P_DIV(rset.getString("G_P_DIV"));
																		
					list.add(a);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
		
			
			return list;
		}
		
		public int getListCount(Connection con, String gongdiv) {
			
			PreparedStatement pstmt = null;
			int listCount = 0;
			ResultSet rset = null;

			String query = prop.getProperty("listCount");

			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, gongdiv);
				rset = pstmt.executeQuery();
				if (rset.next()) {
					listCount = rset.getInt(1);
				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(rset);
			}

			return listCount;
	}

		//전체 공고 상세보기
		public Announcment selectOne(Connection con, int num) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Announcment a = null;
			String query = prop.getProperty("selectOne");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, num);
				pstmt.setInt(2, num);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					a = new Announcment();
					a.setG_NO(num);
					a.setCount(rset.getInt("COUNT"));
					a.setUSER_ID(rset.getString("USER_ID"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_E_DATE(rset.getDate("G_E_DATE"));
					a.setG_TYPE(rset.getString("G_TYPE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setG_CONTEXT(rset.getString("G_CONTEXT"));
					a.setG_P_DIV(rset.getString("G_P_DIV"));
					
				}
			
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return a;
		}
		
		/*//당일공고 상세보기
		public Announcment selectOneToday(Connection con, int num) {
			
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			Announcment a = null;
			
			String query =prop.getProperty("selectOneToday");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, num);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					a = new Announcment();
					
					a.setUSER_ID(rset.getString("USER_ID"));
					a.setG_TITLE(rset.getString("G_TITLE"));
					a.setG_S_DATE(rset.getDate("G_S_DATE"));
					a.setG_E_DATE(rset.getDate("G_E_DATE"));
					a.setG_TYPE(rset.getString("G_TYPE"));
					a.setG_S_AREA(rset.getString("G_S_AREA"));
					a.setG_E_AREA(rset.getString("G_E_AREA"));
					a.setG_PRICE(rset.getInt("G_PRICE"));
					a.setG_SIZE(rset.getString("G_SIZE"));
					a.setG_DAY(rset.getDate("G_DAY"));
					a.setG_CONTEXT(rset.getString("G_CONTEXT"));
					a.setG_P_DIV(rset.getString("G_P_DIV"));
					
				}
			
			
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			return a;
		}*/
		
		//-------------수정 메소드------------------//
		
		//공고 수정하기
		public int updateBoard(Connection con, InsertAnnouncment i, String gongdiv,int gno) {
			PreparedStatement pstmt = null;
			int result1 = 0;
			
			System.out.println(i.getGtitle());
			System.out.println(i.getGcontext());
			System.out.println(i.getGday());
			
			String query = prop.getProperty("updateBoard");
			
			System.out.println(query);
			
			try {
				
				pstmt = con.prepareStatement(query);
				
				
				pstmt.setString(1, i.getGtitle());
				pstmt.setString(2, i.getGcontext());
				pstmt.setString(3, gongdiv);
				pstmt.setDate(4, i.getGday());
				pstmt.setString(5, i.getGsarea());
				pstmt.setString(6, i.getGearea());
				pstmt.setString(7, i.getGtype());
				pstmt.setInt(8, i.getGsum());
				pstmt.setInt(9, i.getGprice());
				pstmt.setString(10, i.getGsize());
				pstmt.setDate(11, i.getGday());
				pstmt.setInt(12, i.getUno());
				pstmt.setInt(13, gno);
				
				
				result1 = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			System.out.println(result1);
			return result1;
		}
		
		//공고 수정 - 포인트 사용 내역 업데이트
		public int updatePointRbd(Connection con, InsertAnnouncment i, int gno, String gongdiv) {
			PreparedStatement pstmt = null;
			int result3 = 0;
			String query = prop.getProperty("updatePointRbd");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "포인트 사용");
				pstmt.setInt(2, i.getPoint());
				pstmt.setString(3,i.getGtitle());
				pstmt.setInt(4,i.getUno());
				pstmt.setInt(5, gno);
				result3 = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result3;
			
			
			
			
		}
		//공고 수정 - 포인트 사용 내역 없을 시 삽입
		public int insertPointbd(Connection con, InsertAnnouncment i, int gno, String gongdiv) {
			PreparedStatement pstmt = null;
			int result3 = 0;
			String query = prop.getProperty("insertPoint");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "포인트 사용");
				pstmt.setInt(2, i.getPoint());
				pstmt.setString(3,i.getGtitle());
				pstmt.setInt(4,i.getUno());
				pstmt.setInt(5, gno);
				result3 = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result3;
		}
		
		//사이버 머니 사용 내역 삽입 
		public int insertCmoneydb(Connection con, InsertAnnouncment i, int gno) {
			PreparedStatement pstmt = null;
			int result4 = 0;
			
			String query = prop.getProperty("insertCmoneydb");
			
			System.out.println(query);
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "공고요금사용");
				pstmt.setInt(2, i.getGsum());
				pstmt.setString(3,i.getGtitle());
				pstmt.setInt(4,i.getUno());
				pstmt.setInt(5, gno);
				
				result4 = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			System.out.println(result4);
			return result4;
		}
		//사이버 머니 사용 내역 업데이트
		public int updatecmoneybd(Connection con, InsertAnnouncment i, int gno, String gongdiv) {
			PreparedStatement pstmt = null;
			int result4 = 0;
			
			String query = prop.getProperty("updatecmoneybd");
			
			System.out.println(query);
			
			try {
				pstmt = con.prepareStatement(query);
				
				pstmt.setString(1, "공고요금사용");
				pstmt.setInt(2, i.getGsum());
				pstmt.setString(3,i.getGtitle());
				pstmt.setInt(4,i.getUno());
				pstmt.setInt(5, gno);
				
				result4 = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			System.out.println(result4);
			return result4;
		}
	
		
		//사용한 포인트와 사이버 머니 회원상태에서 업데이트
		public int updateUserCmoney(Connection con, InsertAnnouncment i, int gno) {
			PreparedStatement pstmt = null;
			int result5 = 0;
			
			System.out.println("유저 아이디 확인"+i.getUno());
			System.out.println(i.getGsum());
			System.out.println(i.getPoint());
			
			String query = prop.getProperty("updateUserCmoney");
			
			System.out.println(query);
			
			try {
				
				pstmt = con.prepareStatement(query);
				
				pstmt.setInt(1, i.getGsum());
				pstmt.setInt(2, i.getPoint());
				pstmt.setInt(3, i.getUno());
				
				result5 = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		
			System.out.println("result5"+result5);
			return result5;
		}
		
		//수정시 이미지 데이터 업데이트
		public int updateimage(Connection con, Images image, InsertAnnouncment i, int gno) {
			PreparedStatement pstmt = null;
			int result6 = 0;
			String query = prop.getProperty("updateRimage");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1,"공고사진");
				pstmt.setString(2, image.getI_o_name());
				pstmt.setString(3, image.getI_c_name());
				pstmt.setString(4,image.getI_path());
				pstmt.setInt(5, i.getUno());
				pstmt.setInt(6, gno);
				
				result6 = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result6;
		}
		//수정시 이미지 데이터 삽입
		public int insertimage(Connection con, Images image, int gno, InsertAnnouncment i) {
			PreparedStatement pstmt = null;
			int result6 = 0;
			String query = prop.getProperty("insertRimage");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1,"공고사진");
				pstmt.setString(2, image.getI_o_name());
				pstmt.setString(3, image.getI_c_name());
				pstmt.setString(4,image.getI_path());
				pstmt.setInt(5, i.getUno());
				pstmt.setInt(6, gno);
				result6 = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result6;
		}
		
		

		
		

		//------------------------수정메소드-----------------------------------//
		
		//게시판 작성 
		public int insertBoard(Connection con, InsertAnnouncment i, String gongdiv) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("insertBoard");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, i.getGtitle());
				pstmt.setString(2,i.getGcontext());
				pstmt.setString(3,gongdiv);
				pstmt.setDate(4,i.getGday());
				pstmt.setString(5, i.getGsarea());
				pstmt.setString(6, i.getGearea());
				pstmt.setString(7,i.getGtype());
				pstmt.setInt(8,i.getGsum());
				pstmt.setInt(9,i.getGprice());
				pstmt.setString(10,i.getGsize());
				pstmt.setDate(11,i.getGday());
				pstmt.setInt(12,i.getUno());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

		public int insertANNOUNCEPAY(Connection con, InsertAnnouncment i) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("insertANNOUNCEPAY");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "매칭중");
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

		public int insertPointbd(Connection con, InsertAnnouncment i) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("insertPointbd");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "공고등록");
				pstmt.setInt(2, i.getPoint());
				pstmt.setString(3,i.getGtitle());
				pstmt.setInt(4,i.getUno());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

		public int insertcmoneybd(Connection con, InsertAnnouncment i) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("insertcmoneybd");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, "공고등록");
				pstmt.setInt(2, i.getGsum());
				pstmt.setString(3,i.getGtitle());
				pstmt.setInt(4,i.getUno());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

		public int updatemembermoney(Connection con, InsertAnnouncment i) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("updatemembermoney");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1,-(i.getGsum()));
				pstmt.setInt(2,-(i.getPoint()));
				pstmt.setInt(3,i.getUno());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return result;
		}

	public int insertimage(Connection con, Images image) {
			PreparedStatement pstmt = null;
			int result = 0;
			String query = prop.getProperty("insertimage");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1,"공고사진");
				pstmt.setString(2, image.getI_o_name());
				pstmt.setString(3, image.getI_c_name());
				pstmt.setString(4,image.getI_path());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

		public Images selectImage(Connection con, int num) {
			PreparedStatement pstmt= null;
			ResultSet rset=null;
			Images i =null;
			String query = prop.getProperty("selectImage");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setInt(1, num);
				rset=pstmt.executeQuery();
				
				if(rset.next()) {
					i=new Images();
					i.setG_no(rset.getInt("G_NO"));
					i.setI_c_name(rset.getString("I_C_NAME"));
					i.setI_o_name(rset.getString("I_O_NAME"));
					i.setI_div(rset.getString("I_DIV"));
					i.setI_no(rset.getInt("I_NO"));
					i.setI_path(rset.getString("I_PATH"));
					i.setStatus(rset.getString("STATUS"));
					i.setU_no(rset.getInt("U_NO"));
					i.setI_upload(rset.getDate("I_UPLOAD"));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			
			return i;
		}

		public int insertReqATC(Connection con, int uno, int gno) {
			PreparedStatement pstmt =null;
			int result=0;
			String query =prop.getProperty("insertReqATC");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setInt(1,uno);
				pstmt.setInt(2,gno);
				result =pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
		}

		public int findReq(Connection con, int uno, int gno) {
			PreparedStatement pstmt =null;
			ResultSet rset=null;
			int result=0;
			String query =prop.getProperty("findReq");
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setInt(1,uno);
				pstmt.setInt(2,gno);
				rset=pstmt.executeQuery();
				if(rset.next()) {
					result=rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			return result;
		}

		public int areaCount(Connection con, String start) {
			PreparedStatement pstmt = null;
			int result = 0;
			
			String query = prop.getProperty("areacount");
			String[] area = start.split(" ");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, area[1]);
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		//삭제시 유저 돈 돌려주기
		public int delGMoney(Connection con,int uno,int gno) {
			PreparedStatement pstmt =null;
			int result=0;
			
			String query =prop.getProperty("delGMoney");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setInt(1, gno);
				pstmt.setInt(2, gno);
				pstmt.setInt(3, uno);
				result =pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			System.out.println(result);
			return result;
		}
		//삭제시 사이버머니 내역 추가
		public int delCmoney(Connection con, int uno, int gno) {
			PreparedStatement pstmt =null;
			int result=0;
			
			String query =prop.getProperty("delCmoney");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, "공고취소(사이버머니)");
				pstmt.setInt(2, gno);
				pstmt.setString(3, "공고등록");
				pstmt.setInt(4, uno);
				pstmt.setInt(5, gno);
				result =pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		//삭제시 사이버머니 내역 포인트 내역 추가
		public int delPmoney(Connection con, int uno, int gno) {
			PreparedStatement pstmt =null;
			int result=0;
			
			String query =prop.getProperty("delPmoney");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, "공고취소");
				pstmt.setInt(2, gno);
				pstmt.setInt(3, uno);
				pstmt.setInt(4, gno);
				result =pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		//삭제시 포인트내역 등록
		public int delPoint(Connection con, int uno, int gno) {
			PreparedStatement pstmt =null;
			int result=0;
			
			String query =prop.getProperty("delPoint");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setString(1, "공고취소");
				pstmt.setInt(2, gno);
				pstmt.setString(3, "공고삭제");
				pstmt.setInt(4, uno);
				pstmt.setInt(5, gno);
				
				result =pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		//삭제시 공고 상태 변경 
		public int delStatus(Connection con, int gno) {
			PreparedStatement pstmt =null;
			int result=0;
			
			String query =prop.getProperty("delStatus");
			
			try {
				pstmt=con.prepareStatement(query);
				pstmt.setInt(1, gno);
				result =pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}

}
