<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 align="left">직원 관리 <small>직원 정보를 확인합니다.</small> </h4>
	<div class="row " align="right">
		<a class="btn" id="register_member" href="staffmodal?cmd=REGISTER_STAFF" data-toggle="modal" data-target="#register_member_modal">직원 등록</a>&nbsp;&nbsp;&nbsp; 
		<span class="text-info">직원을 등록합니다.</span>		      
	</div>
 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>

<div id="content">
	<form action="../staffpage?cmd=STAFF_MANAGER" method="post">
	<input type="hidden" value="params" name="params" /> 
		<table class="table table-bordered">
			<tr>
				<td>
					<span class="muted">직원 id: </span>&nbsp;&nbsp;<input type='text' placeholder='직원 id를 입력하세요' name='id' class="input-small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="muted">직원 이름 :</span>&nbsp;&nbsp;<input type='text' placeholder='직원 이름를 입력하세요' name='name' class="input-small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="muted">부서 :</span>&nbsp;&nbsp;<input type='text' placeholder='부서를 입력하세요' name='dept' class="input-small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<span class="muted">전화번호 :</span>&nbsp;&nbsp;<input type='text' placeholder='전화 번호를 입력하세요' name='tel' class="input-small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<br />
					<span class="muted">입사 날짜 :</span>&nbsp;&nbsp;<input type='date' placeholder='날짜 이상' name='date1' class="input-medium">&nbsp;&nbsp;~&nbsp;&nbsp;
					<input type='date' placeholder='날짜 이하' name='date2' class="input-medium">&nbsp;&nbsp;&nbsp;
					<div align="center"><input type="submit" class="btn" value="검색" /></div>
				</td>
			</tr>
		</table>
		
		
	</form>
</div>


<hr />

<table class="table table-bordered">
	<thead>
		<tr>
			<td>직원 번호</td>
			<td>직원 ID</td>
			<td>직원 이름</td>
			<td>입사 날짜</td>
			<td>직원 전화 번호</td>
			<td>부서</td>
			<td>상세 정보 보기</td>
			<td>정보 수정</td>
			<td>삭제</td>
		</tr>
	</thead>
	<tbody>
		<c:if test="${list != null}">
				<c:forEach items="${list}" var="st">
					<tr>
						<td>${st.num }</td>
						<td>${st.id }</td>
						<td>${st.name }</td>
						<td>${st.date }</td>
						<td>${st.tel }</td>
						<td>${st.dept }</td>
						<td>
				
							<c:if test="${st.dept_type!=1}">
								<a href="staffmodal?cmd=STAFFDETAIL&num=${st.num }&type=${st.dept_type}"
							class="btn" data-toggle="modal"
							data-target="#detail_staff_info_modal">보기</a>
							</c:if>
						</td>
						<td><a href="staffmodal?cmd=UPDATESTAFF_INFO&staff_num=${st.num }&type=1"
							class="btn" data-toggle="modal"
							data-target="#update_staff_info_modal">수정</a></td>	
						<td><a id="delete_staff" href="staffpage?cmd=DELETE_STAFF&staff_num=${st.num }">삭제</a></td>	
					</tr>
				</c:forEach>
		</c:if>
		<c:if test="${list == null}">
			<tr>
				<td colspan="5"><p class="info_text">데이터가 없습니다.</p></td>
			</tr>	
		</c:if>		
	</tbody>
	<tfoot></tfoot>
</table>


<div align="center">
	<div class="pagination pagination-centered">
		<c:set var="loop" value="false" />
		<ul>
			<c:if test="${totalBlock >= nowBlock+1}">
				<c:if test="${nowBlock!=0 }">
				<li><a href="../staffpage?cmd=STAFF_MANAGER&nowPage=${nowPage-1}&nowBlock=${nowBlock-1}">Prev</a></li>
				</c:if>
				<c:forEach begin="1" end="5" var="i">
					<c:if test="${not loop}">
						<c:if test="${nowBlock*pagePerBlock+i-1 != totalPage}">
							<c:if test="${params!=null}">
								<li><a href="../staffpage?cmd=STAFF_MANAGER&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}
								&params=params&id=${text.id}&name=${text.name}&date1=${text.date1}&date2=${text.date2}&tel=${text.tel}
								&dept=${text.dept}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
							<c:if test="${params==null}">
								<li><a href="../staffpage?cmd=STAFF_MANAGER&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
						</c:if>
						<c:if test="${nowBlock*pagePerBlock+i-1 == totalPage}">
							<c:set var="loop" value="true" />
						</c:if>

					</c:if>
				</c:forEach>
				<c:if test="${totalBlock > nowBlock+1}">
				<li><a href="../staffpage?cmd=STAFF_MANAGER&nowPage=${(nowBlock+1)*pagePerBlock+1}&nowBlock=${nowBlock+1}">Next</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
</div>



<div class="modal fade" id="detail_staff_info_modal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">담당 정보</h3>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn" id="close" aria-hidden="true">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>

<div class="modal fade" id="update_staff_info_modal" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">직원 정보 수정</h3>
			</div>
			<div class="modal-body"></div>
			
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>
<div class="modal fade" id="register_member_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
			<button type="button" class="close" 
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">직원 등록</h3>
		  </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
			<button class="btn" id="close_register" aria-hidden="true">Close</button>		
		  </div>           
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> 


<script>
	$(document).ready(function() {
		$("#content").hide();
		$("#search_filed").click(function() {
			$("#content").slideToggle("slow");
		});
	});
	$("#close").click(function (){
		location.reload();
	});
	$("#close_register").click(function (){
		location.reload();
	});
</script>