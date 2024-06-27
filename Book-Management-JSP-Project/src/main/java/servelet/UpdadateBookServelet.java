package servelet;

import DOA.BookDOA;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import DBcon.DatabaseUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

@WebServlet("/update-book")
public class UpdadateBookServelet extends HttpServlet {
 BookDOA bookDAO = new BookDOA(DatabaseUtil.getConnection()); 

 @Override
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     try {
         List<Book> books = bookDAO.getAllBooks();
         String id = request.getParameter("id");
     	String tittle = null, author = null, year = null;
         Statement st = DatabaseUtil.getConnection().createStatement();
     	 ResultSet rs = st.executeQuery("select * from books where id ='"+id+"'");
                         while(rs.next()) {
                        	 tittle = rs.getString("title");
                        	 author = rs.getString("author");
                        	 year = rs.getString("year");
                         }
         request.setAttribute("id", id);
         request.setAttribute("tittle", tittle);
         request.setAttribute("author", author);
         request.setAttribute("year", year);
         request.getRequestDispatcher("update.jsp").forward(request, response);
         
     } catch (SQLException e) {
         throw new ServletException(e);
     } catch (ClassNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
 }

 }
