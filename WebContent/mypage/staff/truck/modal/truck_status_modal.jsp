<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>

	
	$("#update_staff").click(function(){
		var num=$("#new_staff option:selected").val();
		var truck_num=$("#truck_num").val();
		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=UPDATE_TRUCK_STAFF&staff_num="+num+"&truck_num="+truck_num,
			success : function(data) {
				var staff_arr=data.split("+");
				
				$("#staff_name").text(staff_arr[0]);
				$("#staff_id").text(staff_arr[1]);
				$("#staff_tel").text(staff_arr[2]);
				$("#staff_dept").text(staff_arr[3]);
				$("#update_result p").remove();
				$("#update_result").append("<p class='text-info'>배정 완료</p>");
			}
		});
	});
	
	$("#update_truck").click(function(){
		var truck_name=$("#car_name").val();
		var truck_type=$("#car_type").val();
		var capacity=$("#capacity").val();
		var truck_num=$("#truck_num").val();
		
		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=UPDATE_TRUCK_INFO&car_name="+truck_name+"&truck_num="+truck_num+"&car_type="+truck_type+"&capacity="+capacity,
			success : function(data) {
				var truck_arr=data.split("+");
				$("#car_name").text(truck_arr[0]);
				$("#car_type").text(truck_arr[1]);
				$("#capacity").text(truck_arr[2]);
				$("#update_result p").remove();
				$("#update_result").append("<p class='text-info'>수정 완료</p>");
			}
		});
	
	});
</script>

	<div class="modal-body" align="left" >
		<input type="hidden" value="${truck_num}" id="truck_num"/>
		<span> 담당자  정보 </span><br /> 
			<table class="table table-striped table-bordered" style="margin: auto" id="staff_table">
				<tr>
					<td>담당자 이름</td>
					<td>담당자 ID</td>
					<td>담당자 전화번호</td>
					<td>부서</td>
					<td>직원 목록</td>
					<td>재배정</td>
				</tr>
		<c:if test="${staff!=null }">
				<tr>
				
					<td id="staff_name">${staff.name }</td>
					<td id="staff_id">${staff.id }</td>
					<td id="staff_id">${staff.tel }</td>
					<td id="staff_dept">${staff.dept }</td>
					<td>
						<select name="new_staff" style="width:80px" id="new_staff">
							<c:forEach items="${staff_list}" var="staff_list">
								<option value=${staff_list.num }>${staff_list.name }</option>
							</c:forEach>
						</select>				
					
					</td>
					<td><a id="update_staff" class="btn  btn-primary">ok</a></td>				
				</tr>
		
		</c:if>		
		<c:if test="${staff==null }">
			<tr>
				<td colspan="3">배정 필요</td>
					<td>
						<select name="new_staff" style="width:80px" id="new_staff">
							<c:forEach items="${staff_list}" var="staff_list">
								<option value=${staff_list.num }>${staff_list.name }</option>
							</c:forEach>
						</select>				
					
					</td>
					<td><a id="update_staff" class="btn  btn-primary">ok</a></td>	
			</tr>
		</c:if>
			</table><br/>
	
		<span> 차 정보 </span><br /> 
			<table class="table table-striped table-bordered">
				<tr>
					<td>차 번호</td>
					<td>브랜드명</td>
					<td>용량</td>	
					<td>수정</td>			
				</tr><tr>
				<c:forEach items="${truck}" var="truck">
					<td><input type="text" id="car_name" value="${truck.car_name}" class="input-small"/></td>
					<td><input type="text" id="car_type" value="${truck.car_type}" class="input-small"/></td>
					<td><input type="text" id="capacity" value="${truck.capacity}" class="input-small"/></td>
					<td><a id="update_truck"  class="btn  btn-primary">ok</a></td>
				</c:forEach>
				</tr>
			</table>
			
		<div id="update_result"></div><br/>
		
	</div>
	
