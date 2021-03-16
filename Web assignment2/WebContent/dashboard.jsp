<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
Statement statement = null;
ResultSet resultSet = null;
%>
<html lang="en">
<head>
    <title>Dashboard</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand">JSP Basic</a>
    </div>
</nav>

<div class="container">
    <div class="jumbotron text-center">
        <h1>Dashboard</h1>
        <%
			if(session.getAttribute("name")!=null && session.getAttribute("username")!="")
			{
			String user = session.getAttribute("name").toString();
			%>
			<h4>Welcome <b><%= user%>!</b></h4>
			<%
			}
		%>
    </div>
    <hr>
    <u><h2 class="mt-3" align="Center">Update your information</h2></u>
    <div>
        <form method="POST" action="RegistrationProcessor.jsp">
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" class="form-control" name="fname" required>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" class="form-control" name="lname" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="form-group">
                        <label>Language</label>
                        <input type="text" class="form-control" name="fname" required>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label>Age</label>
                        <input type="text" class="form-control" name="lname" required>
                    </div>
                </div>
                <div class="col">
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" class="form-control" name="lname" required>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>Email address</label>
                <input type="email" class="form-control" name="email" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <button type="submit" class="btn btn-success btn-block">Update Information</button>
        </form>
    </div>
    <hr>
	<u><h2 class="mt-3" align="Center">Enroll To A Course</h2></u>
	<table class="table">
	  <thead class="thead-dark">
	    <tr>
	      <th scope="col">Course ID</th>
	      <th scope="col">Name</th>
	      <th scope="col">Enrollment</th>
	    </tr>
	  </thead>
	  <tbody>
	    <%
			try{
			Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/assignment", "postgres", "sadik1234");
			statement =conn.createStatement();
			String sql ="SELECT * FROM courses";
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
			%>
				<tr>
				<td><%=resultSet.getString("id") %></td>
				<td><%=resultSet.getString("title") %></td>
				<td><button class="btn btn-info">Enroll</button></td>
				</tr>
			<%
			}
			conn.close();
			} catch (Exception e) {
			e.printStackTrace();
			}
	    %>
	  </tbody>
	</table>
</div>

</body>
</html>
