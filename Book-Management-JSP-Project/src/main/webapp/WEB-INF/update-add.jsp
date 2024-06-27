<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<div class=" card w-50 mx-auto my-5">
                <div class="card-hearder text-center"> ADD BOOK/UPDATE</div>
                <div class="card-body">
                    <form action="books" method="post" value="add">
                    <input type="hidden" name="action" value="add">
                        <div class="form-group">
                            <label> Tittle</label>
                            <input type ="text" class ="form-control" name="tittle">
                        </div>
                        <div class="form-group">
                            <label> Author</label>
                            <input type="text" class ="form-control" name="author">
                        </div>
                        <div class="form-group">
                            <label> Year</label>
                            <input type ="text" class ="form-control" name="year">
                        </div>
                        <div class="text-center">
                            <button type="submit" value="add" class ="btn btn-primary">Add book</>
                        </div>
                        <div class="text-center">
                            <button type="submit" value="update" class ="btn btn-primary">Update</>
                        </div>
                    </form>
                </div>
            </div>

</div>
</body>
</html>