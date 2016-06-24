<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="s_title"><h4 id="statistics_title" align="left">컨테이너 통계 <small>등록된 컨테이너의 통계 정보를 확인합니다.</small></h4></div>

<%@ include file="site_info.jsp" %>
 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>

	<div id="content">
		<form  action="../staffpage?cmd=STATISTICS_CONTAINER" method="post">
			<input type="hidden" value="params" name="params"/>
			<table class="table table-bordered"> 
				<tr>
					<td>
					<span class="muted">컨테이너 번호</span>
					<input type='text' placeholder='컨테이너 번호를 입력하세요' name='num' class="input-medium"/>				
					<span class="muted">컨테이너 이름</span>
					<input type='text' placeholder='컨테이너 이름을 입력하세요' name='name' class="input-medium">
					<span class="muted">이용횟수</span>
					<input type='text' placeholder='이용횟수을 입력하세요' name='cnt' class="input-medium">
					<br/>
					<span class="muted">등록 날짜</span>

						<input type='date' placeholder='날짜 이상' name='date1' class="input-medium">&nbsp;&nbsp;~&nbsp;&nbsp;
						<input type='date' placeholder='날짜 이하' name='date2' class="input-medium">&nbsp; &nbsp;&nbsp; &nbsp;
					<span class="muted">용량</span>
						<input type="radio" value="0" name="capacity" checked="checked" />선택&nbsp; &nbsp; &nbsp;	
						<input type="radio" value="20" name="capacity" />20톤 &nbsp; &nbsp; &nbsp;			 	
						<input type="radio" value="30" name="capacity" />30톤&nbsp; &nbsp; &nbsp;		
						<input type="radio" value="40" name="capacity" />40톤 &nbsp; &nbsp; &nbsp;
						<input type="radio" value="50" name="capacity" />50톤 &nbsp; &nbsp; &nbsp;	
						
						<div align="center"><input type="submit" class="btn" value="검색"/></div>		
					</td>
				</tr>
			</table>		
					  	 
		</form>			
	</div>
<hr/>

<table class="table table-bordered">
			<thead>
				<tr>
					<td >컨테이너 번호</td>
					<td >컨테이너 이름</td>
					<td >용량</td>
					<td >등록일자</td>
					<td >이용 횟수</td>									
				</tr>				
			</thead>
			<tbody>				
				<c:if test="${list_size!=0 }">
					<c:forEach items="${list }" var="list">
						<tr>
							<td>${list.con_num }</td>
							<td>${list.con_name }</td>
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
					<td colspan="4">총 보관횟수 </td>
					<td>${sum }</td>															
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