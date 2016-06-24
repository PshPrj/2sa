<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
	
	$("#resister_ok").click(function(){
		var staff_num=$("#select_staff option:selected").val();
		var name=$("#name").val();
		var type=$("#type").val();
		var capacity=$(":radio[name='truck_capacity']:checked").val();
		
		
		alert(capacity);
		$.ajax({
			type : "GET",
			url : "staffmodal?cmd=REGISTER_TRUCK_DB&staff_num="+staff_num+"&name="+name+"&type="+type+"&capacity="+capacity,
			success : function(data) {	
				$("#name").val("");
				$("#type").val("");				
			}
		});
	});


</script>

<div class="modal-body" align="left">	
		
		<table class="table table-striped table-bordered">
			<tr>
				<td>차 번호</td>
				<td><input type="text" id="name" placeholder="차 번호를 입력하세요." /></td>			
			</tr>
			<tr>
				<td>차종</td>
				<td><input type="text" id="type" placeholder="차종를 입력하세요." /></td>	
			</tr>
			<tr>
				<td colspan="2">용량</td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="radio" value="1" name="truck_capacity" checked="checked" />1톤 &nbsp; &nbsp; &nbsp;			 	
				<input type="radio" value="2.5" name="truck_capacity" />2.5톤		 &nbsp; &nbsp; &nbsp;		
				<input type="radio" value="3.5" name="truck_capacity" />3.5톤 &nbsp; &nbsp; &nbsp;
				<input type="radio" value="4.5" name="truck_capacity" />4.5톤		 &nbsp; &nbsp; &nbsp;				
				</td>
			</tr>
			<tr>
				<td>직원 선택</td>
				<td>
					<select id="select_staff">
					<c:forEach items="${list}" var="list">
						<option value="${list.num }">${list.name }</option>
					</c:forEach>
					</select>			
				</td>			
			</tr>
			<tr>
				<td>트럭 등록</td>
				<td><a class="btn btn-primary" id="resister_ok">확인</a></td>
			</tr>			
		</table>			
	</div>
