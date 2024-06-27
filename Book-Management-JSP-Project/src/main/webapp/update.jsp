<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page import="model.Book"%>
<%@ page import="DOA.BookDOA"%>
<%@ page import="DBcon.DatabaseUtil"%>
 <%@page import="java.util.List"%>
  <%@page import="java.sql.*"%>
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>update</title>
  
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<div class="container">


<div class=" card w-50 mx-auto my-5">
                <div class="card-hearder text-center"> UPDATE </div>
                <div class="card-body">
                    <form action="books" method="post" value="update">
                    <input type="hidden" name="action" value="update">
                   
                    	 <div class="form-group">
                            <label> ID</label>
                            <input type ="text" class ="form-control" name="id" value="${id}">
                        </div>
                        <div class="form-group">
                            <label> Tittle</label>
                            <input type ="text" class ="form-control" name="title" value="${tittle}">
                        </div>
                        <div class="form-group">
                            <label> Author</label>
                            <input type="text" class ="form-control" name="author"  value="${author}">
                        </div>
                        <div class="form-group">
                            <label> Year</label>
                            <input type ="text" class ="form-control" name="year"  value="${year}">
                        </div>
                        <div class="text-center">
                            <button type="submit" value="update" class ="btn btn-primary">update</>
                        </div>
        			
                    	
                    </form>
                </div>
     
            </div>
            
                    
</div>
</body>
</html>