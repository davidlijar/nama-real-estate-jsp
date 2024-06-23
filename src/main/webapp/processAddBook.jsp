<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="dto.Book" %>
<%@ page import="dao.BookRepository" %>

<%@page import = "com.oreilly.servlet.*" %>
<%@page import = "com.oreilly.servlet.multipart.*" %>
<%@page import = "java.util.*" %>

<%@ page import="java.sql.*" %>
<%@ include file ="dbconn.jsp"%>
<%@ page import="java.io.*" %>

<% 
	request.setCharacterEncoding("UTF-8");
	
	String realFolder = application.getRealPath("/resources/images");
	int maxSize = 10*1024*1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());


	String estateId = multi.getParameter("estateId");
	String owner = (String) session.getAttribute("sessionId");
	System.out.println("Owner"+ owner);
	String price = multi.getParameter("price");
	String address = multi.getParameter("address");
	String description = multi.getParameter("description");
	String category = multi.getParameter("category");
	
	String vdId = multi.getParameter("vdId");
	
	/*
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	*/
	List<File> uploadedFiles = new ArrayList<>();

    Enumeration fileNames = multi.getFileNames();
    while (fileNames.hasMoreElements()) {
        String name = (String) fileNames.nextElement();
        File f = multi.getFile(name);
        if (f != null) {
            uploadedFiles.add(f);
        }
    }
	
	
	List<String> fileNamess = new ArrayList<>();
	
	 for (File file : uploadedFiles) {
	        String fileName = file.getName();
	        System.out.println(fileName);
	        fileNamess.add(fileName);
	    }
	
	Integer priceInt;
	
	if(price.isEmpty()){
		priceInt =0;
	}else{
		priceInt = Integer.valueOf(price);
	}
	

	
	PreparedStatement pstmt = null;
	String sql = "insert into estate(estateId, owner, price, address, category, description, fileName, carousel, vdId) values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, estateId);
	pstmt.setString(2, owner);
	pstmt.setInt(3, priceInt);
	pstmt.setString(4, address);
	pstmt.setString(5, category);
	pstmt.setString(6, description);
	pstmt.setString(7, fileNamess.get(fileNamess.size()-1));
	pstmt.setString(8, String.join(",", fileNamess.subList(0, fileNamess.size()-1)));
	pstmt.setString(9, vdId);
	pstmt.executeUpdate();
	if (pstmt != null)
		pstmt.close();
	if (conn!=null);
		conn.close();
	
	response.sendRedirect("books.jsp");
%>