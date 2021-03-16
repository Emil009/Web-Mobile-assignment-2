 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,javax.servlet.*,javax.servlet.http.*,java.util.*"%>

<%

String password=request.getParameter("password");
String email=request.getParameter("email");

try
{
	Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/assignment", "postgres", "emil12345");
	Statement st=conn.createStatement();
	HttpServletRequest req;
	HttpSession ses = request.getSession(true);
	ses.setAttribute("username",email);
	response.sendRedirect("dashboard.jsp");
}
catch(Exception e)
{
	System.out.print(e);
	e.printStackTrace();
}
%> 