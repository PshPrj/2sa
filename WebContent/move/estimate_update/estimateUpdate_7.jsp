
<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/20
	견적 일곱 번째 페이지
 -->
<%@page import="java.util.Vector"%>
<%@page import="move.db.PictureDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

	<div class="span5" id="ver" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; align:left;">견적</div>
	<div class="span3" aling=right style="background-color:#79B3DC; height:20px; width:100px; margin-top:0px;">기타 참고 사항</div>

<br/><br/><br/>
<script src="json.js"></script>
<script src="data.js"></script>

<script>
<%
	pageContext.setAttribute("Data", request.getParameter("DataArray"));
	pageContext.setAttribute("distance_p", request.getAttribute("distance_p"));
	String estimate_content = (String)request.getAttribute("estimate_content");
%>
	window.onload=function(){
		var content = "${estimate_content}";
		splitData("${estimate_content}", document.form1);
	}

	function Jsonsubmit(form1){
		var Data = getData(form1);
		var beforeData='${Data}';
	
		var DataArray=new String();
		DataArray+=beforeData;
		DataArray+=Data;
		alert(DataArray);
		
		var FileArray = new Array();		

		var nodeList = document.getElementById("upFile"+count);
		
		for(var i = 0 ; i<count ; i++){
			var node=document.getElementById("upFile"+(i+1));
			FileArray[i]=node.value;
		}
		
		document.form1.price.value=Number(sessionStorage.price)+Number('${distance_p}');
		
		document.form1.DataArray.value=DataArray;
		document.form1.submit();
	}



	var i = 0;
	function fnCheck(f){
		var length=f.elements.length;
		var cnt=1;
		
		for(var i=0;i<length;i++){
			if(f.elements[i].type=="file"){
				if(f.elements[i].value==""){
					alert(cnt+"번째 파일을 올리지 않으셨습니다.");
					return;
				}
				cnt++;
			}
		}
		
		f.submit();
	}
	
	
	var count=0;
	function fnAddInput(){
		
		var div = document.getElementById("inputDiv");
		var file = document.createElement("input");
		file.setAttribute("type", "file");
		file.setAttribute("id", "upFile"+(++count));
		file.setAttribute("name","upFile"+count);
		
		var delete_f = document.createElement("input");
		delete_f.setAttribute("type", "button");
		delete_f.setAttribute("value", "삭제");
		delete_f.setAttribute("id","deleteFile"+count);
		delete_f.setAttribute("onclick","fnDeleteItem("+count+")");
		
		var div_s=document.createElement("div");
		
		div.appendChild(file);
		div.appendChild(delete_f);
		div.appendChild(div_s);
		
	}
	
	function fnDeleteItem(count){
		var file = document.getElementById("upFile"+count);
		var delete_f=document.getElementById("deleteFile"+count);
		if(file!=null){
			file.parentNode.removeChild(file);
			delete_f.parentNode.removeChild(delete_f);
			i=i-1;
		}
	}
	
	
	var picture_list = new Array();
	var picture_name = new Array();
	function picture_choice(num, element, name){
		
		if(element.firstChild.hasAttribute("style")){
			element.firstChild.removeAttribute("style");
			picture_list.splice(picture_list.indexOf(num),1);
			picture_name.splice(picutre_name.indexOf(name),1)
			alert(picture_name+picture_list);
			//$('#estimate_dto').val("");
		}else{
			picture_list.push(num);
			picture_name.push(name);
			element.firstChild.setAttribute("style", "background-color:#F0DDE5");
		}
		document.form1.picture_list.value=picture_list;
		document.form1.picture_name.value=picture_name;
	}
</script>
<form method="POST" action="../eUpdate.do" name="form1" enctype="multipart/form-data">
	<input type="hidden" value="EU_8" name="cmd"/>
	<input type="hidden" value="<%=session.getAttribute("member_num")%>" name="member_num"/>
	<input type="hidden" value="<%=request.getAttribute("distance")%>" name="distance"/>
	<input type="hidden" value="<%=request.getAttribute("addr1") %>" name="addr1"/>
	<input type="hidden" value="<%=request.getAttribute("addr2") %>" name="addr2"/>
	<input type="hidden" value="" name="DataArray"/>
	<input type="hidden" value="" name="FileArray"/>
	<input type="hidden" value="" name="price"/>
	<input type="hidden" value="<%=request.getAttribute("estimate_board_num") %>" name="estimate_board_num"/>
	<input type="hidden" value="" name="picture_list"/>
	<input type="hidden" value="" name="picture_name"/>
	
<span>저장된 사진(선택하시면 삭제 됩니다.)</span><br/>
<%
Vector picture_dto = (Vector)request.getAttribute("picture_dto");
for(int i =0; i<picture_dto.size();i++){ 
	PictureDto dto = (PictureDto)picture_dto.get(i);
	String imgName = dto.getImg();
%>
	<a href="#" onclick="picture_choice(<%=dto.getPicture_num()%>, this, '<%=imgName%>')"><div class="span4" align=center>사진 <%=i+1 %>.<%=imgName %></div></a>
	<br/><br/>
<%} %>
<br/><br/><br/>
<span>사진 올리기</span><br/>
	<div id="inputDiv"></div>
	<br/>
	<input class="btn btn-default btn-sm" value = "사진 추가" type="button" "style="font-family: 'Jeju Gothic', serif;" onclick="javascript:fnAddInput()"/>
	<br/><br/>
	
	
<div id="trash">
<div id="title">버리는 물건</div><span style="padding:10px"></span>
	<textarea value="버리실 물건을 알려주세요!" size="60" id="trash"></textarea>
</div>	

<br/><br/>
<input class="btn btn-default btn-sm" value = "저장" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="Jsonsubmit(this.form)"/>
</form>
			