<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 6/19
	�ټ� ��° ���� ������
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">����</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">���� ���� Ȯ��</div>

<br/><br/><br/>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
%>
<script src="json.js"></script>
<script>
function Jsonsubmit(form1){
	var beforeData='${Data}';
	
	var DataArray = new Array();
	DataArray.push(beforeData);
	
	document.form1.DataArray.value=DataArray;
	document.form1.submit();
}
	
window.onload=function(){//�޾ƿ� �����͸� ���ؿ� ���� �߶󳻱�.
	var DataArray='${Data}';

	var choice = document.form1.choice;
	var list1;
	var list2=new Array();
	var final_list=new String();

	list1=DataArray.split(",");//�� ������ �����;� �ڸ���.
	for(var i in list1){
		list2[i]=list1[i].split("_");//�����ִ� �����͸� ����ȭ ��Ű��.
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

<form method="POST" action="../estimate.do" name="form1">
	<input type="hidden" value="E_6" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
<div align=left>
<span>���� ���� Ȯ��</span><br/>
	<textarea width=200px id="choice" readonly=readonly rows="10" style="WIDTH: 30%"></textarea>
</div>

<br/><br/>	
<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Jsonsubmit(this.form)"/>
</form>		