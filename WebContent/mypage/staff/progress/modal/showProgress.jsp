<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	$("#status_change").click(function(){
		var num=$("#progress option:selected").val();
		var pay_num=$("#pay_num").val();
		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=UPDATE_MOVE_STATUS&pay_num="+pay_num+"&type="+num,
			success : function(data) {
				 location.reload();
			}
		});		
	});

</script>


	<div class="modal-body">
	<input type="hidden" value="${dto.pay_num}" id="pay_num"/>
	<table class="table table-striped table-bordered">
		<tr>
			<td>담당자</td>
			<td>전화 번호 </td>
		</tr>
		<tr>
			<td>${dto.staff_name }</td>
			<td>${dto.staff_tel } </td>
		</tr>
		<c:if test="${dto.status_num!=100}">
		<tr>
			<td>진행상황</td>
			<td>확인 </td>
		</tr>
		<tr>
			<td>
				
					<select id="progress" style="width: 100px;">
						<c:if test="${dto.status_num==0}">
							<option value="1">이사시작</option>
							<option value="2">트럭 출발</option>
							<option value="3">도착</option>
							<option value="4">완료</option>
						</c:if>
						<c:if test="${dto.status_num==25}">							
							<option value="2">트럭 출발</option>
							<option value="3">도착</option>
							<option value="4">완료</option>
						</c:if>
						<c:if test="${dto.status_num==50}">	
							<option value="3">도착</option>
							<option value="4">완료</option>
						</c:if>
						<c:if test="${dto.status_num==75}">	
							<option value="4">완료</option>
						</c:if>
					</select>
						
			</td>
			<td><a id="status_change" class="btn  btn-primary">확인</a> </td>
		</tr>
		</c:if>	
		<tr>
			<td>이사 시작 시간</td>
			<td>${dto.time1 }</td>
		</tr>
		<tr>
			<td>트럭 출발 시간</td>
			<td>${dto.time2 }</td>
		</tr>
		<tr>
			<td>트럭 도착시간</td>
			<td>${dto.time3 }</td>
		</tr>
		<tr>
			<td>이사 완료</td>
			<td>${dto.time4 }</td>
		</tr>
	</table>
				
	<hr/>
	<p class="text-info">이사 진행상황 바</p>
					<div class="progress progress-striped active" style="width: 100%;">
						
							<div class="bar" style="width: ${dto.status_num}%;"></div>
						
					</div>
	</div>
	
