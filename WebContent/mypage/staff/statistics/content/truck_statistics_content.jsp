<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="s_title"><h4 id="statistics_title" align="left">트럭 통계 <small>등록된 트럭의 통계 정보를 확인합니다.</small></h4></div>

<%@ include file="site_info.jsp" %>

 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>

	<div id="content">
		<form  action="../staffpage?cmd=STATISTICS_TRUCK" method="post">
			<input type="hidden" value="params" name="params"/>
			<table class="table table-bordered"> 
				<tr>
					<td>
					<span class="muted">번호판</span>
					<input type='text' placeholder='번호판을 입력하세요' name='car_num' class="input-medium"/>	&nbsp;&nbsp;&nbsp;&nbsp;			
					<span class="muted">차종</span>
					<input type='text' placeholder='차종을 입력하세요' name='car_type' class="input-medium">&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="muted">이용횟수</span>
					<input type='text' placeholder='이용횟수을 입력하세요' name='cnt' class="input-medium">&nbsp;&nbsp;&nbsp;&nbsp;
					<br/>
					<span class="muted">등록 날짜</span>
					
						<input type='date' placeholder='날짜 이상' name='date1' class="input-medium">&nbsp;&nbsp;~&nbsp;&nbsp;
						<input type='date' placeholder='날짜 이하' name='date2' class="input-medium">&nbsp;&nbsp;&nbsp;&nbsp;
				
					<span class="muted">용량</span>
				
						<input type="radio" value="0" name="truck_capacity" checked="checked" />선택&nbsp; &nbsp; &nbsp;	
						<input type="radio" value="1" name="truck_capacity"/>1톤 &nbsp; &nbsp; &nbsp;			 	
						<input type="radio" value="2.5" name="truck_capacity" />2.5톤		 &nbsp; &nbsp; &nbsp;		
						<input type="radio" value="3.5" name="truck_capacity" />3.5톤 &nbsp; &nbsp; &nbsp;
						<input type="radio" value="4.5" name="truck_capacity" />4.5톤		 &nbsp; &nbsp; &nbsp;
						<br/>		
					<div align="center">	<input type="submit" class="btn" value="검색"/>	</div>
				</tr>
			</table>		
			  	 
		</form>			
	</div>


<hr/>

<table class="table table-bordered">
			<thead>
				<tr>
					<td>트럭 번호</td>
					<td>차종</td>
					<td>용량</td>
					<td>등록일</td>
					<td>이용횟수</td>
				</tr>				
			</thead>
			<tbody>
				<c:if test="${list_size!=0 }">
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.car_num }</td>
							<td>${list.car_type }</td>
							<td>${list.capacity } </td>
							<td>${list.date }</td>
							<td>${list.cnt } </td>							
						</tr>
					</c:forEach>						
				</c:if>
				<c:if test="${list_size==0 }">
					<tr>
						<td colspan="5">데이터가 없습니다.</td>
					</tr>	
				</c:if>													
			</tbody>
			<tfoot> 
				<tr>
					<td colspan="4">총 사용횟수 </td>
					<td>${sum }건</td>													
				</tr>			
			</tfoot>				
	</table>
	
	
	
<script> 
$(document).ready(function(){
	$("#content").hide();
    $("#search_filed").click(function(){
        $("#content").slideToggle("slow");
    });
});
</script>	