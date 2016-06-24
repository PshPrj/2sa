<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>
<h4>���� Ȯ��</h4>
<ul class="nav nav-tabs" id="assignmentTab">
	<li class="active"><a href="#truck">Ʈ��</a></li>
	<li><a href="#container">�����̳�</a></li>
</ul>
<div class="tab-content">
	<div class="tab-pane active" id="truck">
		<p>Ʈ��</p>
		<c:if test="${truckList != null}">
			<c:forEach var="truck" items="${truckList}">
				<div class="info span3">
					<span>${truck.car_num}</span><br>
					<img src="../img/9.png"><br>
					<span>����� : ${truck.regi_date_truck}</span><br>
					<span>����� : ${truck.staff_name_tr}</span>
				</div>
			</c:forEach>
		</c:if>
	</div>
	<div class="tab-pane" id="container">
		<p>�����̳�</p>
		<c:if test="${containerList != null}">
			<c:forEach var="container" items="${containerList}">		
				<div class="info span3">
					<span>${container.container_num}</span><br>
					<img src="../img/8.png"><br>
					<span>����� : ${container.staff_name_con}</span><br>
					<span>��� ����: ${container.regi_date_container}</span>
				</div>
			</c:forEach>
		</c:if>
	</div>
</div>
<script>
	$(function() {
		$('#assignmentTab a:first').tab('show');
	})
	$('#assignmentTab a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	})
</script>
<style>
.info {
	width: 25%;
	height: 25%;
	margin-left: 0px;
}

.info:hover {
	background: silver;
}
</style>