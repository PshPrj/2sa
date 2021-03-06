<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/20
	문의 게시물 수정
 -->

<%@page import="move.db.QNABoardDto"%>
<%@page import="move.db.NoticeBoardDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<script type="text/javascript">
var oEditors = null;
function setEditor(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "qna_content",
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
    oEditors.getById["qna_content"].exec("UPDATE_CONTENTS_FIELD", []);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("qna_content").value를 이용해서 처리한다.
 
    try {
        elClickedObj.form.submit();
    } catch(e) {}
}
</script>

<%
	QNABoardDto dto = (QNABoardDto)request.getAttribute("dto");
%>

<div class="span1" style="background-color:#E5B1C5; margin-left:0px; height:20px; width:100px; margin-top:0px; color:#6E6865">문의글 수정</div><br/><br/>

<br/>
<div style="margin-left:0px" align=left>
<form method="POST" action="../qna.do?cmd=UPDATEProc">
<input type="hidden" name="member_num" value="<%=session.getAttribute("member_num")%>"/>
<input type="hidden" name="qna_board_num" value="<%=dto.getQna_board_num()%>"/>
	<div><%=dto.getMember_id()%></div>
	<div class="row-fluid">
		제목&nbsp;&nbsp;<input type=text name=qna_subject width="50px" maxlength=50 value=<%=dto.getQna_subject()%>>
	</div>
	<textarea class="span9" name=qna_content id=qna_content rows=30 cols=150 value=<%=dto.getQna_content()%>></textarea>
	<div class="row-fluid">
		<input class="btn btn-default btn-sm" value = "등록" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="submitContents(this)"/></a>
     </div>
</form>
</div>

