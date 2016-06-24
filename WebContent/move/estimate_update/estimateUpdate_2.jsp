<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/20
	견적 수정 두 번째 페이지
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">부피가 큰 짐</div>
<style>
	#title{
		display:inline-block;
		width:60px;
	}
</style>
<script src="json.js"></script>
<script src="data.js"></script>


<%
	pageContext.setAttribute("DataArray", request.getParameter("DataArray"));
	String estimate_content = (String)request.getAttribute("estimate_content");
%>

<script>
function Jsonsubmit(form1){
		var Data = getData(form1, 5, 2);
		var beforeData = '${DataArray}';
		
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
<form method="POST" action="../eUpdate.do" name="form1" align=left>
	<input type="hidden" value="EU_3" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="estimate_content"/>
	<input type="hidden" value="<%=request.getAttribute("estimate_board_num") %>" name="estimate_board_num"/>
<div id="desk2">
<span id="title">식탁 </span>
	<select id="kind">
		<option>종류</option>
		<option>나무</option>
		<option>철제</option>
		<option>대리석</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	
	
<div id="make">
<span id="title">화장대</span>
	<select id="kind">
		<option>종류</option>
		<option>틀</option>
		<option>틀+서랍</option>
		<option>틀+유리</option>
		<option>틀+서랍+유리</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<div id="tv">
<span id="title">TV</span>
	<select id="kind">
		<option>종류</option>
		<option>평면</option>
		<option>curved</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>

<div id="ex">
<span id="title">운동기구</span>
	<select id="kind">
		<option>종류</option>
		<option>바이크</option>
		<option>런닝머신</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	
	
<div id="sofa">
<span id="title">소파</span>
	<select id="kind">
		<option>종류</option>
		<option>가죽</option>
		<option>천</option>
		<option>침대소파</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<div id="dec">
<span id="title">진열장</span>
	<select id="kind">
		<option>종류</option>
		<option>나무</option>
		<option>철제</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<input class="btn btn-default btn-sm" value = "다음" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" align=center onclick="Jsonsubmit(this.form)"/>

</form>
			