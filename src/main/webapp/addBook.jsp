<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>건물 등록</title>

<!--
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
-->

<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>

<script type="text/javascript" src="./resources/js/validation11.js"></script>

    <style>
        .image-preview {
            display: flex;
            flex-wrap: wrap;
        }
        .image-preview img {
            width: 100px;
            height: 100px;
            margin: 10px;
            object-fit: cover;
        }
    </style>


</head>

<script>


</script>
<body onload="Initial()">

<fmt:setLocale value='<%=request.getParameter("language") %>' />
<fmt:bundle basename="bundle.message">

<div class="container py-4">
	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-3">
		<div class="container-fuild py-5">
			<h1 class="display-5 fw-bold"><fmt:message key="title" /></h1>
			<p class="col-md-8 fs-4">Estate Addition </p>
		</div>
	
	</div>
	
	<div class="row align-items-md-stretch">
		<div class="text-end">
			<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
			
		</div>
		<form name="newBuilding" action="./processAddBook.jsp" class="form-horizontal" enctype="multipart/form-data" method="post">
			<div class="mb-3 row">
			
				<label class="col-sm-2"><fmt:message key="estateId"/></label>
				<div class="col-sm-5">
					<input type="text" id="estateId" name="estateId" class="form-control">
				</div>
			</div>
			<!-- 
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="owner"/></label>
				<div class="col-sm-3">
					<input type="text" id="owner" name="owner" class="form-control">
				</div>
			</div>
			 -->
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="price"/></label>
				<div class="col-sm-5">
					<input type="text" id="price" name="price" class="form-control">
				</div>
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="address"/></label>
				<div class="col-sm-5">
					<input type="text" id="address" name="address" class="form-control">
				</div>
			</div>
			
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="description"/></label>
				<div class="col-sm-5">
					<textarea name="description" id="description" cols="50" rows="2" class="form-control" placeholder="100자 이상 적어주세요"></textarea>
				</div>
			</div>
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="category"/></label>
				<div class="col-sm-5">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			
			
			
			<div class="mb-3 row">
				<label class="col-sm-2"><fmt:message key="buildingImage"/></label>
				
				<div class="col-sm-5" >
					<input type="file" class="file-input form-control" name="file1" multiple />
					
					
				</div>
			
				
			</div>
			
			<div class="mb-3 row">
				<label class="col-sm-2" for="img" ><fmt:message key="carousel"/></label>
				
				<div class="col-sm-5" id="noOfInput" >
					<input type="file" class="file-input form-control" name="file2" multiple />
					<input type="file" class="file-input form-control" name="file3" multiple />
					<input type="file" class="file-input form-control" name="file4" multiple />
					<input type="file" class="file-input form-control" name="file5" multiple />
				</div>
			
				
			</div>
			
			
			<div class="image-preview"></div>
			
			 <div class="mb-3 row">
				<label class="col-sm-2">Youtube Video ID</label>
				<div class="col-sm-5">
					<input type="text" id="vdId" name="vdId" class="form-control">
				</div>
				
			</div>
			
        <br>
			
			<div class="mb-3 row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button"/>" onclick="CheckAddBook()">
				</div>
			</div>
			
			
			
		</form>
	</div>
	
	<jsp:include page = "footer.jsp"/>

</div>
</fmt:bundle>

</body>
</html>