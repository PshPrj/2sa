<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-body">

	<table class="table table-bordered">
		<thead>
			<tr>
				<td>직원 번호</td>
				<td>직원 ID</td>
				<td>입사 날짜</td>
				<td>직원 전화 번호</td>
				<td>부서</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1555</td>
				<td>chjkeieie</td>
				<td>2016-05-30</td>
				<td>0</td>
				<td>기획부</td>
			</tr>
		</tbody>
		<tfoot></tfoot>
	</table>

</div>

<hr/>

<p id="title">담당 내역</p>
<div id="content">
	<table class="table table-bordered">
		<thead>
			<tr>
				<td>컨테이너 이름</td>
				<td>등록 일자</td>
				<td>현재 사용 중</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1555</td>
				<td>2016-05-30</td>
				<td>Y</td>
			</tr>
		</tbody>
		<tfoot></tfoot>
	</table>
</div>

<script>
	$(document).ready(function() {
		$("#content").hide();
		$("#title").click(function() {
			$("#content").slideToggle("slow");
		});
	});
</script>