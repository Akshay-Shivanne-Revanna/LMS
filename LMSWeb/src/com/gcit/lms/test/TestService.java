package com.gcit.lms.test;

import java.sql.SQLException;
import java.util.List;

import com.gcit.lms.entity.Author;
import com.gcit.lms.entity.Book;
import com.gcit.lms.entity.Publisher;
import com.gcit.lms.service.AdministratorService;

public class TestService {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		AdministratorService service = new AdministratorService();
		//createAuthor(service);
		//getAllAuthors(service);
		//getAllPublisher(service);
	}

	
	
	/*private static void createAuthor(AdministratorService service) throws ClassNotFoundException, SQLException {
		Author a = new Author();
		
		a.setAuthorName("Testing author from service2");
		service.createAuthor(a);
	}

	private static void getAllPublisher(AdministratorService service) throws ClassNotFoundException, SQLException {
		List<Publisher> publishers = service.getAllPublishers();
		
		for(Publisher p:publishers){
			System.out.println("printing publishers");
			System.out.println(p.getPublisherName());
			System.out.println(p.getPublisherAddress());
			System.out.println(p.getPublisherPhone());
			
			System.out.println("-------------------");
		}
	}
*/
	/*private static void getAllBooks(AdministratorService service) throws ClassNotFoundException, SQLException {
		List<Book> books = service.getAllBooks();
		
		for(Book b:books){
			System.out.println("Book Title" + b.getTitle());
			System.out.println("-------------------");
			if(b.getAuthors()!=null && b.getAuthors().size()>0){
				System.out.println("printing authors of book:");
				
				for(Author a : b.getAuthors()){
					System.out.println(a.getAuthorName());
				}
			}
		}
	}*/
}
