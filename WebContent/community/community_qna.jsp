<!-- 
 	��� : ��ȿ��
	���� ���� ���� : 6/20
	���� �Խ��� ù ������
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@page import="move.db.QNABoardDto"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
	
	int member_num = 0;
	if(session.getAttribute("member_num")!=null){
		request.setAttribute("member_num", session.getAttribute("member_num"));
		member_num=Integer.parseInt((String)session.getAttribute("member_num"));
		pageContext.setAttribute("member_num", member_num);
	}
	
	if(session.getAttribute("staff_num")!=null){
		request.setAttribute("staff_num", session.getAttribute("staff_num"));
		request.setAttribute("staff_type", session.getAttribute("staff_type"));
		pageContext.setAttribute("member_num", member_num);
	}
%>

<div class="span9" style="margin-top:0px;margin-left:0px">
<div class="span1" style="background-color:#E5B1C5; height:20px; width:100px; margin-top:0px; margin-left:0px">����</div><br/><br/>
<br/>

<table border=0 width=80%>
<tr align="left">
	<td>
		<c:if test="${!empty pageScope.member_num}">
				<a href="../qna.do?cmd=POST">
				<input type="hidden" name="cmd" value="POST"/>
				<input class="btn btn-default btn-sm" value = "�۾���" type="button" style="align:'left'; font-family: 'Jeju Gothic', serif;"></a>
		</c:if>
		
	 	�� �� ${todayPage} / ${pdto.totalRecord} Articles(	<font color=red>  ${pdto.nowPage+1} / ${pdto.totalPage} Pages </font>)
	</td>
</tr>
</table>

<table border=0 width=100% cellpadding=2 cellspacing=0 >
 <tr>
	<td align=left colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=left height=120%>
				<td style="width:50px"> ��ȣ </td>
				<td align=center style="width:410px"> ���� </td>
				<td style="width:100px"> �̸� </td>
				<td style="width:210px"> ��¥ </td>
				<td> ��ȸ�� </td>
			</tr>
		</table>
<table class="table table-striped table-hover">

<c:choose>
<c:when test="${fn:length(list) == 0}">
	<tr>
		<td colspan="5" style="align:center;">�Խù� ����</td>
	</tr>
</c:when>
<c:otherwise>
	
	<c:set var="stop" value="false"/>
	<c:set var ="i" value="0"/>
	<c:forEach begin="${pdto.beginPerPage}" end="${pdto.beginPerPage + pdto.numPerPage}" items="${list}" var="qna_board" step="1">
		<c:set var="i" value="${i+1}"/>
		<c:if test="${stop eq false}">
		<c:if test="${i eq pdto.totalRecord}">
			<c:set var="stop" value="true"/>
		</c:if>
			
			<tr align=center height=120%>
				<td style="width:50px"><c:out value="${qna_board.qna_board_num}"/></td>
				
				<td align=center style="width:380px">
				<c:if test="${qna_board.depth >= 1 }"><i class="fa fa-angle-right" aria-hidden="true"></i></c:if><!-- �亯�� ǥ�� -->
					<c:choose>
					  <c:when test="${qna_board.member_num == member_num or member_num == 0}">
					  	<a href="../qna.do?cmd=READ&qna_board_num=${qna_board.qna_board_num }&&keyWord=${keyWord }&&keyField=${keyField}">${qna_board.qna_subject}</a>
					  </c:when>
					  <c:otherwise>��б� �Դϴ�.</c:otherwise>
					</c:choose>
				</td>
				
				<td style="width:80px">
				<c:if test="${qna_board.depth>0 }">
					������
				</c:if>
				<c:if test="${qna_board.depth==0 }">
					${qna_board.member_id }
				</c:if>
				</td>
				<td style="width:210px">${qna_board.qna_date}</td>
				<td>${qna_board.qna_views_cnt}</td>
			</tr>	
			
		</c:if>
		
	</c:forEach>
</c:otherwise>
</c:choose>
</table>
	</td>
</tr>
</table>

<table align=center>
<tr>
	<td align=center> 
	<div class="pagination pagination-centered">
	<ul>
	<c:if test="${pdto.nowBlock > 0}">
		<li><a href="../front?cmd=QNA&nowBlock=${pdto.nowBlock-1}&nowPage=${(pdto.nowBlock-1)*pdto.pagePerBlock}">&lt</a></li>
	</c:if>
	
	<c:set var="stop2" value="false"/>

		<c:forEach begin="0" end="${pdto.pagePerBlock-1}" step="1" var="i">
			<c:if test="${stop2 eq false}">
				<c:if test="${(pdto.nowBlock*pdto.pagePerBlock)+i+1 eq pdto.totalPage}">
					<c:set var="stop2" value="true"/>
				</c:if>
				<li><a href="../front?cmd=QNA&nowPage=${(pdto.nowBlock*pdto.pagePerBlock)+i}&nowBlock=${pdto.nowBlock}">
					${i+1+(pdto.nowBlock*pdto.pagePerBlock)}</a></li>	
			</c:if>
	
		</c:forEach>

<c:if test="${pdto.totalBlock > pdto.nowBlock+1}">
	<li><a href="../front?cmd=QNA&nowBlock=${pdto.nowBlock+1}&nowPage=${(pdto.nowBlock+1)*pdto.pagePerBlock}">&gt</a></li>
</c:if>
	</ul>
	</div>
	</td>
	<td align=right>
		<a href="../front?cmd=QNA">[ó������]</a>
	</td>
</tr>
</tr>
</table>
<BR>
<form action="../front?cmd=QNA" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
		<div class="form-inline">
			<select name="keyField" >
				<option value="qna_subject" <c:if test="${keyField eq 'qna_subject'}">selected="selected"</c:if>> ����
				<option value="qna_content" <c:if test="${keyField eq 'qna_content'}">selected="selected"</c:if>> ����
			</select>

			<input type="text" size="16" name="keyWord" value="${keyWord}" style="height:20px">
			<input type="button" value="ã��" onClick="submit()">
			<input type="hidden" name="page" value= "0">
		</div>
		</td>
	</tr>
	</table>
</form>
 

</section>
</div>
