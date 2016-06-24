<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<h4 align="left" style="margin-left: 10px;">트럭 관리</h4>
	<div class="row " align="right">
		<a class="btn" id="register_container" href="staffmodal?cmd=REGISTER_TRUCK" data-toggle="modal" data-target="#register_truck_modal">트럭 등록</a>&nbsp;&nbsp;&nbsp; 
		<span class="text-info">트럭 정보를 등록합니다.</span>		      
		<hr/>
	</div>
</div>

<table class="table table-striped table-bordered">
<c:set var="cnt" value="0" /> 
	<tbody>
		<c:if test="${list!=null}">
			<c:forEach items="${list}" var="st">
				<c:if test="${cnt%3==0||list_size==cnt}">
				<tr>
				</c:if>
					<td>
						<p class="text-right">${st.car_name }</p>
						<c:if test="${st.staff_num==0}">
							<p style="text-align: right;color:red;">담당자 배정 필요</p>
						</c:if>
						<a id="showTruckinfo" class="btn primary_btn" href="staffmodal?cmd=TRUCKSTATUS&truck_num=${st.truck_num}&staff_num=${st.staff_num}"  data-toggle="modal" data-target="#truck_status_modal">
						<img src="../img/7.png" style="margin-left: auto; margin-top: auto;" /></a>
						<a href="staffpage?cmd=DELETE_TRUCK&truck_num=${st.truck_num }">삭제</a>						
					</td>
				<c:if test="${cnt%6==2||list_size==cnt}">			
				</tr>
				</c:if>				
				<c:set var="cnt" value="${cnt+1}"/>
			</c:forEach>	
		</c:if>
	</tbody>
</table>

<div align="center">

	<div class="pagination pagination-centered">
		<c:set var="loop" value="false" />

		<ul>

			<c:if test="${totalBlock >= nowBlock+1}">
				<c:if test="${nowBlock!=0}">			
					<li><a href="../staffpage?cmd=TRUCK&nowPage=${nowPage-1}&nowBlock=${nowBlock-1}">Prev</a></li>
				</c:if>
				<c:forEach begin="1" end="5" var="i">
					<c:if test="${not loop}">
						<c:if test="${nowBlock*pagePerBlock+i-1 != totalPage}">
							<c:if test="${params!=null}">
								<li><a href="../staffpage?cmd=TRUCK&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
							<c:if test="${params==null}">
								<li><a href="../staffpage?cmd=TRUCK&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
						</c:if>
						<c:if test="${nowBlock*pagePerBlock+i-1 == totalPage}">
							<c:set var="loop" value="true" />
						</c:if>

					</c:if>
				</c:forEach>
				<c:if test="${totalBlock > nowBlock+1}">
				<li><a href="../staffpage?cmd=TRUCK&nowPage=${(nowBlock+1)*pagePerBlock+1}&nowBlock=${nowBlock+1}">Next</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
</div>


<!-- Modal -->
<div class="modal fade" id="truck_status_modal" role="dialog"
	 aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			<h3 id="myModalLabel">정보 수정</h3>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn"   id="close" aria-hidden="true">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<div class="modal fade" id="register_truck_modal" role="dialog"
	aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">트럭 등록</h3>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn" id="close_register" aria-hidden="true">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<script>
	
	$("#close").click(function (){
		location.reload();
	});
	$("#close_register").click(function (){
		location.reload();
	});
	
</script>