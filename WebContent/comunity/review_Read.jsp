<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/20
	후기 게시판에 글 쓰기
 -->

<%@page import="move.db.QNABoardDto"%>
<%@page import="java.util.Vector"%>
<%@page import="move.db.CommentDao"%>
<%@page import="move.db.CommentDto"%>
<%@page import="move.db.ReviewBoardDto"%>
<%@page import="java.io.PrintWriter"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
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
	
	ReviewBoardDto dto=(ReviewBoardDto)request.getAttribute("dto");//후기 게시물 정보 가져오기.
	
	request.setAttribute("board_num","3");//후기 게시판 번호 지정
	CommentDto c_dto =new CommentDto();
	String member_num="0";
	if(session.getAttribute("member_num")!=null){//관리자인 경우 member_num을 0 으로 준다.
		member_num=(String)session.getAttribute("member_num");
	}
	
	
	String staff_type=null;
	String staff_num=null;
	if(session.getAttribute("staff_type")!=null){
		staff_type=(String)session.getAttribute("staff_type");
		staff_num=(String)session.getAttribute("staff_num");
	}
	
	c_dto.setBoard_num(3);
	c_dto.setContent_num(dto.getReview_board_num());
	
	CommentDao c_dao = new CommentDao();
	
	Vector commentList = (Vector)c_dao.commentList(c_dto);
%>

<div align=left>
	<a href=<%if(keyWord.equals("null")){%>"../front?cmd=REVIEW"<%}else{%>"../front?cmd=REVIEW&keyWord=<%=keyWord%>&&keyField=<%=keyField%>"<%} %>>
		<input class="btn btn-default btn-sm" value = "목록" type="button" id="list" style="font-family: 'Jeju Gothic', serif;"/>
	</a>
</div>
<br/>

<form method="post" action="../review.do?cmd=RUPDATE" align=left>
<div class="subject" style="border-top:1px solid #6E6865; padding:15px">
	<span><%=dto.getReview_subject()%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span>REVIEW 게시판</span> 
</div>
<div class="writer" style="border-top:1px solid #6E6865; padding:10px">
	<a><%=dto.getMember_id() %></a>&nbsp;&nbsp;&nbsp;
	<span class="bar2">|</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="p11"><%=dto.getReview_views_cnt()%></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="bar2">|</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<span class="p11"><%=dto.getReview_date()%></span>
</div>
<div class="content" style="border-top:1px solid #6E6865">
<br/>
<%=dto.getReview_content()%><br/><br/><br/><br/><br/><br/><br/>
</div>


<!-- 댓글 -->
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
				<div class="span1"></div>
				<div class="span7">
					<center>
					<i class="fa fa-user-secret" aria-hidden="true"></i>비밀 댓글입니다.</center>
				</div>
				<div class="span1"></div>
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
	<input type="hidden" value="<%=dto.getReview_board_num()%>" name="content_num"/>
	<textarea name="comment_content" id="comment_content" rows="3" style="WIDTH: 80%"></textarea>&nbsp;
	<input type="checkbox" value="true" name="is_secret"/>비밀 리플
	&nbsp;&nbsp;&nbsp;
	<input class="btn btn-default btn-sm" value = "등록" type="button" id="comment_insert" onclick="submit()" />
</form>
</c:if>

 <form method="post" action="../review.do?cmd=UPDATE">
	<hr size=1 style="border-top:1px solid #6E6865">

	<%if(Integer.parseInt(member_num) == dto.getMember_num()){ %>
	<a href=<%if(keyWord.equals("null")){%>"../review.do?cmd=RUPDATE&review_board_num=<%=dto.getReview_board_num()%>"<%}else{%>"../front?cmd=REVIEW&keyWord=<%=keyWord%>&&keyField=<%=keyField%>"<%} %>>
		<input class="btn btn-default" value = "수정" type="button" id="list"/>
	</a>&nbsp;&nbsp;&nbsp;
	<%} %>

	<%if(Integer.parseInt(member_num) == dto.getMember_num()||session.getAttribute("staff_num")!=null){ %>
	<a href=<%if(keyWord.equals("null")){%>"../review.do?cmd=RDELETE&review_board_num=<%=dto.getReview_board_num()%>"<%}else{%>"../front?cmd=REVIEW&keyWord=<%=keyWord%>&&keyField=<%=keyField%>"<%} %>>
		<input class="btn btn-default btn-sm" value = "삭제" type="button" id="list" />
	</a>
	<%} %>
</form>
</form>
