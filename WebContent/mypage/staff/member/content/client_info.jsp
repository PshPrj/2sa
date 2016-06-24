<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 align="left">회원 관리 <small>회원 정보를 확인합니다.</small> </h4>
 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>
 <div id="content">
	<form action="../staffpage?cmd=MEMBER" method="post">
		<input type="hidden" value="params" name="params" />
		<table class="table table-bordered">
			<tr>
				<td>회원 번호&nbsp;&nbsp;
				<input type='text' placeholder='회원 번호를 입력하세요' name='member_num' class="input-medium">&nbsp;&nbsp;&nbsp;&nbsp;
				회원 id&nbsp;&nbsp;
				<input type='text' placeholder='회원 id를 입력하세요' name='id' class="input-medium">&nbsp;&nbsp;&nbsp;&nbsp;
				회원 이름&nbsp;&nbsp;
				<input type='text' placeholder='이름을 입력하세요' name='name' class="input-medium">&nbsp;&nbsp;&nbsp;&nbsp;
				<br/>
				예약 횟수&nbsp;&nbsp;
				<input type='text' placeholder='예약 횟수를 입력하세요' name='history' class="input-medium">&nbsp;&nbsp;&nbsp;&nbsp;
				환불 횟수&nbsp;&nbsp;<input type='text' placeholder='환불 횟수를 입력하세요' name='refund' class="input-medium">&nbsp;&nbsp;
				<br/>
				가입 날짜&nbsp;&nbsp;
				<input type='date' placeholder='날짜 이상' name='date1' class="input-medium">&nbsp;&nbsp;~&nbsp;&nbsp;
					<input type='date' placeholder='날짜 이하' name='date2' class="input-medium">
				<br/>	
					<div align="center"><input type="submit" class="btn" value="검색" /> </div>	
				
				</td>
			</tr>
		</table> 
		
	</form>
</div>
 
 
<hr/>

<table class="table table-bordered">
			<thead>
				<tr>
					<td>회원 번호</td>
					<td>회원 ID</td>
					<td>가입 날짜</td>
					<td>회원 예약 횟수/환불 횟수</td>
					<td>상세 정보 보기</td>
									
				</tr>				
			</thead>
			<tbody>
				<c:if test="${list != null}">
					<c:forEach items="${list}" var="st">				
						<tr>
							<td>${st.member_num }</td>
							<td>${st.id }</td>
							<td>${st.date } </td>
							<td>${st.history } / ${st.refund }</td>
							<td><a href="staffmodal?cmd=CLIENT_INFO&num=${st.member_num}" class="btn" data-toggle="modal" data-target="#detail_client_info_modal">보기</a></td>
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
				<li><a href="../staffpage?cmd=MEMBER&nowPage=${nowPage-1}&nowBlock=${nowBlock-1}">Prev</a></li>
				</c:if>
				<c:forEach begin="1" end="5" var="i">
					<c:if test="${not loop}">
						<c:if test="${nowBlock*pagePerBlock+i-1 != totalPage}">
							<c:if test="${params!=null}">
								<li><a href="../staffpage?cmd=MEMBER&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}
								&params=params&id=${id}&name=${name}&date1=${date1}&date2=${date2}&member_num=${member_num}
								&refund=${refund}&history=${history}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
							<c:if test="${params==null}">
								<li><a href="../staffpage?cmd=MEMBER&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
						</c:if>
						<c:if test="${nowBlock*pagePerBlock+i-1 == totalPage}">
							<c:set var="loop" value="true" />
						</c:if>

					</c:if>
				</c:forEach>
				<c:if test="${totalBlock > nowBlock+1}">
				<li><a href="../staffpage?cmd=MEMBER&nowPage=${(nowBlock+1)*pagePerBlock+1}&nowBlock=${nowBlock+1}">Next</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
</div>



	<div class="modal fade" id="detail_client_info_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	          <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">고객 정보</h3>
			  </div>
	          <div class="modal-body"></div>
	          <div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>			
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
</script>