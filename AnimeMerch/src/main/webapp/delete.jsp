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
<% 
String ord_id=request.getParameter("ord_id");
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/anime", "root", "root");
System.out.println("Connection Established successfully");

String query = "delete from cart where ord_id="+ord_id+";";
	PreparedStatement st = con.prepareStatement(query);
	st.executeUpdate(query);
    st.close();
    con.close();
%>


<center>
<div class="form" style="width:23%;">

<h3 style="color:red;text-align:center;"> DELETED FROM CART</h3>

</div>

</center>
</body>
<%@include file="index.html" %>
</html>