<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

 
<div id="s_title"><h4 id="statistics_title" align="left">총 통계 <small>현재 사이트 통계 정보를 확인합니다.</small></h4></div>

<%@ include file="site_info.jsp" %>

 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>

	<div id="content">
		<form  action="../staffpage?cmd=STATISTICS" method="post">
			<input type="hidden" value="params" name="params"/> 			
			<table class="table table-bordered">
				<tr>
					<td>
						 <span class="muted">회원 ID:  </span>&nbsp;&nbsp;<input type='text' placeholder='회원 ID를 입력하세요' name='id' class="input-small"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					 	 <span class="muted">컨테이너 이름:  </span>&nbsp;&nbsp;<input type='text' placeholder='사용 컨테이너 이름을 입력하세요' name='con' class="input-small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  	 <span class="muted">트럭 이름 :</span>&nbsp;&nbsp;<input type='text' placeholder='사용 트럭 이름을 입력하세요' name='truck' class="input-small">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  	 <input type="checkbox" name="refund"/>&nbsp;&nbsp;<span class="muted">환불 요청</span><br/>
					  	 <span class="muted">금액 :</span>&nbsp;&nbsp;<input type='number' placeholder='결제 금액 이상' name='price1' class="input-medium" min="0">&nbsp;&nbsp;~&nbsp;&nbsp;<input type='number' class="input-medium" min="0" placeholder='결제 금액 이하' name='price2'>
					  	 <span class="muted">날짜 :</span>&nbsp;&nbsp;<input type='date' placeholder='날짜 이상' name='date1' class="input-medium">&nbsp;&nbsp;~&nbsp;&nbsp;<input type='date' placeholder='날짜 이하' name='date2' class="input-medium">&nbsp;&nbsp;&nbsp;
						<div align="center"><input type="submit" class="btn" value="검색"/></div>
					</td>
				</tr>
			</table>		  			  	 
		</form>			
	</div>


<hr/>

<div id="tablefield">

<table class="table table-bordered">
			<thead>
				<tr>
					<td colspan="2">회원 ID</td>
					<td colspan="2">결제 금액</td>
					<td>거리</td>
					<td>사용 컨테이너</td>
					<td>사용 트럭</td>
					<td>환불 여부</td>
					<td>결제 날짜</td>
					<td>주문 상세</td>										
				</tr>				
			</thead>
			<tbody>				
				<c:if test="${list != null}">
					<c:forEach items="${list}" var="st">
						<tr>
							<td colspan="2">${st.id}</td>
							<td colspan="2">${st.price}원</td>
							<td >${st.distance}km</td>
							<td>${st.container }</td>
							<td>${st.truck }</td>
							<td><c:if test="${st.isrefund==0}">N</c:if><c:if test="${st.isrefund==1}">Y</c:if></td>
							<td>${st.date}</td>
							<td><a href="staffmodal?cmd=SHOWRESERVATIONINFO&res_num=${st.res_num}&id=${st.id}&res_date=${st.res_date }&time=${st.time }&pay_num=${st.pay_num}&staff_num=${st.staff_num}&content=${st.esimate_content}" 
							class="btn" data-toggle="modal" data-target="#detail_modal">보기</a></td>						
						</tr>
					</c:forEach>	
				</c:if>																
			</tbody>
			<tfoot>
				<tr>
					<td colspan="10">통계</td>
				</tr> 
				<tr>
					<td>총 신청수 </td>
					<td>${all_order }건</td>
					<td>이사건수 </td>
					<td>${sum_move}건</td>
					<td>합산금액</td>
					<td><fmt:formatNumber value="${sum_price}" type="currency" />원</td>
					<td>거리 총합</td>
					<td>${sum_dist}km</td>
					<td>총 환불 수 </td>
					<td>${sum_refund}건</td>
														
				</tr>			
			</tfoot>				
	</table>
</div>	
	
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
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>			
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
</script>

	
