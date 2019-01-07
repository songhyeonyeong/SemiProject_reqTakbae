package com.kh.jinkuk.border.report.model.service;

import java.sql.Connection;

import com.kh.jinkuk.border.report.model.dao.ReportDao;
import com.kh.jinkuk.border.report.model.vo.Report;
import static com.kh.jinkuk.common.JDBCTemplate.*;

public class ReportService {

	public int insertReport(Report r) {
		Connection con = getConnection();
		
		int result = new ReportDao().insertReport(con, r);
		int up = new ReportDao().upMember(con, r);
		
		if(result > 0 && up > 0) {
			commit(con);
			
			close(con);
			return 1;
		}else {
			rollback(con);
			
			close(con);
			return 0;
		}
		
		
		
		
		
	}

}
