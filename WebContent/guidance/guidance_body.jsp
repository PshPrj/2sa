<!-- 
 	담당 : 정효진
	최종 수정 일자 : 6/21
	이용안내 페이지
 -->

<%@ page contentType="text/html; charset=UTF-8"%>
<div class="container">
<%
	String boardpage = (String)request.getAttribute("boardpage");
	String board = (String)request.getAttribute("board");
	/*
	String active1=null;
	   if(boardpage=="GUIDANCE"){
			active1="active";
		}*/
%>
	<div class="span12">
		<div class="row">
			<div class="span2" style="margin-left:0px">
				<ul class="nav nav-list">
				<li class="nav-header">이용 안내</li>
				<li class="active"><a href="../front?cmd=GUIDANCE">이용 안내</a></li>
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
