<%@ page contentType="text/html; charset=utf-8"%>


<div class="btn-group">
  <button class="btn" id="statistics_all">총 통계</button>
  <button class="btn" id="statistics_member">회원 통계</button>
  <button class="btn" id="statistics_staff">직원 통계</button>
  <button class="btn" id="statistics_container">컨테이너 통계</button>
  <button class="btn" id="statistics_truck">트럭 통계</button>  
</div><br/>
<br/>

	<div id="stastistics_content">
	
		<jsp:include page="../statistics/content/all_statistics_content.jsp"/>
	
	</div>


<script type="text/javascript">
$("#statistics_container").click(function(e){
	$("#stastistics_content").load("./staff/statistics/content/container_statistics_content3.jsp");
});
$("#statistics_truck").click(function(e){
	$("#stastistics_content").load("./staff/statistics/content/truck_statistics_content2.jsp");
});
$("#statistics_all").click(function(e){
	$("#stastistics_content").load("./staff/statistics/content/all_statistics_content.jsp");
});
$("#statistics_member").click(function(e){
	$("#stastistics_content").load("./staff/statistics/content/member_statistics_content.jsp");
});
$("#statistics_staff").click(function(e){
	$("#stastistics_content").load("./staff/statistics/content/staff_statistics_content.jsp");
});
</script>