package com.gcit.lms.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.gcit.lms.entity.Book;
import com.gcit.lms.entity.BookCopies;
import com.gcit.lms.entity.Branch;


public class BookCopiesDAO extends BaseDAO{

	public BookCopiesDAO(Connection conn) {
		super(conn);
	}
	@SuppressWarnings("unchecked")
	//Reading borrower by cardNo.
	public List<BookCopies> readBookCopiesByBranchID(Integer branchId) throws ClassNotFoundException, SQLException{
		
		
		List<BookCopies> brr = (List<BookCopies>) readAll("select * from tbl_book_copies where branchId = ?", new Object[] {branchId});
		if(brr!=null && brr.size() >0){
			return brr;
		}
		return null;
	}
	
	//Updating authors by name.
	public Integer updateBookCopies(BookCopies bc) throws ClassNotFoundException, SQLException{
		return saveWithID("UPDATE tbl_book_copies SET bookId = ?, branchId = ?, noOfCopies = ? WHERE bookId = ? AND branchId= ?", new Object[] {bc.getBook().getBookId(),bc.getBranch().getBranchId(),bc.getNoOfCopies(),bc.getBook().getBookId(),bc.getBranch().getBranchId()});
		}

	@Override
	public List<?> extractData(ResultSet rs) throws SQLException {
		List<BookCopies> bookcopies = new ArrayList<BookCopies>();
		
		while(rs.next()){
			BookCopies bc = new BookCopies();
			bc.setNoOfCopies(rs.getInt("noOfCopies"));
			
			Book b = new Book();
			b.setBookId(rs.getInt("bookId"));
			bc.setBook(b);
			
			Branch lib = new Branch();
			lib.setBranchId(rs.getInt("branchId"));
			bc.setBranch(lib);
			
			//RETRIEVE THE BOOK DETIALS HERE
			
			bookcopies.add(bc);
			
		}
		return bookcopies;
	}

	@Override
	public List<BookCopies> extractDataFirstLevel(ResultSet rs) throws SQLException {
		List<BookCopies> bookcopies = new ArrayList<BookCopies>();
				
		while(rs.next()){
			BookCopies bc = new BookCopies();
			bc.setNoOfCopies(rs.getInt("noOfCopies"));
			
			Book bo = new Book();
			bo.setBookId(rs.getInt("bookId"));
			bc.setBook(bo);
			
			Branch lb = new Branch();
			lb.setBranchId(rs.getInt("branchId"));
			bc.setBranch(lb);
			
			
			bookcopies.add(bc);
			
		}
		return bookcopies;
	}

}
