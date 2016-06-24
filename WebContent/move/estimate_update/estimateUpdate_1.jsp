<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/20
	견적 수정 첫 페이지
 -->

<%@page import="move.db.EstimateDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">부피가 큰 짐</div>
<style>
	#title{
		display:inline-block;
		width:60px;
	}
	
	div{
		align:left
	}
</style>
<script src="json.js"></script>
<script src="data.js"></script>
<%
	EstimateDto dto = (EstimateDto)request.getAttribute("dto");
	String estimate_content= (String)dto.getEstimate_content();
	request.setAttribute("estimate_content", estimate_content);//해당 견적의 내용 가져오기.
%>

<script>

function Jsonsubmit(form1){
	sessionStorage.price=150000;
	var DataArray = getData(form1, 5, 4);
	
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
<form method="POST" action="../eUpdate.do" name="form1">
	<input type="hidden" value="EU_2" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="estimate_content"/>
	<input type="hidden" value="${dto.estimate_board_num}" name="estimate_board_num"/>

<div id="bed" align=left>
<span id="title">침대</span>
	<select id="kind">
		<option>종류</option>
		<option value="single">싱글</option>
		<option value="king">킹</option>
		<option value="queen">퀸</option>
	</select>
	<select name="frame" id="frame">
		<option>종류</option>
		<option>매트리스만</option>
		<option>매트리스+프레임(결합)</option>
		<option>매트리스+프레임(분리)</option>
	</select>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	
	<br/>
</div>

<div id="desk"  align=left>
<span id="title">책상</span>
	<select id="kind">
		<option>종류</option>
		<option>메탈</option>
		<option>나무</option>
	</select>
	<select id="frame">
		<option>종류</option>
		<option>틀만</option>
		<option>틀+서랍</option>
		<option>틀+서랍+책장</option>
	</select>
<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	
	<br/>
</div>	

<div id="closet" align=left>
<span id="title">옷장</span>
	<select id="kind">
		<option>종류</option>
		<option>양문형</option>
		<option>단문형</option>
	</select>
	<span id="size">
		<input type="text" id="width" value="0"/>cm
		<input type="text" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>

<div id="book_s"  align=left>
<span id="title">책장</span>
	<select id="kind">
		<option>종류</option>
		<option>나무</option>
		<option>철제</option>
	</select>
	<span id="size">
		<input type="text" id="width" value="0"/>cm
		<input type="text" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>
	
<div id="refr"  align=left>
<span id="title">냉장고</span>
	<select id="kind">
		<option>종류</option>
		<option>소형</option>
		<option>중형</option>
		<option>대형</option>
	</select>
	<span id="size">
		<input type="text" id="width" value="0"/>cm
		<input type="text" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
</div>	


<div id="short_d"  align=left>
<span id="title">탁상</span>
	<select id="kind">
		<option>종류</option>
		<option>나무</option>
		<option>철제</option>
		<option>유리포함</option>
	</select>
	<span id="size">
		<input type="text" id="width" value="0"/>cm
		<input type="text" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<div id="tv_s"  align=left>
<span id="title">TV장</span>
	<select id="kind">
		<option>종류</option>
		<option>나무</option>
		<option>철제</option>
		<option>틀+책장포함</option>
	</select>
	<span id="size">
		<input type="text" id="width" value="0"/>cm
		<input type="text" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>

</div>

<div id="de_sh"  align=left>
<span id="title">서랍장</span>
	<select id="kind">
		<option>종류</option>
		<option>나무</option>
		<option>철제</option>
	</select>
	<span id="size">
		<input type="text" id="width" value="0"/>cm
		<input type="text" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<div id="wash"  align=left>
<span id="title">세탁기</span>
	<select id="kind">
		<option>종류</option>
		<option>통돌이</option>
		<option>드럼</option>
	</select>
	<span id="size">
		<input type="text" id="width" value="0"/>cm
		<input type="text" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>


<input class="btn btn-default btn-sm" value = "다음" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:Jsonsubmit(this.form)"/>

</form>
			