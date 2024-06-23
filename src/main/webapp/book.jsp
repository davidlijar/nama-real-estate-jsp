<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Book" %>
<%@ page import = "dao.BookRepository" %>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
-->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>


<title>건물 정보</title>
<script type="text/javascript">
	function addToCart(){
		if(confirm("나의 종하요에 추가하시겠습니까?")){
			document.addForm.submit();
			
		}else{
			document.addForm.reset();
		}
	}
</script>

<script type="importmap">
      {
        "imports": {
          "@google/generative-ai": "https://esm.run/@google/generative-ai"
        }
      }
    </script>
    
<script type="module" src="./resources/js/gpt.js"></script>
    </head>
<body>

<script type="text/javascript">
  var tag = document.createElement('script');
  tag.id = 'iframe-demo';
  tag.src = 'https://www.youtube.com/iframe_api';
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

  var player;
  function onYouTubeIframeAPIReady() {
    player = new YT.Player('existing-iframe-example', {
    	height: '390',
        width: '640',
    	playerVars: {
    	      'playsinline': 1
    	    },
        events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
        }
    });
  }
  function onPlayerReady(event) {
	  event.target.playVideo();
	  event.target.mute();
    document.getElementById('existing-iframe-example').style.borderColor = '#FF6D00';
  }
  function changeBorderColor(playerStatus) {
    var color;
    if (playerStatus == -1) {
      color = "#37474F"; // unstarted = gray
    } else if (playerStatus == 0) {
      color = "#FFFF00"; // ended = yellow
    } else if (playerStatus == 1) {
      color = "#33691E"; // playing = green
    } else if (playerStatus == 2) {
      color = "#DD2C00"; // paused = red
    } else if (playerStatus == 3) {
      color = "#AA00FF"; // buffering = purple
    } else if (playerStatus == 5) {
      color = "#FF6DOO"; // video cued = orange
    }
    if (color) {
      document.getElementById('existing-iframe-example').style.borderColor = color;
    }
  }
  
  var done = false;
  function onPlayerStateChange(event) {
    changeBorderColor(event.data);
    
    if (event.data == YT.PlayerState.PLAYING && !done) {
        setTimeout(stopVideo, 6000);
        done = true;
      }
  }
  
  function stopVideo() {
      player.stopVideo();
    }
</script>




