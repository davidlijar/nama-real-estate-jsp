<%@page contentType = "text/html; charset=utf-8" %>
<%@page import = "java.util.ArrayList" %>
<%@page import = "dto.Book" %>
<%@page import = "dao.BookRepository" %>

<% 
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")){
		response.sendRedirect("books.jsp");
		return;
	}
	
	
	
	ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
	Book goodsQnt = new Book();
	for(int i=0; i<cartList.size(); i++){
		goodsQnt = cartList.get(i);
		if(goodsQnt.getEstateId().equals(id)){
			cartList.remove(goodsQnt);
		}
	}
	
	response.sendRedirect("cart.jsp");
	
%>