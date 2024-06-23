<%@page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
    <title>건물 수정</title>
</head>
<body>
    <div class="container py-4">
        <%@include file="menu.jsp" %>

        <div class="p-5 mb-4 bg-body-tertiary rounded-3">
            <div class="container-fluid py-5">
                <h1 class="display-5 fw-bold">도서 수정</h1>
                <p class="col-md-8 fs-4">Estate Updating</p>
            </div>
        </div>

        <%@include file="dbconn.jsp" %>
        <% 
            String estateId = request.getParameter("id");
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            String sql = "select * from estate where estateId=?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, estateId);
            rs = pstmt.executeQuery();
            if (rs.next()){
        %>
        <div class="row align-items-md-stretch">
            <div class="col-md-5">
                <img src="./resources/images/<%=rs.getString("fileName").split("[,;]")[0]%>" alt="image" style="width: 100%"/>
            </div>
            <div class="col-md-7">
                <form name="newBook" action="./processUpdateBook.jsp" method="post" enctype="multipart/form-data">
                    <div class="mb-3 row">
                        <label class="col-sm-2">건물코드</label>
                        <div class="col-sm-8">
                            <input type="text" name="estateId" id="estateId" class="form-control" value="<%=rs.getString("estateId") %>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2">주인</label>
                        <div class="col-sm-8">
                            <input type="text" name="owner" id="owner" class="form-control" value="<%=rs.getString("owner") %>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2">가격</label>
                        <div class="col-sm-8">
                            <input type="text" name="price" id="price" class="form-control" value="<%=rs.getString("price") %>">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2">주소</label>
                        <div class="col-sm-8">
                            <input type="text" name="address" id="address" class="form-control" value="<%=rs.getString("address") %>">
                        </div>
                    </div>
                    
                    
                    <div class="mb-3 row">
                        <label class="col-sm-2">상세정보</label>
                        <div class="col-sm-8">
                        	
                        	<textarea name="description" id="description" cols="50" rows="8" class="form-control" placeholder="100자 이상 적어주세요"><%=rs.getString("description") %></textarea>
                            
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label class="col-sm-2">분류</label>
                        <div class="col-sm-8">
                            <input type="text" name="category" id="category" class="form-control" value="<%=rs.getString("category") %>">
                        </div>
                    </div>
                    
                   
                    <div class="mb-3 row">
                        <label class="col-sm-2">이미지</label>
                        <div class="col-sm-8">
                            <input type="file" name="fileName" class="form-control">
                        </div>
                    </div>
                    <div class="mb-3 row">
						<label class="col-sm-2" for="img" >추가 이미지</label>
						
						<div class="col-sm-8" id="noOfInput" >
							<input type="file" class="file-input form-control" name="file2" multiple />
							<input type="file" class="file-input form-control" name="file3" multiple />
							<input type="file" class="file-input form-control" name="file4" multiple />
							<input type="file" class="file-input form-control" name="file5" multiple />
						</div>
					</div>
					
					<div class="mb-3 row">
						<label class="col-sm-2">Youtube Video ID</label>
						<div class="col-sm-5">
							<input type="text" id="vdId" name="vdId" class="form-control" value='<%=rs.getString("vdId") %>'>
						</div>
				
					</div>
					
					
                    <div class="mb-3 row">
                        <div class="col-sm-offset-2 col-sm-10">
                            <input type="submit" class="btn btn-primary" value="등록">
                        </div>
                    </div>
                </form>
            </div>
           

        </div>
         <% 
            }
            if (rs!=null)
                rs.close();
            if(pstmt!=null)
                pstmt.close();
            if(conn!=null)
                conn.close();
        %>

        
        <jsp:include page="footer.jsp"/>
    </div>

</body>
</html>