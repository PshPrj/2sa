<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 06/14
	���� ù ������
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">����</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">���ǰ� ū ��</div>
<style>
	#title{
		display:inline-block;
		width:60px;
	}
	
	div{
		align:left
	}
</style>
<script src="json.js"></script><!-- ȸ���� �ۼ��� ����Ʈ�� �о�� ��ũ��Ʈ. -->

<script>

function Jsonsubmit(form1){
	sessionStorage.price=150000;//�⺻�� �ʿ����� ����
	var DataArray = getData(form1, 5, 4);//���� å���� ���� ����
	
	document.form1.DataArray.value=DataArray;
	document.form1.submit();
}

	

</script>

<!-- �̻�� ������ ��ǰ ��� �����ϱ�. -->
<br/><br/><br/>
<form method="POST" action="../estimate.do" name="form1">
	<input type="hidden" value="E_2" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>

<div id="bed" align=left>
<span id="title">ħ��</span>
	<select id="kind">
		<option>����</option>
		<option value="single">�̱�</option>
		<option value="king">ŷ</option>
		<option value="queen">��</option>
	</select>
	<select name="frame" id="frame">
		<option>����</option>
		<option>��Ʈ������</option>
		<option>��Ʈ����+������(����)</option>
		<option>��Ʈ����+������(�и�)</option>
	</select>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	
	<br/>
</div>

<div id="desk"  align=left>
<span id="title">å��</span>
	<select id="kind">
		<option>����</option>
		<option>��Ż</option>
		<option>����</option>
	</select>
	<select id="frame">
		<option>����</option>
		<option>Ʋ��</option>
		<option>Ʋ+����</option>
		<option>Ʋ+����+å��</option>
	</select>
<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	
	<br/>
</div>	

<div id="closet" align=left>
<span id="title">����</span>
	<select id="kind">
		<option>����</option>
		<option>�繮��</option>
		<option>�ܹ���</option>
	</select>
	<span id="size">
		<input type="number" id="width" value="0"/>cm
		<input type="number" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>

<div id="book_s"  align=left>
<span id="title">å��</span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>ö��</option>
	</select>
	<span id="size">
		<input type="number" id="width" value="0"/>cm
		<input type="number" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>
	
<div id="refr"  align=left>
<span id="title">�����</span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>����</option>
		<option>����</option>
	</select>
	<span id="size">
		<input type="number" id="width" value="0"/>cm
		<input type="number" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
</div>	


<div id="short_d"  align=left>
<span id="title">Ź��</span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>ö��</option>
		<option>��������</option>
	</select>
	<span id="size">
		<input type="number" id="width" value="0"/>cm
		<input type="number" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<div id="tv_s"  align=left>
<span id="title">TV��</span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>ö��</option>
		<option>Ʋ+å������</option>
	</select>
	<span id="size">
		<input type="number" id="width" value="0"/>cm
		<input type="number" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>

</div>

<div id="de_sh"  align=left>
<span id="title">������</span>
	<select id="kind">
		<option>����</option>
		<option>����</option>
		<option>ö��</option>
	</select>
	<span id="size">
		<input type="number" id="width" value="0"/>cm
		<input type="number" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>	

<div id="wash"  align=left>
<span id="title">��Ź��</span>
	<select id="kind">
		<option>����</option>
		<option>�뵹��</option>
		<option>�巳</option>
	</select>
	<span id="size">
		<input type="number" id="width" value="0"/>cm
		<input type="number" id="height" value="0"/>cm
	</span>
	<input type="number" id="num" style="width: 45px; padding: 1px" value="0"/>
	<br/>
</div>


<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:Jsonsubmit(this.form)"/>

</form>
			