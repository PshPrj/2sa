<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 06/20
	���� ���� �� ��° ������
 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">����</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">���ǰ� ū ��</div>
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
<span id="title">��Ź </span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>ö��</option>
		<option>�븮��</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	
	
<div id="make">
<span id="title">ȭ���</span>
	<select id="kind">
		<option>����</option>
		<option>Ʋ</option>
		<option>Ʋ+����</option>
		<option>Ʋ+����</option>
		<option>Ʋ+����+����</option>
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
		<option>����</option>
		<option>���</option>
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
<span id="title">��ⱸ</span>
	<select id="kind">
		<option>����</option>
		<option>����ũ</option>
		<option>���׸ӽ�</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	
	
<div id="sofa">
<span id="title">����</span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>õ</option>
		<option>ħ�����</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<div id="dec">
<span id="title">������</span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>ö��</option>
	</select>
	<span id="size">
		<input type="text" name="width" value="0"/>cm
		<input type="text" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" align=center onclick="Jsonsubmit(this.form)"/>

</form>
			