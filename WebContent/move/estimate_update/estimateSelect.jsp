<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 06/20
	������ ���� ����
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
		alert("�ݵ�� ���� ������ ������ �ּ���.");
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
<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left; margin-left:0px">���� ����</div>
<br/>
<form action="../eUpdate.do" name="form1" style="margin-left:0px" method="POST">
<input type="hidden" value="" name="estimate_board_num"/>
<input type="hidden" value="EU_1" name="cmd"/>
�����Ͻ� ������ ������ �ּ���.
<div name="estimate" align=left>
<br/>
<%
	Vector<EstimateDto> estimates = (Vector)request.getAttribute("estimates");

for(int i =0; i<estimates.size();i++){ %>
	<a href="#" onclick="estimate_choice(<%=estimates.get(i).getEstimate_board_num()%>, this)"><div class="span4">���� <%=i+1 %>. <%=estimates.get(i).getEstimate_date()%> ����</div></a><br/><br/>
<%} %>
</div>
<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Datasubmit(this.form)"/>
</form>