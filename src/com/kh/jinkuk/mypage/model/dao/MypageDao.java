package com.kh.jinkuk.mypage.model.dao;

import static com.kh.jinkuk.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jinkuk.admin.model.vo.Inquiry;
import com.kh.jinkuk.border.announcment.model.vo.Announcment;
import com.kh.jinkuk.mypage.model.vo.MyCharge;
import com.kh.jinkuk.mypage.model.vo.MyDeliverNotice;
import com.kh.jinkuk.mypage.model.vo.MyExchange;
import com.kh.jinkuk.mypage.model.vo.MyR_M_article;
import com.kh.jinkuk.mypage.model.vo.Mynotice;
import com.kh.jinkuk.mypage.model.vo.SelectReqGisa;
import com.sun.corba.se.spi.orbutil.fsm.Guard.Result;

public class MypageDao {

	private Properties prop = new Properties();

	public MypageDao() {

		String fileName = MypageDao.class.getResource("/sql/mypage/mypage-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection con, int uno) {

		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCount");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
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

	public ArrayList<Mynotice> selectList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Mynotice> list = null;
		Mynotice m = null;
		String query = prop.getProperty("selectListMynotice");
		list = new ArrayList<Mynotice>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new Mynotice();
				m.setG_NO(rset.getInt("G_NO"));
				m.setG_DIV(rset.getString("G_DIV"));
				m.setG_CONTEXT(rset.getString("G_CONTEXT"));
				m.setG_DAY(rset.getDate("G_DAY"));
				m.setUSER_ID(rset.getString("USER_ID"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountMOK(Connection con, int uno) {

		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("listCountMOK");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
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

	public ArrayList<MyDeliverNotice> selectDevilerList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyDeliverNotice> list = null;
		MyDeliverNotice m = null;
		String query = prop.getProperty("selectListMyDeliver");
		list = new ArrayList<MyDeliverNotice>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new MyDeliverNotice();
				m.setG_NO(rset.getInt("G_NO"));
				m.setG_DIV(rset.getString("G_DIV"));
				m.setG_CONTEXT(rset.getString("G_CONTEXT"));
				m.setG_DAY(rset.getDate("G_DAY"));
				m.setUSER_ID(rset.getString("USER_ID"));
				m.setD_STATUS(rset.getString("B_STATUS"));
				m.setU_no(rset.getInt("U_NO"));
				list.add(m);

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountReqnotice(Connection con, int uno) {

		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getListCountReqnotice");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
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

	public ArrayList<MyR_M_article> selectRequestNoticeList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyR_M_article> list = null;
		MyR_M_article m = null;
		String query = prop.getProperty("selectRequestNoticeList");
		list = new ArrayList<MyR_M_article>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new MyR_M_article();
				m.setG_div(rset.getString("G_DIV"));
				m.setG_no(rset.getInt("G_NO"));
				m.setG_context(rset.getString("G_CONTEXT"));
				m.setG_day(rset.getDate("G_DAY"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setG_p_div(rset.getString("G_P_DIV"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int getListCountMyMatchingDel(Connection con, int uno) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getListCountMyMatchingDel");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
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

	public ArrayList<MyR_M_article> selectMyMatchingDelList(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyR_M_article> list = null;
		MyR_M_article m = null;
		String query = prop.getProperty("selectMyMatchingDelList");
		list = new ArrayList<MyR_M_article>();
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			while (rset.next()) {
				m = new MyR_M_article();
				m.setG_div(rset.getString("G_DIV"));
				m.setG_no(rset.getInt("G_NO"));
				m.setG_context(rset.getString("G_CONTEXT"));
				m.setG_day(rset.getDate("G_DAY"));
				m.setUser_id(rset.getString("USER_ID"));
				m.setB_status(rset.getString("B_STATUS"));
				list.add(m);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return list;
	}

	public int updateB_status(Connection con, String value, int gno) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateB_status");
		System.out.println("updateB_status실행");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			pstmt.setInt(2, gno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println("updateB_status :"+result);

		return result;
	}

	public ArrayList<SelectReqGisa> SelectReqGisaList(int gno, Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<SelectReqGisa> list = null;
		SelectReqGisa sg = null;
		String query = prop.getProperty("SelectMyReqGisa");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, gno);
			rset = pstmt.executeQuery();
			list = new ArrayList<>();
			while (rset.next()) {
				sg = new SelectReqGisa();
				sg.setUser_id(rset.getString("USER_ID"));
				sg.setUser_name(rset.getString("USER_NAME"));
				sg.setGrade(rset.getInt("GRADE"));
				sg.setU_no(rset.getInt("U_NO"));
				list.add(sg);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public SelectReqGisa SelectDetailGisa(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		SelectReqGisa srg = null;

		String query = prop.getProperty("SelectDetailGisa");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "배송확정");
			pstmt.setInt(2, num);
			pstmt.setInt(3, num);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				srg = new SelectReqGisa();
				srg.setUser_id(rset.getString("USER_ID"));
				srg.setPhone(rset.getString("PHONE"));
				srg.setBasongnujuk(rset.getInt("COUNT"));
				srg.setGrade(rset.getInt("GRADE"));
				srg.setUser_name(rset.getString("USER_NAME"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		return srg;
	}

	public int upReq(int uno, int gno, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query =prop.getProperty("upReq");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, gno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		if(result>0) {
			System.out.println("result1 성공");
		}
		return result;
	}

	public int InserMAT(int uno, int gno, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query =prop.getProperty("InserMAT");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, uno);
			pstmt.setInt(2, gno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		if(result>0) {
			System.out.println("result2 성공");
		}
		return result;
	}

	public int InserShipping(int uno, int gno, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query =prop.getProperty("InserShipping");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1,"매칭완료");
			pstmt.setInt(2, gno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		if(result>0) {
			System.out.println("result3 성공");
		}
		return result;
	}

	public int up_AP(int uno, int gno, Connection con) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query =prop.getProperty("up_AP");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1,"매칭완료");
			pstmt.setInt(2, gno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		if(result>0) {
			System.out.println("result4 성공");
		}
		return result;
	}

	public int selectmoney(Connection con, int gno) {
		PreparedStatement pstmt = null;
		int money = 0;
		ResultSet rset =null;
		String query =prop.getProperty("selectmoney");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1, gno);
			rset=pstmt.executeQuery();
			if(rset.next()) {
			money=rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
			
		}
		System.out.println(money);
		return money;
	}

	public int update_cmoneybd(Connection con, String value, int gno, int uno, int money) {
		PreparedStatement pstmt = null;
		int result =0;
		String query =prop.getProperty("update_cmoneybd");
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setString(1,"지급받은배송료");
			pstmt.setInt(2,money);
			pstmt.setString(3, gno+"번 공고배송");
			pstmt.setInt(4, uno);
			pstmt.setInt(5, gno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			
		}
		System.out.println("싸머인썰:"+result);
		return result;
	}

	public int update_gisainfo(Connection con, String value, int gno, int uno, int money) {
		PreparedStatement pstmt = null;
		int result =0;
		String query =prop.getProperty("update_gisainfo");
		System.out.println(query);
		try {
			pstmt =con.prepareStatement(query);
			pstmt.setInt(1,money);
			pstmt.setInt(2,uno);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}	System.out.println("멤버싸머업뎃:"+result);
		return result;
	}

	public ArrayList<Inquiry> selectListIn(Connection con, int currentPage, int limit, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Inquiry> list = null;
		
		String query = prop.getProperty("selectInquiryMP");
		
		try {
			pstmt = con.prepareStatement(query);
		
			int startRow = (currentPage - 1) * limit + 1;
			int endRow = startRow + limit - 1;
			
			pstmt.setInt(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			

			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Inquiry>();
			
			while(rset.next()) {
				Inquiry m = new Inquiry();
				
				m.setM_no(rset.getInt("M_NO"));
				m.setM_title(rset.getString("M_TITLE"));
				m.setM_context(rset.getString("M_CONTEXT"));
				m.setM_date(rset.getDate("M_DATE"));
				m.setU_no(rset.getString("USER_ID"));
				list.add(m);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
	
		
		return list;
	}

	public ArrayList<MyCharge> ChargeList(Connection con, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyCharge> list = null;
		
		String query = prop.getProperty("chargelist");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<MyCharge>();
			
			while(rset.next()) {
				MyCharge m = new MyCharge();
				
				m.setR_num(rset.getInt("RNUM"));
				m.setCm_div(rset.getString("CM_DIV"));
				m.setCm_date(rset.getDate("CM_DATE"));
				m.setCm_use(rset.getInt("CM_USE"));
				m.setC_money(rset.getInt("C_MONEY"));
				m.setCm_note(rset.getString("CM_NOTE"));
				
				list.add(m);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList<MyExchange> ExchangeList(Connection con, int uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MyExchange> list = null;
		
		String query = prop.getProperty("exchangelist");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, uno);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<MyExchange>();
			
			while(rset.next()) {
				MyExchange ex = new MyExchange();
				
				ex.setrNum(rset.getInt("RNUM"));
				ex.setcDate(rset.getDate("C_DATE"));
				ex.setcMoney(rset.getInt("C_CMONEY"));
				ex.setrMoney(rset.getInt("C_RMONEY"));
				ex.setBankName(rset.getString("BANK_NAME"));
				ex.setBankNum(rset.getString("BANK_NUM"));
				ex.seteStatus(rset.getString("E_STATUS"));
				
				list.add(ex);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public int updateMember(Connection con, String uno,String userPwd, String phone, String email, String bankName) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, userPwd);
			pstmt.setString(2, phone);
			pstmt.setString(3, email);
			pstmt.setString(4, bankName);
			pstmt.setString(5, uno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

	public int leaveMember(Connection con, String uno) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("leaveMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uno);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
	
		return result;
	}

	public ArrayList<String> findGisaImgAddr(Connection con, String uno) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> imgList = new ArrayList<String>();
		
		String query = prop.getProperty("findGisaImgAddr");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, uno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {

				//String first = rset.getString("I_PATH");
				String fileName = rset.getString("I_C_NAME");
				System.out.println(fileName);
				
				imgList.add(fileName);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return imgList;
	}

}
