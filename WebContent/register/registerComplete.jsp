<%@page import="register.model.registerDto"%>
<!-- 
	1. 만든일 : 2016-06-20
	2. 최종 수정일 : 2016-06-20
	3. 회원가입페이지
 -->

<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>고정 크기 레이아웃</title>
<link rel="stylesheet" href="../bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../bootstrap/css/bootstrap-responsive.min.css">
<script src="../bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="../bootstrap/js/jcanvas.min.js"></script>
<script src="../bootstrap/js/handle.js"></script>
<link rel="stylesheet" href="../font-awesome-4.6.3/css/font-awesome.min.css">
<style>
body {
	background-color: #ffffff;
	font-family: 'Jeju Gothic', serif;
	color: #111;
	vertical-align:middle;

}

#ver {vertical-align: 10pt;}

btn-primary{
	color:#F5F3F3;
}

.navbar{
  background-color: #6E6865;
  border-color: #6E6865;
}

.navbar a { color: #F5F3F3 !important; }

.dropdown-menu a { color:#111 !important;}

.dropdown-menu a:hover{ 
	color:#F5F3F3 !important;
}
 .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus {
            background-image:none !important;
 }
 .dropdown-menu > li > a:hover, .dropdown-menu > li > a:focus{
            background-color:#79B3DC;
 }
 
.pic:hover {
	text-align: center;
	background-color: #B2E0F0;
}

[class*="span"] {
	text-align: center;
	margin-top: 10px;
}

img {
	width: 90px;
	height: 90px;
}

canvas{
border:1px solid #d3d3d3;
}

[class*="help2"] {
	height: 100px;
	width: 100px;
}

[class*="help1"] {
	height: 35px;
	width: 35px;
}

[class*="span3 pic"] {
	background-color: #F0DDE5;
}

a:link {color: #666666;}
a:visited {color : #666666;}
a:hover {color : #666666;}
a:active li:active{color : #666666;}

table.basic { 
	width:80%; 
	line-height:21px; 
	border-top: 1px solid #6E6865; 
	border-left: 1px solid #6E6865; 
	border-collapse: collapse; 
} 
table.basic th, table.basic td { 
	color:#678197; 
	text-align:center; 
	border-right: 1px solid #6E6865; 
	border-bottom: 1px solid #6E6865; 
	padding: 3px 0; 
	text-align:center; 
} 
table.basic th { 
	background-color: #eeeeee; 
} 

body{
	font-family: 'Jeju Gothic', serif;
}

</style>


<script>
$(document).ready(function(){
	$("#re_main").click(
			function(){
				location.href="main/index.jsp";
			});
});
	
</script>
</head>
<body>
	<div class="container">
	
			<!-- 해더 시작  -->
		<div id="header">
		
		<jsp:include page="../main/header.html" flush="false" />

		</div>
		<!--  해더끝  -->

		<!-- 게시판 시작 -->
		
		<jsp:include page="../main/board.html" flush="false" />
		<!--  게시판 끝  -->
		
		<!-- 컨텐츠 시작  -->
		<div class="span3" style="height:300px; border-radius: 4px;">
		</div>
		<div class="span6" style="height:300px; border-radius: 4px;background-color: skyblue">
			<jsp:useBean id="dto" class="register.model.registerDto"></jsp:useBean>
			<br/><br/><br/><br/>
			<h1>가입이 완료되었습니다.</h1>
			<%
				registerDto regidto = (registerDto) session.getAttribute("dto");
			%>
	
				<h3><%=regidto.getName()%>님 회원가입을 축하합니다.</h3>
				<input type="button" name="re_main" id="re_main" value="메인페이지로"/>
		</div>
		<!-- 컨텐츠 끝  -->



		<!-- 푸터 시작 -->
		<div style="margin-left:0px;margin-top: 20px">
			<jsp:include page="../main/footer.html" flush="false"/>
		</div>
		<!-- 푸터 끝 -->
	</div>

	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>