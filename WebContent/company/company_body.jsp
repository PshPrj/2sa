<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/07
	회사 소개 파트 첫 페이지
 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<div class="container">
<%
	String boardpage = (String)request.getAttribute("boardpage");
	String board = (String)request.getAttribute("board");
	String active1=null;
	String active2=null;
	String active3 = null;
	   if(boardpage=="INTRODUCE"){
			active1="active";
		}else if(boardpage=="HISTORY"){
			active2="active";
		}else if(boardpage=="NOTICE"){
			active3="active";
		}
%>
	<div class="span12"><!-- 사이드바 -->
		<div class="row">
			<div class="span2" style="margin-left:0px">
				<ul class="nav nav-list">
				<li class="nav-header">회사 소개</li>
					<li class="<%=active1%>"><a href="../front?cmd=INTRODUCE">회사 소개</a></li>
					<li class="<%=active2%>"><a href="../front?cmd=HISTORY">연혁</a></li>
					<li class="<%=active3%>"><a href="../front?cmd=NOTICE">공지</a></li>
				</ul>
			</div>
				
			<div class="span10"><!-- 메인 바디 부분 -->
				<div class="tabbable tabs-below">
				<div class="tab-content">

					<div class="tab-pane active"><jsp:include page="<%=board%>" flush="false" /></div>
					
				</div>
				</div>
			</div>
						
			</div>
		</div>
	</div>

