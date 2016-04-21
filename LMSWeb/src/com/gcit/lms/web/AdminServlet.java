package com.gcit.lms.web;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcit.lms.entity.Author;
import com.gcit.lms.entity.Book;
import com.gcit.lms.entity.BookCopies;
import com.gcit.lms.entity.BookLoans;
import com.gcit.lms.entity.Borrower;
import com.gcit.lms.entity.Branch;
import com.gcit.lms.entity.Genre;
import com.gcit.lms.entity.Publisher;
import com.gcit.lms.service.AdministratorService;
import com.gcit.lms.service.LibrarianService;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet({ "/addAuthor", "/viewAuthor", "/addBook", "/editAuthor", "/deleteAuthor","/addPublisher","/editPublisher","/updatePublisher","/addBranch" ,"/updateBranch","/editBranch","/addBorrower","/editBorrower","/updateBorrower","/deletePublisher","/deleteBranch","/deleteBorrower","/selectBranch","/updateBook","/deleteBook","/editBook","/checkCardNo","/updateBookCopies","/bookcheckIn","/borrowerBranch","/checkCardNo2","/borrowerCheckout","/branchbookscheckoutTable","/editborrower","/updateAuthor"})
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public AdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reqUrl = request.getRequestURI().substring(request.getContextPath().length(),
				request.getRequestURI().length());
		switch (reqUrl) {
		case "/editAuthor":
			editAuthor(request, response);
			break;
			
		case "/deleteAuthor":
			deleteAuthor(request, response);
			break;
		
		case "/editPublisher":
				editPublisher(request,response);
				break;
				
		case "/deletePublisher" :
				deletePublisher(request,response);
				break;
				
		case "/editBranch" :
				editBranch(request,response);
				break;
				
		case "/deleteBranch" :
				deleteBranch(request,response);
				break;
				
				
		case "/editBorrower" :
				editBorrower(request,response);
				break;
				
		case "/deleteBorrower" :
				deleteBorrower(request,response);
				break;
				
		case "/deleteBook" :
			System.out.println("in case");
				deleteBook(request,response);
				break;
				
		case "/editBook" :
				editBook(request,response);
				break;
				
				
		case "/bookcheckIn" :
				bookcheckIn(request,response);
				break;	
		
				
		case "/borrowerBranch":
			   borrowerBranch(request,response);
				break;
		
		case "/borrowerCheckout":
			try {
				borrowerCheckout(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				break;
				
				
		default:
			break;
		}
	}


	


	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String reqUrl = request.getRequestURI().substring(request.getContextPath().length(),
				request.getRequestURI().length());
		switch (reqUrl) {
		case "/addAuthor":
			addAuthor(request, response);
			break;
			
		case "/addPublisher":
				addPublisher(request,response);
				break;
		case "/addBook":
				addBook(request,response);
				break;
		case "/updatePublisher":
				updatePublisher(request,response);
				break;
		case "/addBranch" : 
				addBranch(request,response);
				break;
		case "/updateBranch" :
				updateBranch(request,response);
				break;
		case "/addBorrower" :
				addBorrower(request, response);
				break;
		case "/updateBorrower":
				updateBorrower(request, response);
				break;
		case "/selectBranch":
				selectBranch(request,response);
				break;
		case "/updateBook":
				updateBook(request,response);
				break;
				
		case "/updateAuthor":
				updateAuthor(request,response);
				break;		
				
				
		case "/checkCardNo":
				checkCardNo(request,response);
				break;
				
		case "/checkCardNo2":
				checkCardNo2(request,response);
				break;
		
	
		case "/updateBookCopies":
				updateBookCopies(request,response);
				break;
				
		
		default:
			break;
		}
	}
	


	//DELETE AUTHOR
	private void deleteAuthor(HttpServletRequest request, HttpServletResponse response) {
		Integer authorId = Integer.parseInt(request.getParameter("authorId"));
		AdministratorService service = new AdministratorService();
		StringBuilder str = new StringBuilder();
		try {
			service.deleteAuthor(authorId);
			List<Author> authors = service.getAllAuthors();
			
			str.append("<tr><th>Author Name</th><th>Book Title</th><th>Edit</th><th>Delete</th></tr>");
			for(Author a: authors){
				str.append("<tr><td>"+a.getAuthorName()+"</td><td>Book Name</td>");
				str.append("<td>");
				if(a.getBooks()!=null && a.getBooks().size() >0){
					for(Book b: a.getBooks()){
						str.append(b.getTitle()+",");
					}
				}
				str.append("<td><button type='button' onclick='javascript:location.href='editAuthor?authorId="+a.getAuthorId()+"''>EDIT</button><td>"
							+ "<button type='button' onclick='deleteAuthor("+a.getAuthorId()+")'>DELETE</button></tr>)");
			
			}
			
			request.setAttribute("result", "Author Deleted Sucessfully");
			RequestDispatcher rd = request.getRequestDispatcher("viewauthors.jsp");
			try {
			rd.forward(request, response);
			} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
						
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			response.getWriter().append(str.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//DELETE BORROWER
	private void deleteBorrower(HttpServletRequest request,
			HttpServletResponse response) {
		Integer cardNo = Integer.parseInt(request.getParameter("cardNo"));
		AdministratorService service = new AdministratorService();
		StringBuilder str = new StringBuilder();
		Borrower bor = new Borrower();
		bor.setCardNo(cardNo);
		
		try {
			service.deleteBorrower(bor);
			List<Borrower> borrowers = service.getAllBorrowers();
			str.append("<tr><th>borrower name</th><th>address</th><th>phone</th><th>Edit</th><th>Delete</th></tr>");
			for(Borrower b: borrowers){
				str.append("<tr><td>"+b.getName()+"</td><td>"+b.getAddress()+"</td><td>"+b.getPhone()+"</td>");
				str.append("<td><button type='button' onclick='javascript:location.href='editBorrower?cardNo="+b.getCardNo()+"''>EDIT</button><td>"+"<button type='button' onclick='deleteBorrower("+b.getCardNo()+")'>DELETE</button></tr>");
		}   
			
			
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			response.getWriter().append(str.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
	}
	
	//DELETE BOOK
	private void deleteBook(HttpServletRequest request,
			HttpServletResponse response) {
		
		Integer BookId = Integer.parseInt(request.getParameter("bookId"));
		AdministratorService service = new AdministratorService();
		StringBuilder str = new StringBuilder();
		Book b = new Book();
		b.setBookId(BookId);
		
		try {
			
			service.deleteBook(b);
			List<Book> books = service.getAllBooks();
			str.append("<tr><th>Book Title</th><th>Author</th><th>Edit</th><th>Delete</th>");
			for(Book bk: books){
				str.append("<tr><td>"+bk.getTitle()+"</td><td>"+bk.getAuthors()+"</td>");
				str.append("<td><button type='button' onclick='javascript:location.href='editBook?bookId="+b.getBookId()+"''>EDIT</button><td><button type='button' onclick='deleteBook("+b.getBookId()+")'>DELETE</button></tr>");
			}   
			
			/*<%for (Book b: books){ %>
			<tr>
			<td><% out.println(b.getTitle()); %></td>
			<td><%if(b.getAuthors()!=null && b.getAuthors().size() >0){
				for(Author a: b.getAuthors()){
					out.println(a.getAuthorName());
					out.println(", ");
				}
			}	
			%></td>*/
			
			request.setAttribute("result", "Book Deleted Sucessfully");
//			RequestDispatcher rd = request.getRequestDispatcher("viewbook.jsp");
			/*try {
			rd.forward(request, response);
			} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}*/
		
						
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		try {
			response.getWriter().append(str.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//DELETE PUBLISHER
	private void deletePublisher(HttpServletRequest request, HttpServletResponse response) {
		
		Integer publisherId = Integer.parseInt(request.getParameter("publisherId"));
		AdministratorService service = new AdministratorService();
		StringBuilder str = new StringBuilder();
		Publisher pb = new Publisher();
		pb.setPublisherId(publisherId);
		
		try {
			service.deletePublisher(pb);
			List<Publisher> publishers = service.getAllPublishers();
			str.append("<tr><th>Publisher Name</th><th>Publisher Address</th><th>Publisher Phone</th><th>Edit</th><th>Delete</th></tr>");
			for(Publisher p: publishers){
				str.append("<tr><td>"+p.getPublisherName()+"</td><td>"+p.getPublisherAddress()+"</td><td>"+p.getPublisherPhone()+"</td>");
				str.append("<td><button type='button' onclick='javascript:location.href='editPublisher?publisherId="+p.getPublisherId()+"''>EDIT</button><td>"+"<button type='button' onclick='deleteAuthor("+p.getPublisherId()+")'>DELETE</button></tr>");
		}   
		
					
			
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			response.getWriter().append(str.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	
	}
	
	//DELETE BRANCH
	private void deleteBranch(HttpServletRequest request,
			HttpServletResponse response) {
		Integer branchId = Integer.parseInt(request.getParameter("branchId"));
		AdministratorService service = new AdministratorService();
		StringBuilder str = new StringBuilder();
		Branch brch = new Branch();
		brch.setBranchId(branchId);
		try {
			
			service.deleteBranch(brch);
			List<Branch> branch = service.getAllBranches();
			str.append("<tr><th>Branch Name</th><th>Branch Address</th><th>Edit</th><th>Delete</th></tr>");
			
			for(Branch br: branch){
				str.append("<tr><td>"+br.getBranchName()+"</td><td>"+br.getBranchAddress()+"</td>");
				str.append("<td><button type='button' onclick='javascript:location.href='editbranch?branchId="+br.getBranchId()+"''>EDIT</button><td>"+"<button type='button' onclick='deleteBranch("+br.getBranchId()+")'>DELETE</button></tr>");
		}
		}catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			response.getWriter().append(str.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
		
	}
	
	//EDIT AUTHOR
	private void editAuthor(HttpServletRequest request, HttpServletResponse response){
		Integer authorId = Integer.parseInt(request.getParameter("authorId"));
		AdministratorService service = new AdministratorService();
		Author author = null;
		try {
			author = service.getAuthorByID(authorId);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("author", author);
		RequestDispatcher rd = request.getRequestDispatcher("editauthor.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//EDIT BOOK
	private void editBook(HttpServletRequest request, HttpServletResponse response){
			Integer bookId = Integer.parseInt(request.getParameter("bookId"));
			AdministratorService service = new AdministratorService();
			Book book = null;
			try {
				book = service.getBookByID(bookId);
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			request.setAttribute("book", book);
			RequestDispatcher rd = request.getRequestDispatcher("editbook.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
	//EDIT BORROWER
	private void editBorrower(HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println(" i am inside borrower");
		Integer cardNo = Integer.parseInt(request.getParameter("cardNo"));
		AdministratorService service = new AdministratorService();
		Borrower borrower = null;
		try {
			borrower = service.getBorrowerByID(cardNo);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("borrower", borrower);
		RequestDispatcher rd = request.getRequestDispatcher("/editborrower.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//EDIT BRANCH
	private void editBranch(HttpServletRequest request,
			HttpServletResponse response) {
		
		Integer branchId = Integer.parseInt(request.getParameter("branchId"));
		AdministratorService service = new AdministratorService();
		Branch branch = null;
		try {
			branch = service.getBranchByID(branchId);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("branch", branch);
		RequestDispatcher rd = request.getRequestDispatcher("editbranch.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//SELECT BRANCH
	private void selectBranch(HttpServletRequest request, HttpServletResponse response){
		int branchId = Integer.parseInt(request.getParameter("branchId"));
		AdministratorService service = new AdministratorService();
		List<BookCopies> bc = null;
		
		try {
			bc = service.getBookCopiesByBranchID(branchId);
		} catch (ClassNotFoundException | SQLException e1) {
			e1.printStackTrace();
		}
		request.setAttribute("bookCopies", bc);
		RequestDispatcher rd = request.getRequestDispatcher("librarianOptions.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}

	//UPDATE BOOK COPIES
	private void updateBookCopies(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		AdministratorService service = new AdministratorService();
		String returnPath = "/administrator.html";
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		int branchId = Integer.parseInt(request.getParameter("branchId"));
		int noOfCopies = Integer.parseInt(request.getParameter("noOfCopies"));
		String addAuthorResult = "";

		if (bookId >0) {
			BookCopies bc=new BookCopies();
			bc.setNoOfCopies(noOfCopies);
			Book a = new Book();
			a.setBookId(bookId);
			bc.setBook(a);
			Branch lib = new Branch();
			lib.setBranchId(branchId);
			bc.setBranch(lib);
			
			try {
				service.editBookCopies(bc);
				returnPath = "/libops.html";
				addAuthorResult = "Book Copies edited sucessfully.";
			} catch (ClassNotFoundException | SQLException e) {
				returnPath = "/librarianOptions.jsp";
				addAuthorResult = "Book copies edit failed";
				e.printStackTrace();
			}
		} else {
			returnPath = "/addauthor.jsp";
			addAuthorResult = "Author Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addAuthorResult);
		rd.forward(request, response);
	}
	
	//EDIT PUBLISHER
	private void editPublisher(HttpServletRequest request,
			HttpServletResponse response) {
		Integer publisherId = Integer.parseInt(request.getParameter("publisherId"));
		
		AdministratorService service = new AdministratorService();
		Publisher publisher =null;
		try {
			publisher = service.getPublisherByID(publisherId);
			System.out.println(publisher);
		} catch (ClassNotFoundException | SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		request.setAttribute("publisher", publisher);
		RequestDispatcher rd = request.getRequestDispatcher("editpublisher.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//UPDATE AUTHOR
	private void updateAuthor(HttpServletRequest request,
				HttpServletResponse response) {
			AdministratorService service = new AdministratorService();
			Integer authorId = Integer.parseInt(request.getParameter("authorId"));
			String returnPath = "/viewauthors.jsp";
			String authorName = request.getParameter("authorName");
			String addAuthorResult="";
			System.out.println("in update author");
			if (authorName != null && authorName.length() > 3 && authorName.length() < 45) {
				Author a = new Author();
				a.setAuthorId(authorId);
				a.setAuthorName(authorName);
				try{
					service.updateAuthor(a);
					returnPath = "/viewauthors.jsp";
					addAuthorResult = "Author details updated sucessfully.";
				}catch (ClassNotFoundException | SQLException e) {
					returnPath = "/editAuthor.jsp";
					addAuthorResult = "Author update failed";
					e.printStackTrace();
				}
				
			}else {
				returnPath = "/editauthor.jsp";
				addAuthorResult = "Author Name cannot be empty or more than 45 chars in length";
			}
			RequestDispatcher rd = request.getRequestDispatcher(returnPath);
			request.setAttribute("result", addAuthorResult);
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	//ADD AUTHOR
	private void addAuthor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdministratorService service = new AdministratorService();
		String returnPath = "/administrator.html";
		System.out.println("Hello Post");
		String authorName = request.getParameter("authorName");
		String addAuthorResult = "";
		if (authorName != null && authorName.length() > 3 && authorName.length() < 45) {
			Author a = new Author();
			a.setAuthorName(authorName);
			try {
				service.createAuthor(a);
				returnPath = "/author.html"; 
				addAuthorResult = "Author added sucessfully.";
				
			} catch (ClassNotFoundException | SQLException e) {
				returnPath = "/addauthor.jsp";
				addAuthorResult = "Author add failed";
				
				e.printStackTrace();
			}
		} else {
			
			addAuthorResult = "Author Name cannot be empty or more than 45 chars in length";
			returnPath = "/addauthor.jsp";
			
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addAuthorResult);
		rd.forward(request, response);
	}
	
	//VALIDATE CARD NO 
	private void checkCardNo(HttpServletRequest request, HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		String returnPath = "/administrator.html";
		System.out.println("Hello Post");
		String cardNo = request.getParameter("cardNo");
		String addAuthorResult = null;
		
		int cardN = Integer.parseInt(cardNo);
		if (cardN != 0) {
			
			try {
				//System.out.println("result of verification :" + b);

				if (service.verifyCard(cardN)) {
					System.out.println("the result was true");
					request.setAttribute("cardNo", cardN);
					RequestDispatcher rd = request.getRequestDispatcher("DisplayBorrowerBooks.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else {
					System.out.println("invalid");
					RequestDispatcher rd = request.getRequestDispatcher("aborrower.jsp");
					
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			} catch (ClassNotFoundException | SQLException e) {
				returnPath = "/aborrower.jsp";
				addAuthorResult = "Card verification failed";
				e.printStackTrace();
			}
		}
			
}
	
	//VALIDATE CARD NO
	private void checkCardNo2(HttpServletRequest request, HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		String returnPath = "/administrator.html";
		System.out.println("Hello Post");
		String cardNo = request.getParameter("cardNo");
		String addAuthorResult = null;
		
		int cardN = Integer.parseInt(cardNo);
		if (cardN != 0) {
			
			try {
				//System.out.println("result of verification :" + b);

				if (service.verifyCard(cardN)) {
					System.out.println("the result was true");
					request.setAttribute("cardNo", cardN);
					RequestDispatcher rd = request.getRequestDispatcher("borrowerbranch.jsp");
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				} else {
					System.out.println("invalid");
					RequestDispatcher rd = request.getRequestDispatcher("aborrower1.jsp");
					
					try {
						rd.forward(request, response);
					} catch (ServletException | IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

			} catch (ClassNotFoundException | SQLException e) {
				returnPath = "/aborrower1.jsp";
				addAuthorResult = "Card verification failed";
				e.printStackTrace();
			}
		}
			
}
	
	//BOOK CHECK IN
	private void bookcheckIn(HttpServletRequest request,
			HttpServletResponse response) {
		
		AdministratorService service = new AdministratorService();
		String returnPath = "/aborrower.jsp";
		System.out.println("Hello Post");
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		System.out.println(bookId + "in servlet");
		
		Integer cardNo = Integer.parseInt(request.getParameter("cardNo"));
		System.out.println(cardNo + "in servlet");
		String addAuthorResult = null;
		
		
		if (bookId != 0) {
			
			try {
				service.bookCheckIn(bookId,cardNo);
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			System.out.println("the result was true");
			RequestDispatcher rd = request.getRequestDispatcher("DisplayBorrowerBooks.jsp");
			try {
				rd.forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	

			
		}
		
		
	}
	
	//BOOK CHECK OUT
	private void borrowerBranch(HttpServletRequest request,	HttpServletResponse response) {
		int branchId = Integer.parseInt(request.getParameter("branchId"));
		int cardNo = Integer.parseInt(request.getParameter("cardNo"));
		System.out.println("sdgdsg");
		request.setAttribute("branchId", branchId);
		request.setAttribute("cardNo", cardNo);
		RequestDispatcher rd = request.getRequestDispatcher("borrowerbookoptions.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}
	
	//CHECKOUT
	private void borrowerCheckout(HttpServletRequest request,
				HttpServletResponse response) throws ClassNotFoundException, SQLException {
			
			AdministratorService service = new AdministratorService();
			String returnPath = "/borroweroptions";
			System.out.println("Hello Post");
			int branchId = Integer.parseInt(request.getParameter("branchId"));
			int cardNo = Integer.parseInt(request.getParameter("cardNo"));
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			
			System.out.println(bookId + "incheckin");
			System.out.println(cardNo + "incheckin");
			System.out.println(branchId + "incheckin");
			if (bookId != 0) {
				
				service.bookCheckOut(bookId,cardNo,branchId);
				System.out.println("the result was true");
				RequestDispatcher rd = request.getRequestDispatcher("borrower.html");
				try {
					rd.forward(request, response);
				} catch (ServletException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		

				
			}
			
		}
	
	//ADD BOOK
	private void addBook(HttpServletRequest request,
			HttpServletResponse response) {

		AdministratorService service = new AdministratorService();
		String returnPath = "/administrator.html";
		Integer branchId = Integer.parseInt(request.getParameter("branchId"));
		String[] authorId = request.getParameterValues("authorId");
		String[] genre_id = request.getParameterValues("genre_id");
		Integer pubId = Integer.parseInt(request.getParameter("pubId"));
		String bookTitle = request.getParameter("bookTitle");
		String addBookResult = "";
		
		if (bookTitle != null && bookTitle.length() > 3 && bookTitle.length() < 45) {
			
			Book b = new Book();
			b.setTitle(bookTitle);
			Publisher p = new Publisher();
			p.setPublisherId(pubId);
			b.setPublisher(p);
			List<Author> authors = new ArrayList<Author>();
			for(String aid:authorId){
				Author a = new Author();
				a.setAuthorId(Integer.parseInt(aid));
				authors.add(a);
			}
			b.setAuthors(authors);
			
			List<Genre> genres = new ArrayList<Genre>();
			for(String gid:genre_id){
				Genre g = new Genre();
				g.setGenreId(Integer.parseInt(gid));
				genres.add(g);
			}
			b.setGenres(genres);
			
			try{
				System.out.println("i am here");
				service.createBookAuthor(b);
				
				returnPath = "/viewbook.jsp";
				addBookResult = "Author added sucessfully.";
				
			}catch (ClassNotFoundException | SQLException e) {
				returnPath = "/addauthor.jsp";
				addBookResult = "Author add failed";
				e.printStackTrace();
			}
			
			
		} else {
			returnPath = "/addauthor.jsp";
			addBookResult = "Author Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addBookResult);
		try {
			rd.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//ADD BORROWER
	private void addBorrower(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AdministratorService service = new AdministratorService();
		
		String returnPath = "/borrower.html";
		String name = request.getParameter("borrowerName");
		String address = request.getParameter("borrowerAddress");
		String phone = request.getParameter("borrowerPhone");
	
		String addBorrowerResult = "";
		if (name != null && name.length() > 3 && name.length() < 45) {
			Borrower b = new Borrower();
			b.setName(name);
			b.setAddress(address);
			b.setPhone(phone);
			
			try {
				service.createBorrower(b);
				returnPath = "/viewborrower.jsp";     //check page navigation later
				addBorrowerResult = "Borrower added sucessfully.";
			} catch (ClassNotFoundException | SQLException e) {
				returnPath = "/addborrower.jsp";
				addBorrowerResult = "Borrower add failed";
				e.printStackTrace();
			}
		} else {
			returnPath = "/addborrower.jsp";
			addBorrowerResult = "Borrower Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addBorrowerResult);
		rd.forward(request, response);
	}
	
	//ADD PUBLISHER
	private void addPublisher(HttpServletRequest request,
			HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		
		String returnPath = "/administrator.html";
		String publisherName = request.getParameter("publisherName");
		String publisherAddress = request.getParameter("publisherAddress");
		String publisherPhone = request.getParameter("publisherPhone");
		String addpublisherResult="";
		
		if (publisherName != null && publisherName.length() > 3 && publisherName.length() < 45) {
			Publisher p = new Publisher();
			p.setPublisherName(publisherName);
			p.setPublisherAddress(publisherAddress);
			p.setPublisherPhone(publisherPhone);
			
			try{
				service.createPublisher(p);
				returnPath = "/publisher.html";
				addpublisherResult = "Publisher added sucessfully.";
			}catch (ClassNotFoundException | SQLException e) {
				returnPath = "/addpublisher.jsp";
				addpublisherResult = "publisher add failed";
				e.printStackTrace();
			}
			
		}else {
			returnPath = "/addpublisher.jsp";
			addpublisherResult = "publisher Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addpublisherResult);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	//ADD BRANCH
	private void addBranch(HttpServletRequest request,
			HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		
		String returnPath = "/branch.html";
		String branchName = request.getParameter("branchName");
		String branchAddress = request.getParameter("branchAddress");
		String addbranchResult="";
		
		
		
		if (branchName != null && branchName.length() > 3 && branchName.length() < 45) {
			Branch br = new Branch();
			br.setBranchName(branchName);
			br.setBranchAddress(branchAddress);
			
			
			try{
				System.out.println("inside add branvh");
				service.createBranch(br);
				returnPath = "/branch.html";
				addbranchResult = "Branch added sucessfully.";
			}catch (ClassNotFoundException | SQLException e) {
				returnPath = "/addbranch.jsp";
				addbranchResult = "Branch add failed";
				e.printStackTrace();
			}
			
		}else {
			returnPath = "/addbranch.jsp";
			addbranchResult = "Branch Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addbranchResult);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//UPDATE PUBLISHER
	private void updatePublisher(HttpServletRequest request,
			HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		Integer publisherId = Integer.parseInt(request.getParameter("publisherId"));
		String returnPath = "/publisher.html";
		String publisherName = request.getParameter("publisherName");
		String publisherAddress = request.getParameter("publisherAddress");
		String publisherPhone = request.getParameter("publisherPhone");
		
		
		String publisherUpdatedResult="";
		
		if (publisherName != null && publisherName.length() > 3 && publisherName.length() < 45) {
			Publisher p = new Publisher();
			p.setPublisherName(publisherName);
			p.setPublisherAddress(publisherAddress);
			p.setPublisherPhone(publisherPhone);
			p.setPublisherId(publisherId);
			//p.setPublisherId(publisherId);
			
			try{
				service.updatePublisher(p);
				returnPath = "/publisher.html";
				publisherUpdatedResult = "Publisher updated sucessfully.";
			}catch (ClassNotFoundException | SQLException e) {
				returnPath = "/editpublisher.jsp";
				publisherUpdatedResult = "publisher update failed";
				e.printStackTrace();
			}
			
		}else {
			returnPath = "/editpublisher.jsp";
			publisherUpdatedResult = "publisher Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", publisherUpdatedResult);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//UPDATE BRANCH
	private void updateBranch(HttpServletRequest request,
			HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		Integer branchId = Integer.parseInt(request.getParameter("branchId"));
		String returnPath = "/branch.html";
		String branchName = request.getParameter("branchName");
		String branchAddress = request.getParameter("branchAddress");
		String addBranchResult="";
		
		if (branchName != null && branchName.length() > 3 && branchName.length() < 45) {
			Branch br = new Branch();
			br.setBranchName(branchName);
			br.setBranchAddress(branchAddress);
			br.setBranchId(branchId);
			
			try{
				service.updateBranch(br);
				returnPath = "/viewbranch.jsp";
				addBranchResult = "Branch details updated sucessfully.";
			}catch (ClassNotFoundException | SQLException e) {
				returnPath = "/editbranch.jsp";
				addBranchResult = "publisher update failed";
				e.printStackTrace();
			}
			
		}else {
			returnPath = "/editbranch.jsp";
			addBranchResult = "branch Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addBranchResult);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//UPDATE BOOK
	private void updateBook(HttpServletRequest request,
			HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		String returnPath = "/branch.html";
		Integer bookId = Integer.parseInt(request.getParameter("bookId"));
		String title = request.getParameter("title");
		String addBranchResult="";
		
		if (title != null && title.length() > 3 && title.length() < 45) {
			Book b = new Book();
			b.setBookId(bookId);
			b.setTitle(title);
			
			try{
				service.updateBook(b);
				returnPath = "/viewbook.jsp";
				addBranchResult = "Book details updated sucessfully.";
			}catch (ClassNotFoundException | SQLException e) {
				returnPath = "/editbook.jsp";
				addBranchResult = "book update failed";
				e.printStackTrace();
			}
			
		}else {
			returnPath = "/editbook.jsp";
			addBranchResult = "Book Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addBranchResult);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//UPDATE BORROWER
	private void updateBorrower(HttpServletRequest request,
			HttpServletResponse response) {
		AdministratorService service = new AdministratorService();
		Integer cardNo = Integer.parseInt(request.getParameter("cardNo"));
		String returnPath = "/borrower.html";
		String name = request.getParameter("borrowerName");
		String address = request.getParameter("borrowerAddress");
		String phone = request.getParameter("borrowerPhone");
		String addBranchResult="";
		
		if (name != null && name.length() > 3 && name.length() < 45) {
			Borrower b = new Borrower();
			b.setName(name);
			b.setAddress(address);
			b.setPhone(phone);
			b.setCardNo(cardNo);
			try{
				service.updateBorrower(b);
				returnPath = "/viewborrower.jsp";
				addBranchResult = "Borrower details updated sucessfully.";
			}catch (ClassNotFoundException | SQLException e) {
				returnPath = "/editborrower.jsp";
				addBranchResult = "Borrower update failed";
				e.printStackTrace();
			}
			
		}else {
			returnPath = "/editborrower.jsp";
			addBranchResult = "Borrower Name cannot be empty or more than 45 chars in length";
		}
		RequestDispatcher rd = request.getRequestDispatcher(returnPath);
		request.setAttribute("result", addBranchResult);
		try {
			rd.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
