<!-- 
 	��� : ��ȿ��
	���� ���� ���� :06/20
	���� �� ��° ������
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
<!-- ȸ���� ������ ���� �о�� ��ũ��Ʈ. -->
<script>

<%
	pageContext.setAttribute("DataArray", request.getParameter("DataArray"));
	//������ ������ �����͸� �޾ƿ´�. 
%>


function Jsonsubmit(form1){
		var Data = getData(form1, 5, 2);//���� ���
		var beforeData = '${DataArray}';
		
		var DataArray=new String();
		DataArray+=beforeData;
		DataArray+=Data;//���� �����Ϳ� ���� ������ ������ ��ġ��.
				
		document.form1.DataArray.value=DataArray;//������ ������.
		document.form1.submit();
	}
	

</script>

<br/><br/><br/>
<form method="POST" action="../estimate.do" name="form1" align=left>
	<input type="hidden" value="E_3" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>

<div id="desk2">
<span id="title">��Ź </span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>ö��</option>
		<option>�븮��</option>
	</select>
	<span id="size">
		<input type="number" name="width" value="0"/>cm
		<input type="number" name="height" value="0"/>cm
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
		<input type="number" name="width" value="0"/>cm
		<input type="number" name="height" value="0"/>cm
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
		<input type="number" name="width" value="0"/>cm
		<input type="number" name="height" value="0"/>cm
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
		<input type="number" name="width" value="0"/>cm
		<input type="number" name="height" value="0"/>cm
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
		<input type="number" name="width" value="0"/>cm
		<input type="number" name="height" value="0"/>cm
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
		<input type="number" name="width" value="0"/>cm
		<input type="number" name="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" align=center onclick="Jsonsubmit(this.form)"/>

</form>
			