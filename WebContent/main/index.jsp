<!-- 
	담당 :  1조 조원
	최종 수정 일자 : 6/21
	메인 페이지

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
<%

request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
session.removeAttribute("member_id");
session.setAttribute("staff_num","1");
session.setAttribute("staff_type","2");
//session.removeAttribute("staff_type");
//session.removeAttribute("staff_num");
//session.setAttribute("member_id","id");
//session.setAttribute("member_num", "16");
session.removeAttribute("member_num");
//session.removeAttribute("price");
%>
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
	$(function() {
		$("a[rel='tooltip']").tooltip({
			placement : "bottom"
		});

	});
	$(function() {

		$("#thePopover").popover({
			html : true
		});

	});
</script>
</head>
<body>
	<div class="container">
	<%
			
			String boardpage =null;
			String board = null;
			String staff_num = null;
			String url = null;
			String member_id=null;
			String staff_type=null;
			if (request.getAttribute("page") != null) {
				board=(String)request.getAttribute("board");
				request.setAttribute("board", board);
	
				boardpage=request.getAttribute("page").toString();
				request.setAttribute("boardpage",boardpage);
			}
			
			if(request.getAttribute("mypage") != null){
				member_id=(String)session.getAttribute("member_id");
				url=(String)request.getAttribute("mypage");
				System.out.println(url+"index.jsp staff_type");
			}
			
			if(session.getAttribute("staff_type")!=null){
				staff_type=(String)session.getAttribute("staff_type");
				boardpage=(String)request.getAttribute("page");
				url=(String)request.getAttribute("staffpage");				
			}
			
			if(session.getAttribute("staff_num")!=null){
				staff_num=(String)session.getAttribute("staff_num");
				
			}
		%>
		<!-- 해더 시작  -->
		<div id="header">
		<%if(session.getAttribute("member_num")!=null){ %>
			<jsp:include page="header2.jsp" flush="false" />
		<%}else if(session.getAttribute("staff_num")!=null){ %>
			<jsp:include page="header3.html" flush="false" />
		<% }else{%>
		<jsp:include page="header.html" flush="false" />
		<%} %>
		</div>
		<!--  해더끝  -->

		<!-- 게시판 시작 -->
		
		<jsp:include page="board.jsp" flush="false" />
		<!--  게시판 끝  -->


		
		<!-- 컨텐츠 시작  -->
		
		
		<!-- 각 게시판에 접근 -->
		<%if(boardpage=="NOTICE"||boardpage=="HISTORY"||boardpage=="INTRODUCE"){%>
			<jsp:include page="../company/company_body.jsp" flush="true"/>
		<% }else if(boardpage=="ESTIMATE"||boardpage=="RESERVATION"||boardpage=="DRAWING"){%>
			<jsp:include page="../move/move_body.jsp" flush="true"/>
		<%}else if(boardpage=="REVIEW"||boardpage=="QNA"){%>
			<jsp:include page="../community/community_body.jsp" flush="true"/>
		<%}else if(boardpage=="GUIDANCE"){%>
			<jsp:include page="../guidance/guidance_body.jsp" flush="true"/>
		<%}else if(request.getAttribute("mypage")!=null){%>
		<div>
			<div class="span2" style="margin-left:0px">
				<jsp:include page="../mypage/member/sidebar.jsp" flush="false" />
				</div>
			<div class="span10">
			<div class="tabbable tabs-below">
				<div class="tab-content">
				<div class="tab-pane active"><jsp:include page="<%=url%>" flush="false" /></div>
			</div>
			</div>
			</div>
		</div>
		<%}else if(request.getAttribute("staffpage")!=null){%><!-- 직원의 관리 페이지 -->
			<div>
			<div class="span2" style="margin-left:0px">
				<jsp:include page="../mypage/staff/sidebar.jsp" flush="false" />
				</div>
			<div class="span9" style="margin-left:50px">
			<div class="tabbable tabs-below">
				<div class="tab-content">
				<div class="tab-pane active"><jsp:include page="<%=url%>" flush="false" /></div>
			</div>
			</div>
			</div>
		</div>		
		<%}else{%>
			<jsp:include page="body.jsp" flush="false" />
		<%
		System.out.println(boardpage);
		} %>
		
		<!-- 컨텐츠 끝  -->



		<!-- 푸터 시작 -->
		<div style="margin-left:0px">
			<jsp:include page="footer.jsp" flush="false"/>
		</div>
		<!-- 푸터 끝 -->
	</div>




	<script src="../bootstrap/js/bootstrap.min.js"></script>
</body>
</html>