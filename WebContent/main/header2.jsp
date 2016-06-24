<!-- 
 	담당 : 1조
	최종 수정 일자 : 05/31
	일반 회원 로그인 후 header
 -->
<!-- 일반 회원 로그인 완료 계정 버튼 -->
 <%@ page contentType="text/html; charset=utf-8" %>
<div class="row-fluid" background-img=url('../img/1.jpg')>
	<div class="span2">
		<a href="../main/index.jsp"><img alt="" src="../img/15.png"></a>
	</div>
	<div class="span4 offset6 dropdown" style="margin-top: 50px;">
		<div class="span12">
		<div align="right">
		<div class="dropdown">
			<a class="dropdown-toggle btn" href="#" data-toggle="dropdown">나의 계정<strong class="caret"></strong></a>
			<div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px; right: 0; left: auto;">
				<div class="span12">
				<div class="span6"><div align="left"><img src="../img/picto/26.png" style="height:70px; width:70px; margin-top:-30px"></div></div>
				<div class="span6"><a href="#"><div style="margin-top:-20px">${member_id}</div></a>
				<br/>
				<a href="/mypage?cmd=progress"><div style="">이사 현황</div></a></div>
				</div>
				<br/><br/>
			
				<br/>
				<div class="span12">
				<a href="../mypage?cmd=floorplan"><div align="left">My Page</div></a><br/>
				<a href="#"><div align="left" style="margin-bottom:10px">Log Out</div></a>
				</div>
			
		</div>
		</div>
		</div>
		</div>
		
	</div>
