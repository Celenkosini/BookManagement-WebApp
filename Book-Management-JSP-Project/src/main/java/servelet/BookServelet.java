package servelet;

import DOA.BookDOA;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBcon.DatabaseUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/books")
public class BookServelet extends HttpServlet {
 BookDOA bookDAO = new BookDOA(DatabaseUtil.getConnection()); 

 @Override
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String action = request.getParameter("action");
     PrintWriter out = response.getWriter();

     try {
    	 //add new book into table
         if ("add".equals(action)) {
             String title = request.getParameter("tittle");
             String author = request.getParameter("author");
             int year = Integer.parseInt(request.getParameter("year"));

             Book book = new Book();
             book.setTitle(title);
             book.setAuthor(author);
             book.setYear(year);

             bookDAO.addBook(book);
             
             //update a book on the table
         } else if ("update".equals(action)) {
             int id = Integer.parseInt(request.getParameter("id"));
             String title = request.getParameter("title");
             String author = request.getParameter("author");
             int year = Integer.parseInt(request.getParameter("year"));

             Book book = new Book();
             book.setId(id);
             book.setTitle(title);
             book.setAuthor(author);
             book.setYear(year);

             bookDAO.updateBook(book);
             
             //delete book on the table
         } else if ("delete".equals(action)) {
             int id = Integer.parseInt(request.getParameter("id"));
             bookDAO.deleteBook(id);
         }

         response.sendRedirect("books");
     } catch (SQLException e) {
         throw new ServletException(e);
     } catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 }
}
