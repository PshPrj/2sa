<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 6/19
	�ϰ� ��° ���� ������
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">����</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">��Ÿ ���� ����</div>

<br/><br/><br/>
<script src="json.js"></script>
<script>
<%
pageContext.setAttribute("Data", request.getParameter("DataArray"));
pageContext.setAttribute("distance_p", request.getAttribute("distance_p"));//�Ÿ��� �޾ƿ���.
%>

	function Jsonsubmit(form1){
		var Data = getData(form1);
		var beforeData='${Data}';
	
		var DataArray=new String();
		DataArray+=beforeData;
		DataArray+=Data;
		
		var FileArray = new Array();		

		var nodeList = document.getElementById("upFile"+count);
		
		for(var i = 0 ; i<count ; i++){
			var node=document.getElementById("upFile"+(i+1));
			FileArray[i]=node.value;//�ø��� ���� value�� �޾ƿ���.
		}
		
		document.form1.price.value=Number(sessionStorage.price)+Number('${distance_p}');
		//�Ÿ��� �ݾ� ��ꤤ
		
		document.form1.DataArray.value=DataArray;
		document.form1.submit();
	}



	var i = 0;
	function fnCheck(f){//��� ������ �÷ȴ��� üũ
		var length=f.elements.length;
		var cnt=1;
		
		for(var i=0;i<length;i++){
			if(f.elements[i].type=="file"){
				if(f.elements[i].value==""){
					alert(cnt+"��° ������ �ø��� �����̽��ϴ�.");
					return;
				}
				cnt++;
			}
		}
		
		f.submit();
	}
	
	
	var count=0;
	function fnAddInput(){//���� �ø� input file ����
		
		var div = document.getElementById("inputDiv");
		var file = document.createElement("input");
		file.setAttribute("type", "file");
		file.setAttribute("id", "upFile"+(++count));
		file.setAttribute("name","upFile"+count);
		
		var delete_f = document.createElement("input");
		delete_f.setAttribute("type", "button");
		delete_f.setAttribute("value", "����");
		delete_f.setAttribute("id","deleteFile"+count);
		delete_f.setAttribute("onclick","fnDeleteItem("+count+")");
		
		var div_s=document.createElement("div");
		
		div.appendChild(file);
		div.appendChild(delete_f);
		div.appendChild(div_s);
		
	}
	
	function fnDeleteItem(count){//���� ����
		var file = document.getElementById("upFile"+count);
		var delete_f=document.getElementById("deleteFile"+count);
		if(file!=null){
			file.parentNode.removeChild(file);
			delete_f.parentNode.removeChild(delete_f);
			i=i-1;
		}
	}
</script>
<form method="POST" action="../estimate.do" name="form1" enctype="multipart/form-data">
	<input type="hidden" value="E_8" name="cmd"/>
	<input type="hidden" value="<%=session.getAttribute("member_num")%>" name="member_num"/>
	<input type="hidden" value="<%=request.getAttribute("distance")%>" name="distance"/>
	<input type="hidden" value="<%=request.getAttribute("addr1") %>" name="addr1"/>
	<input type="hidden" value="<%=request.getAttribute("addr2") %>" name="addr2"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="FileArray"/>
	<input type="hidden" value="" name="price"/>

<span>���� �ø���</span><br/>
	<div id="inputDiv"></div>
	<br/>
	<input class="btn btn-default btn-sm" value = "���� �߰�" type="button" "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:fnAddInput()"/>
	<br/><br/>
	
	
<div id="trash">
<span id="title">������ ����</span><br/>
	<textarea name="������ ������ �˷��ּ���!" size="60" id="trash"></textarea>
</div>	

<br/><br/>
<input class="btn btn-default btn-sm" value = "����" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Jsonsubmit(this.form)"/>
</form>
			