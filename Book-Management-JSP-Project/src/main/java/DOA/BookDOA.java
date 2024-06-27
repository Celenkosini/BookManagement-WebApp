package DOA;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DBcon.DatabaseUtil;
import model.Book;

public class BookDOA {
	
	//get Connection
	private final Connection connection;
	
	 
public BookDOA(Connection connection) {
		this.connection = connection;
	}




//get all books method
 public List<Book> getAllBooks() throws SQLException, ClassNotFoundException {
     List<Book> books = new ArrayList<>();
     String sql = "SELECT * FROM books";
     
     

     try (
          Statement statement = this.connection.createStatement();
          ResultSet resultSet = statement.executeQuery(sql)) {

         while (resultSet.next()) {
             Book book = new Book();
             book.setId(resultSet.getInt("id"));
             book.setTitle(resultSet.getString("title"));
             book.setAuthor(resultSet.getString("author"));
             book.setYear(resultSet.getInt("year"));

             books.add(book);
         }
     }

     return books;
     
 }
 
 
 			//add book method
 public void addBook(Book book) throws SQLException, ClassNotFoundException {
     String sql = "INSERT INTO books (title, author, year) VALUES (?, ?, ?)";

     try (
          PreparedStatement statement = this.connection.prepareStatement(sql)) {

         statement.setString(1, book.getTitle());
         statement.setString(2, book.getAuthor());
         statement.setInt(3, book.getYear());
         statement.executeUpdate();
     }
 }
         //update a book method
 public void updateBook(Book book) throws SQLException, ClassNotFoundException {
     String sql = "UPDATE books SET title = ?, author = ?, year = ? WHERE id = ?";

     try (
          PreparedStatement statement = this.connection.prepareStatement(sql)) {

         statement.setString(1, book.getTitle());
         statement.setString(2, book.getAuthor());
         statement.setInt(3, book.getYear());
         statement.setInt(4, book.getId());
         statement.executeUpdate();
     }
 }
 		//delete a book method
 public void deleteBook(int id) throws SQLException, ClassNotFoundException {
     String sql = "DELETE FROM books WHERE id = ?";

     try (
          PreparedStatement statement = this.connection.prepareStatement(sql)) {

         statement.setInt(1, id);
         statement.executeUpdate();
     }
 }
}

