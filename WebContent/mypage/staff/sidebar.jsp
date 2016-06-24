<%@ page contentType="text/html; charset=utf-8"%>

<%
	String active1=null, active2=null, active3=null, active4=null, active5=null, active6=null, active7=null,active8=null,active9=null,active10=null,active11=null;
	String active12=null,active13=null,active14=null,active15=null,active16=null,active17=null,active18=null;
	String boardpage = (String)request.getAttribute("boardpage");
	if(boardpage=="CALENDAR"){active1="active";}
	else if(boardpage=="PROGRESS"){active2="active";}
	else if(boardpage=="CONTAINER"){active3="active";}
	else if(boardpage=="TRUCK"){active4="active";}
	else if(boardpage=="MEMBER"){active5="active";}
	else if(boardpage=="PAYMENT"){active7="active";}
	else if(boardpage=="STATISTICS"){active6="active";}
	else if(boardpage=="CONTAINER_RESERVATION"){active8="active";}
	else if(boardpage=="PAYMENT_WAIT"){active16="active";}
	else if(boardpage=="PAYMENT_CONFIRM"){active17="active";}
	else if(boardpage=="PAYMENT_REFUND"){active18="active";}
	else if(boardpage=="STATISTICS_CLIENT"){active12="active";}
	else if(boardpage=="STATISTICS_STAFF"){active13="active";}
	else if(boardpage=="STATISTICS_CONTAINER"){active14="active";}
	else if(boardpage=="STATISTICS_TRUCK"){active15="active";}
	else if(boardpage=="STAFF_MANAGER"){active11="active";}
	else if(boardpage=="TRUCK_RESERVATION"){active9="active";}
%>
<div class="span2">
	<ul class="nav nav-list">
	<li class="nav-header">Manager PAGE</li>
		<li class="<%=active1%>"><a href="../staffpage?cmd=CALENDAR">예약 확인</a></li>
		<li class="<%=active2%>"><a href="../staffpage?cmd=PROGRESS">진행현황</a></li>
		<li class="dropdown-submenu <%=active3%>"><a href="../staffpage?cmd=CONTAINER" class="dropdown-toggle" data-toggle="tab" >컨테이너 관리</a>
          <ul class="dropdown-menu" role="menu">
            <li><a class="<%=active3 %>" href="../staffpage?cmd=CONTAINER">컨테이너 상태</a></li>
            <li><a class="<%=active8%>" href="../staffpage?cmd=CONTAINER_RESERVATION">예약현황</a></li>           
          </ul>
          </li>
		<li class=" dropdown-submenu <%=active4%>"><a href="../staffpage?cmd=TRUCK" class="dropdown-toggle" data-toggle="dropdown" >트럭관리</a>
		 <ul class="dropdown-menu">
            <li><a class="<%=active4%>" href="../staffpage?cmd=TRUCK">트럭 상태</a></li>
            <li><a class="<%=active9%>" href="../staffpage?cmd=TRUCK_RESERVATION">예약현황</a></li>           
          </ul></li>
		<li class="dropdown-submenu <%=active5%>"><a href="../staffpage?cmd=MEMBER" class="dropdown-toggle" data-toggle="dropdown">회원관리</a>
			<ul class="dropdown-menu">
				<li><a class="<%=active5%>" href="../staffpage?cmd=MEMBER">회원관리</a></li>
				<li><a class="<%=active11%>" href="../staffpage?cmd=STAFF_MANAGER">직원관리</a></li>
			</ul>
		</li>
		<li class="dropdown-submenu <%=active7%>"><a href="../staffpage?cmd=PAYMENT" class="dropdown-toggle" data-toggle="dropdown">결제 관리</a>
			<ul class="dropdown-menu">
				<li><a class="<%=active7%>" href="../staffpage?cmd=PAYMENT">결제 승인</a></li>
				<li><a class="<%=active16%>" href="../staffpage?cmd=PAYMENT_WAIT">결제 대기</a></li>
				<li><a class="<%=active17%>" href="../staffpage?cmd=PAYMENT_CONFIRM">결제 완료</a></li>
				<li><a class="<%=active18%>" href="../staffpage?cmd=PAYMENT_REFUND">환불 요청</a></li>
			</ul>
		</li>
		<li class="dropdown-submenu <%=active6%>"><a href="../staffpage?cmd=STATISTICS" class="dropdown-toggle" data-toggle="dropdown">통계</a>
			<ul class="dropdown-menu">
				<li><a class="<%=active6%>" href="../staffpage?cmd=STATISTICS">총 통계</a></li>
				<li><a class="<%=active12%>" href="../staffpage?cmd=STATISTICS_CLIENT">회원 통계</a></li>
				<li><a class="<%=active13%>" href="../staffpage?cmd=STATISTICS_STAFF">직원 통계</a></li>
				<li><a class="<%=active14%>" href="../staffpage?cmd=STATISTICS_CONTAINER">컨테이너 통계</a></li>
				<li><a class="<%=active15%>" href="../staffpage?cmd=STATISTICS_TRUCK">트럭 통계</a></li>
			</ul>
		</li>
	</ul>
</div>


