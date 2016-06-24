<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
var next_url;
	$("#update_reservation").click(function(){
		var staff_num=$("#staff option:selected").val();
		var truck_num=$("#truck option:selected").val();
		var pay_num=$("#pay_num").val();
		var res_num=$("#res_num").val();
		if ($('#container').length) {
			var container_num=$("#container option:selected").val();
			next_url="staffmodal?cmd=ASSIGN_RESERVATION&staff_num="+staff_num+"&truck_num="+truck_num+"&container_num="+container_num+"&type=1&pay_num="+pay_num+"&res_num="+res_num;
		}else{
			next_url="staffmodal?cmd=ASSIGN_RESERVATION&staff_num="+staff_num+"&truck_num="+truck_num+"&type=2&pay_num="+pay_num+"&res_num="+res_num;
		}
		$.ajax({
			type : "GET",
			url : next_url,
			success : function(data) {
				location.reload();
			}
		});
	});
	
	$("#close").click(function (){
		location.reload();
	});
	
</script>	
<div class="modal-body">
<input type="hidden" value="${pay_num }" id="pay_num"/>
<input type="hidden" value="${res_num }" id="res_num"/>
<p align="left">배정</p>
	<table class="table table-bordered">
	<tr>
		<td>담당자 선택</td>
		<td>
			<select id="staff" style="width: 120px">
				<c:forEach items="${staff}" var="staff">
					<option value="${staff.num }">${staff.name }</option>
				</c:forEach>
			</select>
		</td>
		<td rowspan="3"><button class="btn" id="update_reservation">확인</button></td>	
	</tr>
	<tr>
		<td>트럭 선택</td>
		<td>
			<select id="truck" style="width: 120px">
				<c:forEach items="${truck}" var="truck">
					<option value="${truck.truck_num }">${truck.car_name }</option>
				</c:forEach>
			</select>
		</td>	
	</tr>
	<c:if test="${container!=null }">
		<tr>	
			<td>컨테이너 선택</td>
			<td>
				<select id="container" style="width: 120px">
					<c:forEach items="${container}" var="con">
						<option value="${con.container_num}">${con.container_name }</option>
						${con.container_num}
					</c:forEach>
				</select>
			</td>	
		</tr>
	</c:if>	
	</table>

<div id="update_result"></div>

<hr/>

	<p align="left">도면 확인</p>
	<table class="table table-bordered">
		<tr>
			<td>도면</td>
		</tr>
	<c:set value="0" var="cnt"/>	
		<c:forEach items="${floorplanList}" var="plan" varStatus="status">
			<tr>
				<td>
				<p>도면 번호    ${plan.template_num}</p>
					<img src="../upload/drawing/${plan.img_name}.jpg">
					<c:set value="${cnt+1 }" var="cnt"/>
				</td>
			</tr>
		</c:forEach>
		<c:if test="${cnt==0}">
			<tr>
				<td>데이터가 없습니다.</td>
			</tr>
		</c:if>	
	</table>
</div>
<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true" id="close">Close</button>			
</div>