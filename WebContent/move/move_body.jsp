<!-- 
 	담당 : 정효진
	최종 수정 일자 : 06/06
	이사 파트 front
 -->

<%@ page contentType="text/html; charset=UTF-8"%>
<%
						String boardpage = (String)request.getAttribute("boardpage");
						String board = (String)request.getAttribute("board");
						String active1=null;
						String active2=null;
						String active3 = null;
						System.out.println(board+"move-body");
						   if(boardpage=="DRAWING"){
								active1="active";
							}else if(boardpage=="ESTIMATE"){
								active2="active";
							}else if(boardpage=="RESERVATION"){
								active3="active";
							}
				%>

<div class="container" style="margin-left:0px">
		<div class="row-fluid">
			<div class="span2" style="margin-left:0px">
				<ul class="nav nav-list">
				<li class="nav-header">이사 하기</li>
				<li class="<%=active1%>"><a href="../front?cmd=DRAWING">도면 그리기</a></li>
				<li class="<%=active2%>"><a href="../front?cmd=ESTIMATE">견적 게시판</a></li>
				<li class="<%=active3%>"><a href="../front?cmd=RESERVATION">예약 게시판</a></li>
			</ul>
			</div>
				
			<div class="span10" style="margin-height:0px">
				<div class="tabbable tabs-below">
				<div class="tab-content">
					<div class="tab-pane active"><jsp:include page="<%=board%>" flush="false" /></div>
					
					</div>
				</div>
			</div>
						
			</div>
		</div>



