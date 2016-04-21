package com.gcit.lms.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.gcit.lms.dao.AuthorDAO;
import com.gcit.lms.dao.BranchDAO;
import com.gcit.lms.entity.Author;
import com.gcit.lms.entity.Branch;

public class LibrarianService {

	
	public List<Branch> getAllbranches() throws SQLException, ClassNotFoundException{
		
		ConnectionUtil c = new ConnectionUtil();
		Connection conn = c.getConnection();
		try{
			BranchDAO brdao = new BranchDAO(conn);
			return brdao.readAllBranches();
		}catch (Exception e){
			e.printStackTrace();
		}finally{
			conn.close();
		}
		return null;
	}
	
	
	

	
}
