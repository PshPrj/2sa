<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/20
	수정할 견적 선택
 -->

<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="move.db.ReservationDto"%>
<%@page import="move.db.EstimateDto"%>
<%@page import="java.util.ArrayList"%>    
<script>
function Datasubmit(form1){
	if($('#estimate_board_num').val()==""){
		alert("반드시 견적 사항을 선택해 주세요.");
		return false;
	}
	document.form1.submit();
}


function estimate_choice(num, element){
	document.form1.estimate_board_num.value=num;
	
	if(element.firstChild.hasAttribute("style")){
		element.firstChild.removeAttribute("style");
		$('#estimate_dto').val("");
	}else{
		element.firstChild.setAttribute("style", "background-color:#F0DDE5");
	}
}

</script>
<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left; margin-left:0px">견적 수정</div>
<br/>
<form action="../eUpdate.do" name="form1" style="margin-left:0px" method="POST">
<input type="hidden" value="" name="estimate_board_num"/>
<input type="hidden" value="EU_1" name="cmd"/>
수정하실 견적을 선택해 주세요.
<div name="estimate" align=left>
<br/>
<%
	Vector<EstimateDto> estimates = (Vector)request.getAttribute("estimates");

for(int i =0; i<estimates.size();i++){ %>
	<a href="#" onclick="estimate_choice(<%=estimates.get(i).getEstimate_board_num()%>, this)"><div class="span4">견적 <%=i+1 %>. <%=estimates.get(i).getEstimate_date()%> 저장</div></a><br/><br/>
<%} %>
</div>
<input class="btn btn-default btn-sm" value = "수정" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Datasubmit(this.form)"/>
</form>