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
		<li class="<%=active1%>"><a href="../mypage?cmd=floorplan">���� Ȯ��</a></li>
		<li class="<%=active2%>"><a href="../mypage?cmd=reservation">���� ����</a></li>
		<li class="<%=active3%>"><a href="../mypage?cmd=pay">����/ȯ��</a></li>
		<li class="<%=active4%>"><a href="../mypage?cmd=progress">�̻� ��Ȳ</a></li>
		<li class="<%=active5%>"><a href="../mypage?cmd=stuffList">��ǰ Ȯ��</a></li>
		<li class="<%=active6%>"><a href="../mypage?cmd=assignment">���� Ȯ��</a></li>
		<li class="<%=active7%>"><a href="../mypage?cmd=mymain">���� ����</a></li>
	</ul>
</div>
