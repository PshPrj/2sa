<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 id="payment_title" align="left">결제 완료<small id="subtitle">결제 완료 목록입니다.</small></h4>


 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>

<div id="content">
	<form action="../staffpage?cmd=PAYMENT_CONFIRM" method="post">
		<input type="hidden" value="params" name="params" /> 
		<table class="table table-bordered">
			<tr>
				<td>
							<span class="muted">회원 id: </span>&nbsp;&nbsp;<input type='text' placeholder='회원 id를 입력하세요' name='id' class="input-medium">&nbsp;&nbsp;&nbsp;
							<span class="muted">예약 번호 :</span>&nbsp;&nbsp;<input type='text' placeholder='예약 번호를 입력하세요' name='num' class="input-medium">&nbsp;&nbsp;&nbsp;
							<span class="muted">회원 번호 :</span>&nbsp;&nbsp;<input type='text' placeholder='회원 번호를 입력하세요' name='member_num' class="input-medium">
							<br /> <span class="muted">금액 :</span>&nbsp;&nbsp;<input type='number' placeholder='결제 금액 이상' name='price1' class="input-medium" min="0">&nbsp;&nbsp;~&nbsp;&nbsp;
							<input type='number' class="input-medium" min="0" placeholder='결제 금액 이하' name='price2'><br /> 
							<div align="center"><input type="submit" class="btn" value="검색" /></div>
				</td>
			</tr>
		</table>
	</form>
</div>



<table class="table table-bordered">
			<thead>
				<tr>
					<td>회원 번호</td>
					<td>회원 ID</td>
					<td>예약 번호</td>
					<td>금액</td>
					<td>   </td>									
				</tr>				
			</thead>
			<tbody>
				<c:if test="${list != null}">
					<c:forEach items="${list}" var="st">				
						<tr>
							<td>
							<c:if test="${st.truck_num==0}">
								<span style="color: red;">배정 필요</span> &nbsp;&nbsp;&nbsp;
							</c:if>
							${st.member_num }							
							</td>
							<td>${st.id }</td>
							<td>${st.res_num}</td>
							<td><fmt:formatNumber value="${st.price}" type="currency" /></td>
							<td><a href="staffmodal?cmd=ASSIGN_RESERVATION&pay_num=${st.pay_num}&date_cnt=${st.date_cnt}&res_num=${st.res_num}&member_num=${st.member_num }" class="btn"  data-toggle="modal" data-target="#set_item_modal">배정</a></td>
						</tr>
					</c:forEach>
				</c:if>
				<c:if test="${list_size==0 }">
					<tr>
						<td colspan="5"><p class="text-info" >데이터가 없습니다.</p></td>
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
			<c:if test="${nowBlock!=0}">
				<li><a href="../staffpage?cmd=PAYMENT&nowPage=${nowPage-1}&nowBlock=${nowBlock-1}">Prev</a></li>
			</c:if>	
				<c:forEach begin="1" end="5" var="i">
					<c:if test="${not loop}">
						<c:if test="${nowBlock*pagePerBlock+i-1 != totalPage}">
							<c:if test="${params!=null}">
								<li><a href="../staffpage?cmd=PAYMENT_CONFIRM&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}
								&params=params&id=${text.id}&num=${text.board_num}&member_num=${text.member_num}&price1=${text.price1}&price2=${text.price2}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
							<c:if test="${params==null}">
								<li><a href="../staffpage?cmd=PAYMENT_CONFIRM&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
						</c:if>
						<c:if test="${nowBlock*pagePerBlock+i-1 == totalPage}">
							<c:set var="loop" value="true" />
						</c:if>

					</c:if>
				</c:forEach>
					<c:if test="${totalBlock > nowBlock+1}">
						<li><a href="../staffpage?cmd=PAYMENT&nowPage=${(nowBlock+1)*pagePerBlock+1}&nowBlock=${nowBlock+1}">Next</a></li>
					</c:if>
			</c:if>
			
		</ul>
	</div>	
</div>


			
<div class="modal fade" id="set_item_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	          <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">결제 완료</h3>
			  </div>
	          <div class="modal-body"></div>	                     
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
</script>	