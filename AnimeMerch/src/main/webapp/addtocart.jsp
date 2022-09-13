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
String quant; 
String prod_id=request.getParameter("prod_id");
quant=(request.getParameter("quant")!=null)?request.getParameter("quant"):"1";

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/anime", "root", "root");
System.out.println(prod_id+"Connection Established successfully"+quant);

String query2 = "select * from product where product_id="+prod_id+";";
PreparedStatement st1 = con.prepareStatement(query2);
ResultSet rs = st1.executeQuery(query2);
rs.next();
String name=rs.getString("name");
String price=rs.getString("price");
st1.close();


String query = "insert into cart(prod_id,name,quant,price) values("+prod_id+",'"+name+"',"+quant+","+price+");";

	PreparedStatement st = con.prepareStatement(query);
	st.executeUpdate(query);
	
    st.close();
    
    
    con.close();
%>


<center>
<div class="form" style="width:23%;">

<h3 style="color:red;text-align:center;"> ADDED TO CART</h3>

</div>

</center>
<%@include file="index.html" %>
</body>

</html>