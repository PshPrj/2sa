<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/16
	공지 쓰기
 -->

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" %>
<META http-equiv=refresh>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<script type="text/javascript">
var oEditors = null;
function setEditor(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "notice_content",
	    sSkinURI: "../se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2",
	    htParams:{fOnBeforUnload:function(){}}
	});
}

$(function(){
	if(oEditors==null){
		oEditors=[];
		setEditor();
	}
})

function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["notice_content"].exec("UPDATE_CONTENTS_FIELD", []);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("notice_content").value를 이용해서 처리한다.
 
    try {
        elClickedObj.form.submit();
    } catch(e) {}
}


</script>
<div class="span1" style="background-color:#E5B1C5; margin-left:0px; height:20px; width:100px; margin-top:0px; color:#6E6865">공지 쓰기</div><br/><br/>

<br/><br/>
<div style="margin-left:0px" align=left>
<form method="POST" action="../notice.do?cmd=POSTProc">
<input type="hidden" name="staff_num" value="<%=session.getAttribute("staff_num")%>"/>
	<div>관리자</div>
	<div class="row-fluid">
		제목<input type=text name=notice_subject width="50px" maxlength=50>
	</div>
	<textarea class="span9" name=notice_content id=notice_content rows=30 cols=150></textarea>
	<div class="row-fluid">
		<input class="btn btn-default btn-sm" value = "등록" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="submitContents(this)"/>
        <input type=reset value="다시쓰기" style="font-family: 'Jeju Gothic', serif;">&nbsp;&nbsp;
     </div>
</form>
</div>

