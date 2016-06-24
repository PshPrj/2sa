<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/19
	리뷰를 포스트할 수 있다.
 -->

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" %>
<script type="text/javascript" src="../se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<style>
.star_check {font-size:0; letter-spacing:-4px;}
.star_check a {
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}
.star_check a:first-child {margin-left:0;}
.star_check a.on {color:#777;}
</style>
<script>
$( window ).load(function() {
	$( ".star_check a" ).click(function() {
	    $(this).parent().children("a").removeClass("on");
	    $(this).addClass("on").prevAll("a").addClass("on");

	    return false;
	});
});

function checkStar(star){
	document.form1.star.value=star;
	//$('#star').attr("value",star);
}

</script>

<script type="text/javascript">

//네이버 스마트 에디터 textarea에 삽입
var oEditors = null;
function setEditor(){
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "review_content",
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
    oEditors.getById["review_content"].exec("UPDATE_CONTENTS_FIELD", []);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("qna_content").value를 이용해서 처리한다.
 
    try {
        elClickedObj.form.submit();
    } catch(e) {}
}


</script>
<% 

	int member_num = Integer.parseInt((String)session.getAttribute("member_num"));
	
%>


<div class="span1" style="background-color:#E5B1C5; margin-left:0px; height:20px; width:100px; margin-top:0px; color:#6E6865">리뷰 작성</div><br/><br/>

<br/><br/>
<div style="margin-left:0px" align=left>
<form method="POST" action="../review.do?cmd=RPOSTProc" name="form1">
<input type="hidden" value="RPOSTProc" name="cmd"/>
<input type="hidden" name="member_num" value="<%=member_num%>"/>
<input type="hidden" name="star" value=""/>
	<div class="row-fluid">
		제목 &nbsp;<input type=text name=review_subject width="50px" maxlength=50>
	</div>
	<div> 별점 
		<div class="star_check">
		    <a href="#" class="on" onclick="checkStar(1)">★</a>
		    <a href="#" class="on" onclick="checkStar(2)">★</a>
		    <a href="#" class="on" onclick="checkStar(3)">★</a>
		    <a href="#" onclick="checkStar(4)">★</a>
		    <a href="#" onclick="checkStar(5)">★</a>
		</div>
	</div>
	<textarea class="span9" name=review_content id=review_content rows=30 cols=150></textarea>
	<div class="row-fluid">
		<input class="btn btn-default btn-sm" value = "등록" type="button" id="submit "style="font-family: 'Jeju Gothic', serif;" onclick="submitContents(this)"/></a>
        <input type=reset value="다시쓰기" style="font-family: 'Jeju Gothic', serif;">&nbsp;&nbsp;
     </div>
</form>
</div>

