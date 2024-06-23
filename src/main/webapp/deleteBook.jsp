<%@page contentType="text/html; charset=UTF-8" %>

<%@page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>

<% 

	String estateId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from estate";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		sql = "delete from estate where estateId=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,estateId);
		pstmt.executeUpdate();
	}else
		out.println("일치하는 건물가 없습니다.");
	
	if(rs!=null)
		rs.close();
	if(pstmt!=null)
		pstmt.close();
	if(conn!=null)
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=delete");
	
%>