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

<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
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
	
	// 패스워드 입력-재입력  확인
	$(document).ready(function(){
		$("#btnDup").click(
				function(){
					$.ajax({
						type:"POST",
						url:"../member?cmd=LAP",
						data :{"m_id":$("#m_id").val()}
					}).success(function(data) {
						// ajax를 거치면 idCheck.jsp가 활성화되고 그곳에서 값을 가져옴
						var result = $(data).text();
						if(result == "yes"){
							if($("#m_id").val().length <= 4){
								$("#idMessage").text("[ ID가 짧습니다 ] ").css("color", "red");
							}
							else{
								$("#idMessage").text("[ 사용 가능 합니다 ] ").css("color", "blue");
								$("#result").val("yes");
							}
						}
						else if(result == "no"){
							$("#idMessage").text("[ 중  복 된 아 이 디 ] ").css("color", "red");
						}
					});
				}
			);
		
		$("#pw").keyup(function(){
			var pw_val = $("#pw").val().length;
			if(pw_val < 5){
				$("#pwMessage").text("[ 부 적 합 비 밀 번 호 ]").css("color", "red");
			}
			else{
				$("#pwMessage").text("[ 적 합 한  비 밀 번 호 ]").css("color", "blue");
			}
		});
		
		$("#pw_check").keyup(function(){
			var pw_val = $("#pw").val().length;
			var pw = $("#pw").val();
			var pw_check = $("#pw_check").val();
			if(pw_check == "" ){
				$("#pcMessage").text("[ 비밀번호 재입력 ]").css("color", "red");
			}
			else if(pw == pw_check && pw_val < 4){
				$("#pcMessage").text("[ 비밀번호가 짧습니다 ]").css("color", "red");
			}
			else if(pw == pw_check && pw_val > 4){
				$("#pcMessage").text("[ 비밀번호 입력 확인 ]").css("color", "blue");
			}
			else if(pw != pw.check){
				$("#pcMessage").text("[ 비밀번호가 서로 다름 ]").css("color", "red");
			}
		})
	});
	
	//최종 유효성 검사 - 가입 submit
	function lastCheck(){
		if(f.id.value != "" && f.name.value != ""){		
			if(f.pw.value != f.pw_check.value){
				alert("비밀번호가 맞지 않습니다");
			}
			else if(f.pw.value == "" || f.pw_check.value == ""){
				alert("암호를 입력하세요");
			}
			else if($("#midNum").val().length < 3 || $("#midNum").val().length < 3){
				alert("핸드폰 번호를 확인하세요");
			}
			else if($("#result").val() == "no"){
				alert("아이디 중복 검사하세요");
			}
			else {
				document.f.submit();
			}
		}
		else{
			alert("아이디 또는 이름을 확인하세요");
		}
	}
	
	//본인확인
	function iden(){
		//이런 형식이다라고만 보여줌
		alert("본인확인 서비스 유료");
	}
	
	//취소버튼
	function clos(){
		if(confirm("회원가입을 취소하시겠습니까?") == true) {
			window.close();
		}
		else{
			return;
		}
	}
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
		
		<div class="span5" style="height:300px; border-radius: 4px;" align=center>
			<form method="post" action="../member" name="f">
			<input type="hidden" name="cmd" value="CONFIRM" />
				<table style="width:550px;">
					<tr>
						<td colspan="3" align="center">
							<h3>회원 정보 입력</h3>
						</td>
					</tr>
			
							<!-- 아이디 입력 필드 -->
					<tr>
						<td align="center">
							아 &nbsp;&nbsp;&nbsp;&nbsp;이 &nbsp;&nbsp;&nbsp;&nbsp;디   
						</td>
						<td align="left">
							<input type="text" name="m_id" id="m_id" maxlength="15"/>
						</td>
						<td align="left">
							<span id="idMessage" style="color:black">[ 공백없이 5~15자 ]</span>
							&nbsp;<input type="button" value="중복확인" name="btnDup" id="btnDup"/>&nbsp;
						</td>
					</tr>
					
									<!-- 이름 입력 필드 -->
					<tr>
						<td>
							&nbsp;&nbsp;이 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;름 
						</td>
						<td align="left">
							<input type="text" id="m_name" name="m_name" maxlength="15" />
						</td>
						<td align="left">
							[ 본 인 실 명 기 제]
						</td>
					</tr>
					
									<!-- 비밀번호 입력 필드-->
					<tr>
						<td>
							비&nbsp;&nbsp;밀&nbsp;&nbsp;&nbsp;번&nbsp; 호 
						</td>
						<td align="left">
							<input type="password" name="pw" id="pw" maxlength="15"/>
						</td>
						<td align="left">
							<span id="pwMessage" style="color:black">[ 공백없이 5~15자 ]</span>
						</td>
					</tr>
					
									<!-- 비밀번호 확인 필드 -->
					<tr>
						<td>		
							비밀번호 확인 
						</td>
						<td align="left">
							<input type="password" name="pw_check" id="pw_check" maxlength="15"/>
						</td>
						<td align="left">
							<span id="pcMessage" style="color:black"></span>
						</td>
					</tr>
					
									<!-- 전화번호 입력 필드 -->
					<tr>
						<td>
							휴대 전화번호 
						</td>
						<td align="center">
							<input type="text" name="headNum" id="headNum" maxlength="3" style="width: 40px;margin-top: 5px" value="010"/>-
							<input type="text" name="midNum" id="midNum" maxlength="4" style="width: 40px;margin-top: 5px"/>-
							<input type="text" name="footNum" id="footNum" maxlength="4" style="width: 40px;margin-top: 5px"/>
						</td>
						<td>
							<input type="button" value="본인확인" onclick="iden()"/>
						</td>
					</tr>
					
									<!-- 가입신청 버튼 -->
					<tr>
						<td colspan="3" align="center">
							<input type="button" value="취소" onClick="clos()"/>
							<input type="button" value="가입신청" onclick="lastCheck()"/>
						</td>
					</tr>
			</table>
			<br/>
			</form>
				<!-- 아이디 중복 확인 -->
				<input type="hidden" id="result" name="result" value="no"/>
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