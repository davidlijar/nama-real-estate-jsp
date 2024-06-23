<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.util.*" %>
<%@page import="com.oreilly.servlet.*" %>
<%@page import="com.oreilly.servlet.multipart.*" %>
<%@page import="java.sql.*" %>
<%@include file="dbconn.jsp" %>

<%@page import = "com.oreilly.servlet.*" %>
<%@page import = "com.oreilly.servlet.multipart.*" %>
<%@page import = "java.util.*" %>

<%@ page import="java.sql.*" %>

<%@ page import="java.io.*" %>

	


<%
request.setCharacterEncoding("UTF-8");

String realFolder = application.getRealPath("/resources/images");
int maxSize = 10*1024*1024;
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());


String estateId = multi.getParameter("estateId");
String owner = multi.getParameter("owner");
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
        
        fileNamess.add(fileName);
    }
 
 	Integer priceInt;
	
	if(price.isEmpty()){
		priceInt =0;
	}else{
		priceInt = Integer.valueOf(price);
	}
	
	PreparedStatement pstmt = null;
    ResultSet rs = null;
    String sql = "select * from estate where estateId=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, estateId);
    rs = pstmt.executeQuery();
    if(rs.next()){
        if(!fileNamess.isEmpty()){
            sql = "update estate set owner=?, price=?, address=?, category=?, description=?, fileName=?, carousel=?,vdId=? where estateId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, owner);
            pstmt.setInt(2, Integer.parseInt(price));
            pstmt.setString(3, address);
            pstmt.setString(4, category);
            pstmt.setString(5, description);
            pstmt.setString(6, fileNamess.get(fileNamess.size()-1));
            pstmt.setString(7, String.join(",", fileNamess.subList(0, fileNamess.size()-1)));
            pstmt.setString(8, vdId);
         
            pstmt.setString(9, estateId);
            pstmt.executeUpdate();
        }else{
            sql = "update estate set owner=?, price=?, address=?, category=?, description=?, vdId=? where estateId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, owner);
            pstmt.setInt(2, Integer.parseInt(price));
            pstmt.setString(3, address);
            pstmt.setString(4, category);
            pstmt.setString(5, description);
            pstmt.setString(6, vdId);
            pstmt.setString(7, estateId);
            pstmt.executeUpdate();
        }
    }
    if(pstmt!=null)
        pstmt.close();
    if(conn!=null)
        conn.close();
    response.sendRedirect("editBook.jsp?edit=update");
%>