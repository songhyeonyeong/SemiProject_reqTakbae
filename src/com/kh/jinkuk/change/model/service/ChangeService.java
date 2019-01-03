package com.kh.jinkuk.change.model.service;

import java.sql.Connection;

import com.kh.jinkuk.change.model.dao.ChangeDao;
import com.kh.jinkuk.change.model.vo.Change;
import static com.kh.jinkuk.common.JDBCTemplate.*;

public class ChangeService {

	public int InsertChange(Change c) {
		Connection con = getConnection();
		
		int result = new ChangeDao().InsertChange(con, c);
		
		int up = new ChangeDao().UpdateMoney(con, c);
		
		if(result > 0 && up >0) {
			commit(con);
			int cyberInsert = new ChangeDao().CyberInsert(con, c);
			if(cyberInsert >0) commit(con);
			rollback(con);
			
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}


}
