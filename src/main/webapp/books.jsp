<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*" %>
 <%@ page import = "java.util.ArrayList" %>
 <%@ page import = "dto.Book" %>
 <%@ page import = "dao.BookRepository" %>
 <%@page import = "java.util.*" %>
 <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
-->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<title>건물 목록</title>
</head>
<body>
<div class="container py-4">

	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">건물목록</h1>
			<p class="col-md-8 fs-4">EstateList</p>
		</div>
	</div>
	
	<%@include file="dbconn.jsp" %>
	
	<div class="row align-items-md-stretch text-center">
	
	<%
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from estate";
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()){	
			
			
			
	%>
	<div class="col-md-4">
		<div class="h-100 p-2">
		
			<img src="./resources/images/<%=rs.getString("fileName").split("[,;]")[0]%>" style="width: 300px; height:300px; object-fit:cover;object-position:center" />
			<h5><b><%=rs.getString("estateId") %></b></h5>
			<p><%=rs.getString("category") %>
			<br><%=rs.getString("address") %> | <b><%=rs.getString("price") %>원</b>
			<p><%=rs.getString("description").substring(0,60) %>....
			
			<p><a href="./book.jsp?id=<%=rs.getString("estateId") %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
		</div>
	</div>
				
	<%
		}
		if(rs!=null)
			rs.close();
		if(pstmt!=null)
			pstmt.close();
		if(conn!=null)
			conn.close();
	%>
		
		
		
		
	
	</div>
	
	<%@ include file="footer.jsp" %>


</div>
</body>
</html>