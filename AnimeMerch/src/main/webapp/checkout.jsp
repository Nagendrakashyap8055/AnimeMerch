<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<% String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String address=request.getParameter("address");
String city=request.getParameter("city");
String pincode=request.getParameter("pincode");
String phone=request.getParameter("phone");
String email=request.getParameter("email");

String price=request.getParameter("price");
String state=request.getParameter("state");

	String query = "insert into orders values('"+fname+"','"+lname+"','"+address+"','"+city+"',"+pincode+","+phone+",'"+email+"',"+price+",'"+state+"');";
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/anime", "root", "root");
	System.out.println("Connection Established successfully");
	PreparedStatement st = con.prepareStatement(query);
	st.executeUpdate(query);
    st.close();
    con.close();
%>


<center>
<div class="form" style="width:23%;">

<h3 style="color:red;text-align:center;">ORDER PLACED SUCCESSFULLY</h3>

</div>
<%@include file="index.html" %>

</center>
</body>

</html>