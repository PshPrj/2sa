<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/19
	예약 첫 페이지
 -->
<%@page import="move.db.ReservationDto"%>
<%@page import="move.db.EstimateDto"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=EUC-KR" %>
	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">예약 신청</div>
	
<style>
	#title{
		display:inline-block;
		width:60px;
	}
</style>
<script  src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<script>

	
	function check(form1){
		if($('#keep').is(":checked")==true){
			document.form1.cmd.value="R_2";
		}else{
			document.form1.cmd.value="R_3";
		}
	}
	
	function Datasubmit(form1){
		if($('#estimate_board_num').val()==""){
			alert("반드시 견적 사항을 선택해 주세요.");
			return false;
		}
		document.form1.submit();
	}
	
	
	function estimate_choice(num, element){
		if(element.firstChild.hasAttribute("style")){
			element.firstChild.removeAttribute("style");
			$('#estimate_board_num').val("");
		}else{
			element.firstChild.setAttribute("style", "background-color:#F0DDE5");
			document.form1.estimate_board_num.value=num;
		}
	}
	
	function template_choice(element){
		if(element.firstChild.hasAttribute("style")){
			element.firstChild.removeAttribute("style");
			$('#template').val("false");
		}else{
			element.firstChild.setAttribute("style", "background-color:#F0DDE5");
			document.form1.template.value=true;
		}
	}
</script>

<br/><br/>
<form action="../reservation.do" method="POST" id="form1" name="form1">
	<input type="hidden" value="R_3" name="cmd" id="cmd"/>
	<input type="hidden" value="" name="member_num"/>
	<input type="hidden" value="" name="estimate_board_num" id="estimate_board_num"/>
	<input type="hidden" value="false" name="template"/>
	<input type="hidden" value="0" name="keep_date"/>

<div class="span3" style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px; margin-left:0px">예약 신청</div>
<br/>
<div name="estimate" align=left>
<br/>
<%
	ArrayList<ReservationDto> estimate_dto = (ArrayList)request.getAttribute("estimate_dto");
	//ArrayList template_dto = (ArrayList)request.getAttribute("template_dto");

for(int i =0; i<estimate_dto.size();i++){ %>
	<a href="#" onclick="estimate_choice(<%=estimate_dto.get(i).getEstimate_board_num()%>, this)"><div class="span4">견적 <%=i+1 %>. <%=estimate_dto.get(i).getEstimate_date()%> 저장</div></a><br/><br/>
<%} %>
</div>
<br/><br/><br/>
<div class="span3" style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px; margin-left:0px">배치도 신청</div>
<br/>
<div name="template" align=left>
<br/>

	<a href="#" onclick="template_choice(this)"><div class="span4">배치 신청</div></a><br/><br/>

</div>
<br/><br/><br/>
<div class="row-fluid">
<div class="span6" style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px; margin-left:0px">보관 서비스 신청</div>
<div class="span1" style="margin-left:0px"><input type="checkbox" value="keep" id="keep" onclick="check(this.form)"/></div>
</div>
<br/><br/>
		<input class="btn btn-default btn-sm" value = "다음" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Datasubmit(this.form)"/>
</form>


<br/><br/><br/>
			