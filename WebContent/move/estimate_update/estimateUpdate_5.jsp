
<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/14
	견적 수정 여섯 번째 페이지
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">선택 사항 확인</div>

<br/><br/><br/>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
	String estimate_content = (String)request.getAttribute("estimate_content");
%>
<script src="json.js"></script>
<script>
function Jsonsubmit(form1){
	var beforeData='${Data}';
	
	var DataArray = new Array();
	DataArray.push(beforeData);
	
	document.form1.DataArray.value=DataArray;
	document.form1.estimate_content.value="<%=estimate_content%>";
	document.form1.submit();
}
	
window.onload=function(){
	var DataArray='${Data}';

	var choice = document.form1.choice;
	var list1;
	var list2=new Array();
	var final_list=new String();

	list1=DataArray.split(",");
	for(var i in list1){
		list2[i]=list1[i].split("_");
	}
	
	
	for(var i in list2){
		final_list+=list2[i]+"\n";
	}
	
	for(var i in final_list){
		final_list=final_list.replace(",","    ");
	}
	
	choice.value=final_list;
	
}
</script>

<style>
textarea {width:300px; overflow:visible}
</style>

<form method="POST" action="../eUpdate.do" name="form1">
	<input type="hidden" value="EU_6" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="estimate_content"/>
	<input type="hidden" value="<%=request.getAttribute("estimate_board_num") %>" name="estimate_board_num"/>
<div align=left>
<span>선택 사항 확인</span><br/>
	<textarea width=200px id="choice" readonly=readonly rows="10" style="WIDTH: 30%"></textarea>
</div>

<br/><br/>	
<input class="btn btn-default btn-sm" value = "다음" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:Jsonsubmit(this.form)"/>
</form>		