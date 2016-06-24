<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	

<script>
	
	$("#update_container").click(function(){
		var staff_num=$("#select_staff option:selected").val();
		var name=$("#name").val();
		var capacity=$(":radio[name='capacity']:checked").val();
		var con_num=$("#con_num").val();
		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=CONTAINERSTATUS&staff_num="+staff_num+"&name="+name+"&capacity="+capacity+"&type=Y&con_num="+con_num,
			success : function(data) {	
				
				$("#result p").remove();
				$("#result").append("<p class='text-info'>수정 완료</p>");
			}
		});
	});


</script>



	<div class="modal-body">
	<input type="hidden" value="${num }" id="con_num"/>
			<table class="table table-striped table-bordered" style="margin: auto" id="staff_table">
				<tr>
					<td>담당자 이름</td>
					<td>담당자 ID</td>
					<td>담당자 전화번호</td>
					<td>부서</td>
					<td>직원 목록</td>					
				</tr>
			<c:if test="${staff!=null }">
				<tr>				
					<td id="staff_name">${staff.name }</td>
					<td id="staff_id">${staff.id }</td>
					<td id="staff_id">${staff.tel }</td>
					<td id="staff_dept">${staff.dept }</td>
					<td>
						<select id="select_staff" style="width: 120px">
						<c:forEach items="${list}" var="list">
							<option value="${list.num }">${list.name }</option>
						</c:forEach>
						</select>
					</td>
				</tr>
			</c:if>	
		</table>			
		<table class="table table-striped table-bordered">
		<tr>
			<td>컨테이너 이름</td>
			<td><input type="text" id="name" value="${name }"/></td>
		</tr>
		<tr>
			<td colspan="2">용량</td>
		</tr>
		<tr>	
			<td colspan="2">
			<input type="radio" value="20" name="capacity" checked="checked" />20톤 &nbsp; &nbsp; &nbsp;			 	
			<input type="radio" value="30" name="capacity" />30톤 &nbsp; &nbsp; &nbsp;		
			<input type="radio" value="40" name="capacity" />40톤 &nbsp; &nbsp; &nbsp;
			<input type="radio" value="50" name="capacity" />50톤 &nbsp; &nbsp; &nbsp;
			</td>
		</tr>		
		<tr>
			<td colspan="2">
				<button class="btn" id="update_container">확인</button>
			</td>
		</tr>

	</table>

	<div id="result"></div>

	</div>
	