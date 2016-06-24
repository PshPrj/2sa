<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/20
	문의 게시판 게시물 읽기
 -->

<%@page import="move.db.QNABoardDto"%>
<%@page import="java.util.Vector"%>
<%@page import="move.db.CommentDao"%>
<%@page import="move.db.CommentDto"%>
<%@page import="move.db.NoticeBoardDto"%>
<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	btn{
		font-family: 'Jeju Gothic', serif;
	}
	
	textarea{
		resize:none;
	}
	
	.button{
		font-family: 'Jeju Gothic', serif;
	}
</style>
<script src="comment_check.js"></script>
<%
	request.setCharacterEncoding("euc-kr");
	String keyWord=request.getParameter("keyWord");
	String keyField=request.getParameter("keyField");
	
	QNABoardDto dto=(QNABoardDto)request.getAttribute("dto");
	
	if(dto.getDepth()>0){//관리자만이 문의글에 답변을 달 수 있기 때문
		dto.setMember_id("관리자");
	}
	
	request.setAttribute("board_num","2");
	CommentDto c_dto =new CommentDto();
	String member_num="0";
	if(session.getAttribute("member_num")!=null){
		member_num=(String)session.getAttribute("member_num");
	}
	
	c_dto.setBoard_num(2);
	c_dto.setContent_num(dto.getQna_board_num());
	
	CommentDao c_dao = new CommentDao();
	
	Vector commentList = (Vector)c_dao.commentList(c_dto);
	
	
%>

<div align=left>
	<a href=<%if(keyWord.equals("null")){%>"../front?cmd=NOTICE"<%}else{%>"../front?cmd=NOTICE&keyWord=<%=keyWord%>&&keyField=<%=keyField%>"<%} %>>
		<input class="btn btn-default btn-sm" value = "목록" type="button" id="list" style="font-family: 'Jeju Gothic', serif;"/>
	</a>
</div>
<br/>



<form method="post" action="../qna.do?cmd=UPDATE" align=left>
<div class="subject" style="border-top:1px solid #6E6865; padding:15px">
	<span>${dto.qna_subject}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>QNA 게시판</span> 
</div>
<div class="writer" style="border-top:1px solid #6E6865; padding:10px">
	<a>${dto.member_id}</a>&nbsp;&nbsp;&nbsp;
	<span class="bar2">|</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="p11">${dto.qna_views_cnt}</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="bar2">|</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="p11">${dto.qna_date}</span>
</div>
<div class="content" style="border-top:1px solid #6E6865">
<br/>
${dto.qna_content}<br/><br/><br/><br/><br/><br/><br/>
</div>



<div style="height:10px">댓글 개수 : <%=commentList.size()%></div>
<hr size=1 style="border-top:1px solid #6E6865">
<form aling=left name="form1">
	<span border="1px" name="comment_span">
	<%for(int i=0;i<commentList.size();i++){
		CommentDto comment = (CommentDto)commentList.get(i);
		comment.setBoard_num(Integer.parseInt((String)request.getAttribute("board_num")));
		
		if(comment.isIs_secret()==false||comment.isIs_secret()==true&&comment.getMember_num()==Integer.parseInt(member_num)||member_num.equals("0")){
	%>
		<div class="span1"><%=comment.getMember_id() %></div>
		<div style="padding:1px"></div><div class="span7" align=left name="c_content"><%=comment.getComment_content()%></div>
			<%if(comment.getMember_num()==Integer.parseInt(member_num)||member_num.equals("0")){%>
				<div class="span1" id="C_update"><a href="#" onclick="updateComment(this, <%=comment.getComment_num()%>, '<%=comment.getComment_content()%>', <%=comment.getBoard_num()%>)">수정</a>&nbsp;|&nbsp;<a href="../comment.do?cmd=CDELETE&comment_num=<%=comment.getComment_num()%>">삭제</a></div>
			<%}else{%>
				<div class="span1">&nbsp;&nbsp;&nbsp;&nbsp;</div>
			<%
				}
			}else if(comment.isIs_secret()==true){%>
				<br/>
				<div class="span10">
					<center>
					<i class="fa fa-user-secret" aria-hidden="true"></i>비밀 댓글입니다.</center>
				</div>
				<br/>
			<%}
			
			}%>

	</span>
</form>


<br/><br/><br/><br/>
<c:if test="${!empty member_num or !empty staff_num }">
<form align=left action="../comment.do" method="POST">
	<input type="hidden" value="<%=request.getAttribute("board_num") %>" name="board_num"/>
	<input type="hidden" value="C_1" name="cmd"/>
	<input type="hidden" value="<%=session.getAttribute("member_num") %>" name="member_num"/>
	<input type="hidden" value="<%=dto.getQna_board_num()%>" name="content_num"/>
	<textarea name="comment_content" id="comment_content" rows="3" style="WIDTH: 80%"></textarea>&nbsp;
	<input type="checkbox" value="true" name="is_secret"/>비밀 리플
	&nbsp;&nbsp;&nbsp;
	<input class="btn btn-default btn-sm" value = "등록" type="button" id="comment_insert" onclick="submit()" />
</form>
</c:if>

 <form method="post" action="../qna.do?cmd=UPDATE">
	<hr size=1 style="border-top:1px solid #6E6865">

	
	<a href=<%if(keyWord.equals("null")){%>"../qna.do?cmd=UPDATE&qna_board_num=${}<%=dto.getQna_board_num()%>"<%}else{%>"../front?cmd=QNA&keyWord=<%=keyWord%>&&keyField=<%=keyField%>"<%} %>>
		<input class="btn btn-default" value = "수정" type="button" id="list"/>
	</a>&nbsp;&nbsp;&nbsp;

	&nbsp;&nbsp;&nbsp;	
	<a href=<%if(keyWord.equals("null")){%>"../qna.do?cmd=DELETE&qna_board_num=<%=dto.getQna_board_num()%>"<%}else{%>"../front?cmd=QNA&keyWord=<%=keyWord%>&&keyField=<%=keyField%>"<%} %>>
		<input class="btn btn-default btn-sm" value = "삭제" type="button" id="list" />
		<%if(session.getAttribute("staff_num")!=null){%>
			<a href=<%if(keyWord.equals("null")){%>"../qna.do?cmd=REPLY&qna_board_num=<%=dto.getQna_board_num()%>&member_num=<%=dto.getMember_num() %>"<%}else{%>"../front?cmd=QNA&keyWord=<%=keyWord%>&&keyField=<%=keyField%>"<%} %>>
		<input type="hidden" value="<%=dto.getMember_num()%>" name="member_num"/>
		<input class="btn btn-default" value = "답글" type="button" id="list"/>
	</a>
	<%} %>
	</a>
</form>
</form>
