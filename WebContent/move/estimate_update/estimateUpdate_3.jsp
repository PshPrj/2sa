<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 06/20
	�������� �� ��° ������
 -->

<%@page import="move.db.EstimateDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">����</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">���� ũ���� ��</div>

<br/><br/><br/>

<script src="json.js"></script>
<script src="data.js"></script>
<script>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
	String estimate_content = (String)request.getAttribute("estimate_content");
%>

function Jsonsubmit(form1){

		var Data = getData(form1, 10, 1);
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


<form method="POST" action="../eUpdate.do" name="form1" class="form-inline">
	<input type="hidden" value="EU_4" name="cmd"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="estimate_content"/>
	<input type="hidden" value="<%=request.getAttribute("estimate_board_num") %>" name="estimate_board_num"/>
<div id="pc" align=left>
	<span id="title">PC</span>
	<span style="padding:60px"></span>
	<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>
	
<div id="fan" align=left>
	<span id="title">��ǳ��</span>
	<span style="padding:50px"></span>
	<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>
	
<div id="chair" align=left>
	<span id="title">����</span>
	<span style="padding:56px"></span>
	<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>	
	
<div id="bic" align=left>
<span id="title">������</span>
<span style="padding:50px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>
<div id="cooker" align=left>
<span id="title">���</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>

<div id="inst" align=left>
<span id="title">�Ǳ�</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>
<br/>	
	
<div id="pot" align=left>
<span id="title">ȭ��</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>	
	
<div id="rest" align=left>
<span id="title">��Ÿ</span>
<span style="padding:56px"></span>
<input type="number" id="num2" style="width: 45px; padding: 1px" value="0"/>
</div>	
<br/>	
<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:Jsonsubmit(this.form)"/>

</form>
			