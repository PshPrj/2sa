<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/19
	세 번째 견적 페이지
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">작은 크기의 짐</div>

<br/><br/><br/>

<script src="json.js"></script>
<script>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
%>

function Jsonsubmit(form1){

		var Data = getData(form1, 10, 1);
		var beforeData='${Data}';
		
		var DataArray=new String();
		DataArray+=beforeData;
		DataArray+=Data;
		
		document.form1.DataArray.value=DataArray;
		document.form1.submit();
	}
	

</script>


<form method="POST" action="../estimate.do" name="form1" class="form-inline">
	<input type="hidden" value="E_4" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
<div id="pc" align=left>
	<span id="title">PC</span>
	<span style="padding:60px"></span>
	<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>
	
<div id="fan" align=left>
	<span id="title">선풍기</span>
	<span style="padding:50px"></span>
	<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>
	
<div id="chair" align=left>
	<span id="title">의자</span>
	<span style="padding:56px"></span>
	<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>	
	
<div id="bic" align=left>
<span id="title">자전거</span>
<span style="padding:50px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>
<div id="cooker" align=left>
<span id="title">밥솥</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>

<div id="inst" align=left>
<span id="title">악기</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>
<br/>	
	
<div id="pot" align=left>
<span id="title">화분</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>	
	
<div id="rest" align=left>
<span id="title">기타</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>	
<input class="btn btn-default btn-sm" value = "다음" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:Jsonsubmit(this.form)"/>

</form>
			