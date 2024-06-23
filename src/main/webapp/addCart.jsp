<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList" %>
<%@page import = "dto.Book" %>
<%@page import = "dao.BookRepository" %>
<%@page import = "java.util.*" %>

<%@include file="dbconn.jsp" %>

<% 
	String id = request.getParameter("id");
	
	


	if(id == null || id.trim().equals("")){
		response.sendRedirect("books.jsp");
		
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from estate where estateId=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	
	if (rs.next()) { // Move the cursor to the first row of the result set
        if (rs.getString("owner") == null) {
            response.sendRedirect("exceptionNoBookId.jsp");
            
        } else {
            response.sendRedirect("book.jsp?id=" + id);
            
        }
    } else {
        response.sendRedirect("exceptionNoBookId.jsp");
        
    }
	
	
	
	
	
	
	
	
	ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");	
	
	if(list == null){
	
		list = new ArrayList<Book>();
		session.setAttribute("cartlist", list);
		
	}
	
	
	
	Book book = new Book();
	book.setEstateId(rs.getString("estateId"));
	book.setOwner(rs.getString("owner"));
	book.setPrice(rs.getInt("price"));
	book.setCategory(rs.getString("category"));
	book.setDescription(rs.getString("description"));
	
	ArrayList<String> estateIdList = new ArrayList<String>();
	
	for(Book estate : list){
		estateIdList.add(estate.getEstateId());
	}
	
	if(!estateIdList.contains(book.getEstateId())){
		list.add(book);
	}
	
	
	
%>