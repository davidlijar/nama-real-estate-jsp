<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import = "java.util.ArrayList" %>
 <%@page import = "dto.Book" %>
 <%@page import = "dao.BookRepository" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<%
	String cardId = session.getId();
%>
<title>나의 좋아요!</title>
</head>
<body>
<div class="container py-4">
	<%@ include file="menu.jsp" %>
	
	<div class="py-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fluid py-5">
			<h1 class="display-5 fw-bold">나의 좋아요!</h1>
			<p class="col-md-8 fs-4">Likes</p>
		</div>
	</div>
	
	<div class="row align-items-md-stretch">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="right"><a href="./deleteCart.jsp?cartId=<%=cardId %>" class="btn btn-danger">삭제하기</a></td>
					
				</tr>
			</table>
		</div>
		
		<div style="padding-top:50px">
			<table class="table table-hover">
				<tr>
					<th>건물 - 주인</th>
					<th>가격</th>
					<th>분류</th>
					<th>상세 정보</th>
					<th>비고</th>
				</tr>
				
				<%
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if(cartList==null)
						cartList = new ArrayList<Book>();
						for(int i=0; i<cartList.size(); i++){
							Book book=cartList.get(i);
							
						
					
				%>
				
				<tr>
					<td><a href="./book.jsp?id=<%=book.getEstateId()%>"><%=book.getEstateId() %> - <%=book.getOwner() %></a></td>
					<td><%=book.getPrice()%></td>
					<td><%=book.getCategory() %></td>
					<td><%=book.getDescription().substring(0,10) %>....</td>
					<td><a href="./removeCart.jsp?id=<%=book.getEstateId() %>" class="badge text-bg-danger">삭제</a></td>
				</tr>
				<%
						}
				%>
				<!-- 
				
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum %></th>
					<th></th>
				</tr>						
				 -->
			</table>
			<a href="./books.jsp" class="btn btn-secondary">&laquo; 쇼핑 계속하기</a>						
		</div>		
	</div>
	
	<jsp:include page="footer.jsp"/>
	
</div>

</body>
</html>