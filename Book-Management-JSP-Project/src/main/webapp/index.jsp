<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import="java.util.List"%>
<%@ page import="model.Book"%>
<%@ page import="DOA.BookDOA"%>
<%@ page import="DBcon.DatabaseUtil"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book mangement system index</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<div class = "container">
		<div class="card-header my-3">BOOK LIST</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">TITTLE</th>
					<th scope="col">AUTHOR</th>
					<th scope="col">YEAR</th>
					<th scope="col">ACTIONS</th>
				</tr>
			</thead>
			<tbody>
			<%
			BookDOA bookDAO = new BookDOA(DatabaseUtil.getConnection());
			List<Book> books = bookDAO.getAllBooks();
			if(!books.isEmpty()){
				for(Book b:books){%>
					
					<tr>
            			<td><%=b.getId() %></td>
            			<td><%=b.getTitle() %></td>
            			<td><%=b.getAuthor()%></td>
            			<td><%=b.getYear()%></td>
            			<td>
                			<form action="books" method="post" style="display:inline;">
                    			<input type="hidden" name="id" value="<%=b.getId()%>" >
                    			<input type="hidden" name="action" value="delete">
                    			<input type="submit" value="Delete">
                			</form>
                			<form action="books" method="post" style="display:inline;">
                    			<input type="hidden" name="id" value="<%=b.getId()%>">
                    			 <a class ="btn btn-primary" href="update-book?id=<%=b.getId()%>" >update</a>
                			</form>
            			</td>
       				 </tr>
					
					
				<% }
			}
			%>
			 </tbody>
			 </table>
					<div class="text-center">
                            <a class ="btn btn-primary" href="add.jsp">Add book</a>
                        </div>
                        </div>
                        
                       
</body>
</html>