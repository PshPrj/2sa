<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/20
	문의 게시판 첫 페이지
 -->

 <%@ page contentType="text/html; charset=utf-8" %>
<%@page import="move.db.QNABoardDto"%>
<%@page import="java.util.Vector"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
		
	int member_num = 0;
	if(session.getAttribute("member_num")!=null){
		request.setAttribute("member_num", session.getAttribute("member_num"));
		member_num=Integer.parseInt((String)session.getAttribute("member_num"));
	}
	
	if(session.getAttribute("staff_num")!=null){
		request.setAttribute("staff_num", session.getAttribute("staff_num"));
		request.setAttribute("staff_type", session.getAttribute("staff_type"));
	}
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

<div class="span9" style="margin-top:0px;margin-left:0px">
<div class="span1" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; margin-left:0px">REVIEW</div><br/><br/>
<br/>

<table border=0 width=80%>
<tr align="left">
	<td>
		<c:if test="${!empty member_num}">
				<a href="../review.do?cmd=RPOST">
				<input class="btn btn-default btn-sm" value = "글쓰기" type="button" style="align:'left'; font-family: 'Jeju Gothic', serif;"></a>
		</c:if>
		
	 	새 글 ${todayPage} / ${pdto.totalRecord} Articles(	<font color=red>  ${pdto.nowPage+1} / ${pdto.totalPage} Pages </font>)
	</td>
</tr>
</table>

<ul class="thumbnails">

<c:choose>
<c:when test="${fn:length(list) == 0}">

		<td colspan="5" style="align:center;">게시물 없음</td>

</c:when>
<c:otherwise>
	
	<c:set var="stop" value="false"/>
	<c:set var ="i" value="0"/>
	<c:forEach begin="${pdto.beginPerPage}" end="${pdto.beginPerPage + pdto.numPerPage}" items="${list}" var="review_board" step="1">
		<c:set var="i" value="${i+1}"/>
		<c:if test="${stop eq false}">
		<c:if test="${i eq pdto.totalRecord}">
			<c:set var="stop" value="true"/>
		</c:if>
		
		<li class="span3" align="center" style="left-margin:0px">
					<div class="thumbnail"><!-- 리뷰 게시물은 썸네일 형식으로 -->
					<div>${review_board.review_board_num}</div>
						<i class="fa fa-edit fa-5x" style="align:center;"></i>
						<div class="caption" align="center">
							<h3 class="">${review_board.review_subject}</h3>
							<p class="">${review_board.member_id}</p>
							<p>${review_board.review_date}&nbsp;&nbsp;조회수 : ${review_board.review_views_cnt}</p>
							<div class="star_check">
								
								<c:forEach begin="1" end="${review_board.star}" step="1">
									 <a href="#" class="on">★</a>
								</c:forEach>
							
								<c:forEach begin="${review_board.star}" end="4" step="1">
									<a href="#">★</a>
								</c:forEach>
							
							</div>
							<p align="center"><a href="../review.do?cmd=RREAD&review_board_num=${review_board.review_board_num}&&keyWord=${keyWord}&&keyField=${keyField}"><button class="btn btn-primary " style="margin-bottom:0px; font-family: 'Jeju Gothic', serif;">자세히 보기</button></a></p>
						</div>
					</div>
					</li>
			
		</c:if>
		
	</c:forEach>
</c:otherwise>
</c:choose>
</ul>


<table align=center>
<tr>
	<td align=center> 
	<div class="pagination pagination-centered">
	<ul>
	<c:if test="${pdto.nowBlock > 0}">
		<li><a href="../front?cmd=REVIEW&nowBlock=${pdto.nowBlock-1}&nowPage=${(pdto.nowBlock-1)*pdto.pagePerBlock}">&lt</a></li>
	</c:if>
	
	<c:set var="stop2" value="false"/>

		<c:forEach begin="0" end="${pdto.pagePerBlock-1}" step="1" var="i">
			<c:if test="${stop2 eq false}">
				<c:if test="${(pdto.nowBlock*pdto.pagePerBlock)+i+1 eq pdto.totalPage}">
					<c:set var="stop2" value="true"/>
				</c:if>
				<li><a href="../front?cmd=REVIEW&nowPage=${(pdto.nowBlock*pdto.pagePerBlock)+i}&nowBlock=${pdto.nowBlock}">
					${i+1+(pdto.nowBlock*pdto.pagePerBlock)}</a></li>	
			</c:if>
	
		</c:forEach>

<c:if test="${pdto.totalBlock > pdto.nowBlock+1}">
	<li><a href="../front?cmd=REVIEW&nowBlock=${pdto.nowBlock+1}&nowPage=${(pdto.nowBlock+1)*pdto.pagePerBlock}">&gt</a></li>
</c:if>
	</ul>
	</div>
	</td>
	<td align=right>
		<a href="../front?cmd=REVIEW">[처음으로]</a>
	</td>
</tr>
</tr>
</table>
<BR>
<form action="../front?cmd=REVIEW" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
		<div class="form-inline">
			<select name="keyField" >
				<option value="review_subject" <c:if test="${keyField eq 'review_subject'}">selected="selected"</c:if>> 제목
				<option value="review_content" <c:if test="${keyField eq 'review_content'}">selected="selected"</c:if>> 내용
			</select>

			<input type="text" size="16" name="keyWord" value="${keyWord}" style="height:20px">
			<input type="button" value="찾기" onClick="submit()">
			<input type="hidden" name="page" value= "0">
		</div>
		</td>
	</tr>
	</table>
</form>
 

</section>
</div>
