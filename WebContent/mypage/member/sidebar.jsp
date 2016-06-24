<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	String active1=null, active2=null, active3=null, active4=null, active5=null, active6=null, active7=null;
	String boardpage = (String)request.getAttribute("boardpage");
	if(boardpage=="FLOORPLAN"){active1="active";}
	else if(boardpage=="RESERVATION"){active2="active";}
	else if(boardpage=="PAY"){active3="active";}
	else if(boardpage=="PROGRESS"){active4="active";}
	else if(boardpage=="STUFF"){active5="active";}
	else if(boardpage=="ASSIGNMENT"){active6="active";}
	else if(boardpage=="MODIFY_CHK"){active7="active";}
%>
<%-- <%session.setAttribute("member_num", 2); %> --%>
<div class="col-md-2">
	<ul class="nav nav-list">
	<li class="nav-header">My Page</li>
		<li class="<%=active1%>"><a href="../mypage?cmd=floorplan">도면 확인</a></li>
		<li class="<%=active2%>"><a href="../mypage?cmd=reservation">예약 관리</a></li>
		<li class="<%=active3%>"><a href="../mypage?cmd=pay">결제/환불</a></li>
		<li class="<%=active4%>"><a href="../mypage?cmd=progress">이사 현황</a></li>
		<li class="<%=active5%>"><a href="../mypage?cmd=stuffList">물품 확인</a></li>
		<li class="<%=active6%>"><a href="../mypage?cmd=assignment">배정 확인</a></li>
		<li class="<%=active7%>"><a href="../mypage?cmd=mymain">정보 수정</a></li>
	</ul>
</div>
