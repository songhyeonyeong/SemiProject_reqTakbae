package com.kh.jinkuk.border.announcment.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

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
//					a = new Announcment();
//					a.setUSER_ID(rset.getString("USER_ID"));
//					a.setG_TITLE(rset.getString("G_TITLE"));
//					a.setG_S_DATE(rset.getDate("G_S_DATE"));
//					a.setG_E_DATE(rset.getDate("G_E_DATE"));
//					a.setG_TYPE(rset.getString("G_TYPE"));
//					a.setG_S_AREA(rset.getString("G_S_AREA"));
//					a.setG_E_AREA(rset.getString("G_E_AREA"));
//					a.setG_PRICE(rset.getInt("G_PRICE"));
//					a.setG_SIZE(rset.getString("G_SIZE"));
//					a.setG_DAY(rset.getDate("G_DAY"));
//					a.setG_CONTEXT(rset.getString("G_CONTEXT"));
//					a.setG_P_DIV(rset.getString("G_P_DIV"));
					
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
				pstmt.setString(1, "공고요금사용");
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
				pstmt.setString(1, "공고요금사용");
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
				// TODO Auto-generated catch block
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
				// TODO Auto-generated catch block
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
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(pstmt);
				close(rset);
			}
			return result;
		}

		public int areaCount(Connection con, String start) {
			PreparedStatement pstmt = null;
			int areaCount = 0;
			
			String qeury = prop.getProperty("areaCount");
			
			
			
			return areaCount;
		}
}
