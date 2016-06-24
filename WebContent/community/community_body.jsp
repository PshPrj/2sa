<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/06
	커뮤니티 파트의 front 부분
 -->

<%@ page contentType="text/html; charset=UTF-8"%>
<div class="container">
<%
	String boardpage = (String)request.getAttribute("boardpage");
	String board = (String)request.getAttribute("board");
	String active1=null;
	String active2=null;
	   if(boardpage=="REVIEW"){
			active1="active";
		}else if(boardpage=="QNA"){
			active2="active";
		}
%>
	<div class="span12">
		<div class="row">
			<div class="span2" style="margin-left:0px">
				<ul class="nav nav-list">
				<li class="nav-header">커뮤니티</li>
				<li class="<%=active1%>"><a href="../front?cmd=REVIEW">리뷰 게시판</a></li>
				<li class="<%=active2%>"><a href="../front?cmd=QNA">문의 게시판</a></li>
			</ul>
			</div>
				
			<div class="span10">
				<div class="tabbable tabs-below">
				<div class="tab-content">
					<div class="tab-pane active"><jsp:include page="<%=board%>" flush="false" /></div>
					</div>
				</div>
			</div>
						
			</div>
		</div>
	</div>

