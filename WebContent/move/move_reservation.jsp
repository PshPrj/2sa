<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/15
	예약 메인 페이지
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<style>
 img {
	width: 150px;
	height: 150px;
}
</style>
<div class="span9" style="background-color:#E5B1C5; height:20px; width: 100px; margin-top:0px; margin-left:0px; align:left">예약</div>
<div align=right>
<form action="../reservation.do" method="POST">
	<input type="hidden" value="R_1" name="cmd"/>
	<input type="hidden" value="<%=session.getAttribute("member_num")%>" name="member_num"/>
	<input class="btn btn-default btn-sm" value = "예약 하기" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="submit()"/>
</form>
</div>
<br/><br/>

	<div class="span5" style="align:center">
		<img src="../img/picto/1026-25.png" width="200" height="200">
	</div>
	<div>
		<h3>견적을 모두 끝마치셨나요?</h3>
		<h3>여기에서 이사 날짜를 확정해 주세요!</h3>
	</div>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>