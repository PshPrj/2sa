<%@ page contentType="text/html; charset=utf-8" %>

<h4 id='statistics_title' align='left'>직원 통계 <small>등록된 직원의 통계 정보를 확인합니다.</small></h4>

<%@ include file="site_info.jsp" %>
 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>

	<div id="content">
		<form  action="../staffpage?cmd=STATISTICS_STAFF" method="post">
			<input type="hidden" value="params" name="params"/> 		
		  	 <span class="muted">직원 ID:  </span>&nbsp;&nbsp;<input type='text' placeholder='회원 ID를 입력하세요' name='id' class="input-medium"/>&nbsp;&nbsp;&nbsp;
		 	 <span class="muted">직원 이름:  </span>&nbsp;&nbsp;<input type='text' placeholder='회원 이름을 입력하세요.' name='name' class="input-medium">&nbsp;&nbsp;&nbsp;
		 	 <span class="muted">부서 :  </span>&nbsp;&nbsp;<input type='text' placeholder='부서를 입력하세요.' name='dept' class="input-medium"><br/>
		  	 <span class="muted">입사 날짜 :</span>&nbsp;&nbsp;<input type='date' placeholder='날짜 이상' name='date1' class="input-medium">&nbsp;&nbsp;~&nbsp;&nbsp;<input type='date' placeholder='날짜 이하' name='date2' class="input-medium">&nbsp;&nbsp;&nbsp;
			<div align="center"><input type="submit" class="btn" value="검색"/>	</div>			  	 
		</form>			
	</div>


<hr/>


<table class="table table-bordered">
			<thead>
				<tr>
					<td colspan="2">직원 ID</td>
					<td colspan="2">직원 이름</td>
					<td colspan="2">입사 일자</td>
					<td colspan="2">부서</td>
					<td colspan="2">상세보기</td>													
				</tr>				
			</thead>
			<tbody>
				<c:if test="${list != null}">
					<c:forEach items="${list}" var="st">				
						<tr>
							<td colspan="2">${st.id }</td>
							<td colspan="2">${st.name }</td>
							<td colspan="2">${st.date}</td>
							<td colspan="2">${st.dept_name}</td>				
							<td colspan="2">
								<c:if test="${st.dept_type!=1}">
									<a href="staffmodal?cmd=STAFFDETAIL&type=${st.dept_type }&num=${st.num}" class="btn" data-toggle="modal" data-target="#detail_modal">보기</a>
								</c:if>										
							</td>						
						</tr>
					</c:forEach>
				</c:if>													
			</tbody>
			<tfoot> 
				<tr>
					<td >기간 내 입사 직원수</td>
					<td>${sum[0] }명</td>
					<td>사이트 관리부</td>
					<td>${sum[1] }명</td>
					<td>트럭 관리부</td>
					<td>${sum[2] }명</td>
					<td>컨테이너 관리부</td>
					<td>${sum[3] }명</td>
					<td>이삿짐부</td>
					<td>${sum[4] }명</td>																
				</tr>			
			</tfoot>				
	</table>
	
	
	<div class="modal fade" id="detail_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	          <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">상세 정보 보기</h3>
			  </div>
	          <div class="modal-body"></div>
	          <div class="modal-footer">
				<button class="btn" id="close" aria-hidden="true">Close</button>			
			  </div>           
	        </div> <!-- /.modal-content -->
	    </div> <!-- /.modal-dialog -->
	</div> 
	
<script> 
$(document).ready(function(){
	$("#content").hide();
    $("#search_filed").click(function(){
        $("#content").slideToggle("slow");
    });
});

$("#close").click(function(){
	location.reload();	
});



</script>