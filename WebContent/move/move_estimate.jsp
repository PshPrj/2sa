<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 06/19
	���� ù ������
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<style>
 img {
	width: 150px;
	height: 150px;
}
</style>
<div class="span7" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">���� �Խ���</div>
<div align=right>

<form action="../estimate.do" method="POST">
	<input type="hidden" value="E_1" name="cmd"/>
	<input class="btn btn-default btn-sm" value = "���� ����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="submit()"/>
</form>

<form action="../eUpdate.do" method="POST">
	<input type="hidden" value="EU_S" name="cmd"/>
	<input type="hidden" value="${member_num}" name="member_num"/>
	<input class="btn btn-default btn-sm" value = "���� ����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="submit()"/>
</form>

<form action="../eUpdate.do" method="POST">
	<input type="hidden" value="EDELETE" name="cmd"/>
	<input type="hidden" value="${member_num}" name="member_num"/>
	<input class="btn btn-default btn-sm" value = "���� ����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="submit()"/>
</form>

</div>
<br/><br/>

<div class="span5" style="align:center">
		<img src="../img/picto/1029-23.png" height="400" width="400">
</div>
<div>
		<h3>������ ������ ���ǵ��� �˷��ּ���.</h3>
		<h3>��Ȧ�� ���� ����ϰڽ��ϴ�!</h3>
</div>

<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>