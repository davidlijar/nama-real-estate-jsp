<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<meta charset="UTF-8">
<title>주인 연락</title>

</head>
<body>
<div class="container py-4">

	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">주인 연락</h1>
			<p class="col-md-8 fs-4">Contact Owner</p>
		</div>
	</div>
	
	<%@include file="dbconn.jsp" %>
	
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String owner = request.getParameter("owner");
		String estateId = request.getParameter("estateId");
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, owner);
		rs = pstmt.executeQuery();
		
		
		while(rs.next()){	
	
	%>
	
	<div class="row align-items-md-stretch">
		<div class="mb-3 row">
			<label class="col-sm-2">이름</label>
			<div class="col-sm-5">
				<p><%=rs.getString("name") %></p>
			</div>
			<div class="col-sm-2"><a href="./book.jsp?id=<%=estateId%>" class="btn btn-secondary" role="button">해당 정보 &raquo;</a></div>
		</div>
		
		<div class="mb-3 row">
			<label class="col-sm-2">전화</label>
			<div class="col-sm-5">
				<p><%=rs.getString("phone") %></p>
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2">메일</label>
			<div class="col-sm-5">
				<p><%=rs.getString("mail") %></p>
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2">주소</label>
			<div class="col-sm-5">
				<p><%=rs.getString("address") %></p>
			</div>
		</div>
		
		<div class="mb-3 row">
			<div class="col-sm-2">
			<a href="mailto:<%=rs.getString("mail")%>"><button class="form-control btn btn-primary">Send Email</button></a>
			</div>
			<div class="col-sm-2"><a href="tel:<%=rs.getString("phone")%>"><button class="form-control btn btn-primary">Phone Call</button></a>
			</div>
		</div>
		
	
	</div>
	
	<%
		}
	%>
	
</div>

</body>
</html>