<%@include file="dbconn.jsp" %>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = "select * from estate where estateId=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, id);
	rs = pstmt.executeQuery();
	
	
	while(rs.next()){	
		
		String[] fileNames = rs.getString("carousel").split("[,;]");

	
%>
<div class="container py-4">
	<%@ include file="menu.jsp" %>
	
	<div class="p-5 mb-4 bg-body-tertiary rounded-4">
	<div class="row">
		<div class="container-fluid py-5 col">
			<h1 class="display-5 fw-blood">건물정보</h1>
			<p class="col-md-8 fs-4">Estate Info</p>
			
		</div>
		<div class="col">
			<div id="carouselExampleInterval" style="width:450px;" class="carousel slide " data-bs-ride="carousel">
			  <div class="carousel-inner ">
			  <%
			  	for(String img : fileNames){
			  	
			  %>
			  
			    <div class="carousel-item active"  data-bs-interval="3000" >
			    <a href="./resources/images/<%=img %>" target="_blank" >
			      <img src="./resources/images/<%=img %>" class="d-block" style="width: 300px; height:300px; object-fit:cover;object-position:center" alt="...">
			     </a>
			    </div>
			    
			    <%
			  	}
			  %>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
	
	</div>
		
	</div>




<div class="row align-items-md-stretch">
	<div class="col-md-5" >
	<a href="./resources/images/<%=rs.getString("fileName").split("[,;]")[0] %>" target="_blank">
		<img src="./resources/images/<%=rs.getString("fileName").split("[,;]")[0] %>" style="width: 300px; height:300px; object-fit:cover;object-position:center" />
	</a>
	</div>
	<div class="col-md-6 position-relative overflow-auto">
		<div style="display:flex" class="position-relative mb-3">
		<h3><b>건물코드 : </b><span class="badge text-bg-danger"><%=rs.getString("estateId") %></span></h3>
		<div class="d-flex position-absolute top-0 end-0">
		<a href="#"  onclick="addToCart()"><button class="btn btn-primary me-3">좋아요</button></a>
		<a  href="./cart.jsp"><button  class="btn btn-secondary">나의 좋아요 &raquo;</button></a>
		</div>
		</div>
		
		
		<p><b>주소</b> : <%=rs.getString("address") %>
		
		<p ><b>분류</b> : <%=rs.getString("category") %></p>
		<h4><b><%=rs.getString("price")%>원</b></h4>
		
		<p style="padding:2rem;"> <%=rs.getString("description") %></p>
		
		
		<div style="margin-top:3rem">
		
		<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("estateId") %>" method="post">
		
		<div class="position-absolute bottom-0 end-0 mb-3 mt-3">
			
			<a href="./contactOwner.jsp?owner=<%=rs.getString("owner") %>&estateId=<%=rs.getString("estateId") %>" class="btn btn-warning">주인 연락 &raquo;</a>
		</div>
		</form>
		</div>
		
		
		
		
	</div>
</div>


<div id="player"></div>


<div class="mb-3 row flex flex-row"  >
<div class="col">
<iframe id="existing-iframe-example"
        width="640" height="360"
        src="https://www.youtube.com/embed/<%=rs.getString("vdId") %>?enablejsapi=1"
        frameborder="0"
        style="border: solid 4px #37474F"
></iframe>
</div>
<script type="importmap">
      {
        "imports": {
          "@google/generative-ai": "https://esm.run/@google/generative-ai"
        }
      }
    </script>
    <script type="module">
      import { GoogleGenerativeAI } from "@google/generative-ai";
		const API_KEY = "AIzaSyC92Kq6UcsQWcqXoZfqNqY3zgZ9XYse-rg";
    // Access your API key (see "Set up your API key" above)
	const genAI = new GoogleGenerativeAI(API_KEY);

	const form = document.getElementById('chatForm');
    const messageInput = document.getElementById('messageInput');
    const chatOutput = document.getElementById('chatOutput');

	function askGPT() {
  	// The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
  	const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash"});

	


  	const prompt = messageInput.value

  	const result = await model.generateContent(prompt);
  	const response = await result.response;
  	const text = response.text();
  	console.log(text);
	
	chatOutput.innerHTML = text;
    
}
    </script>
    <script>
    	function gogo(){
    		import { GoogleGenerativeAI } from "@google/generative-ai";
    		const API_KEY = "AIzaSyC92Kq6UcsQWcqXoZfqNqY3zgZ9XYse-rg";
        // Access your API key (see "Set up your API key" above)
    	const genAI = new GoogleGenerativeAI(API_KEY);

    	const form = document.getElementById('chatForm');
        const messageInput = document.getElementById('messageInput');
        const chatOutput = document.getElementById('chatOutput');

    	function askGPT() {
      	// The Gemini 1.5 models are versatile and work with both text-only and multimodal prompts
      	const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash"});

    	


      	const prompt = messageInput.value

      	const result = await model.generateContent(prompt);
      	const response = await result.response;
      	const text = response.text();
      	console.log(text);
    	
    	chatOutput.innerHTML = text;
    	}
    </script>
<div class="col-sm-5">
<h1>Chat with GPT</h1>
  <form id="chatForm">
    <label for="messageInput">Your message:</label>
    <input type="text" id="messageInput" value="Write a story about a magic backpack." name="message" class="form-control" required>
   	<input value="Sendd" onclick="gogo()" type="button" class="form-control btn btn-primary">
  </form>
  <div id="chatOutput"></div>

</div>
</div>




		
	

	<%
	}
        if (rs!=null)
            rs.close();
        if( pstmt!=null)
            pstmt.close();
        if (conn!=null)
            conn.close();
		%>
		

<%@ include file="footer.jsp" %>

</div>

</body>
</html>