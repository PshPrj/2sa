<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/20
	견적 수정 네 번째 페이지
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">박스 짐</div>
<style>
	#title{
		display:inline-block;
		width:60px;
	}
</style>
<script src="json.js"></script>
<script src="data.js"></script>
<script>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
	String estimate_content = (String)request.getAttribute("estimate_content");
%>

function Jsonsubmit(form1){
	var Data = getData(form1, 10, 2);
	var beforeData='${Data}';
	
	var DataArray=new String();
	DataArray+=beforeData;
	DataArray+=Data;
	
	document.form1.DataArray.value=DataArray;
	document.form1.estimate_content.value="<%=estimate_content%>";
	document.form1.submit();
}
	
window.onload=function(){
	var content = "<%=estimate_content%>";
	splitData("<%=estimate_content%>", document.form1);
}
</script>
<br/><br/><br/>

<form method="POST" action="../eUpdate.do" name="form1" class="form-inline">
	<input type="hidden" value="EU_5" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="estimate_content"/>
	<input type="hidden" value="<%=request.getAttribute("estimate_board_num") %>" name="estimate_board_num"/>

<div id="box" align=left>
<span id="title">박스</span>
<span style="padding:40px"></span>
	<input type="number" name="num2" id="num2"/>&nbsp;박스
</div>
<br/>

<div id="b_box" align=left>
<span id="title">이사 박스 구매</span>
<span style="padding:40px"></span>
	<input type="number" id="num3" style="width: 45px; padding: 1px" value="0"/>
</div>
<br/>

<input class="btn btn-default btn-sm" value = "다음" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:Jsonsubmit(this.form)"/>
</form>
			