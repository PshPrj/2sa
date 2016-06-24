<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 align="left">컨테이너 별 예약현황 <small>컨테이너 별 사용현황입니다.</small></h4>
	
<div align="right" id="truk_num">
<form class="form-inline" action="../staffpage?cmd=CONTAINER_RESERVATION" method="post">
	<span>컨테이너 목록</span>&nbsp;&nbsp;	
	<select name="select_name">	
		<c:if test="${name_list!=null}">
			<c:forEach items="${name_list}" var="st">
				<option>${st.container_name}</option>
			</c:forEach>
		</c:if>
	</select>
	 <button type="submit" class="btn">확인</button>	
	</form> 
</div>
<hr/>	
	
<table class="table table-bordered">
			<thead>
				<tr>
					<th colspan="3">컨테이너 이용현황</th>				
				</tr>				
			</thead>
			<tbody>
					<tr>
					<c:if test="${list_size!=0 }">
						<td rowspan="${list_size+1}">
							<h4 style="margin: auto;">최근 사용 고객</h4>
							<p class="text-info">(이사 완료 5개까지)</p>
							<a class="btn" href="staffmodal?cmd=ALL_CONRESERVATION&con_num=${container_num }" data-toggle="modal" data-target="#all_container_reservation" >전체 목록 보기</a>						
						</td>
					</c:if>
					<c:if test="${list_size==0}">
						<td rowspan="2">
						<h4 style="margin: auto;">최근 사용 고객</h4>				
						</td>
					</c:if>
						<td>결제 번호</td>
						<td>이용고객</td>
						<td>사용 날짜</td>
					</tr>
					<c:if test="${list_size==0}">
						<tr>
							<td colspan="3"><span class="text-info">컨테이너를 선택해주세요.</span></td>
						</tr>
					</c:if>
					<c:if test="${list_size!=0}">
						<c:forEach items="${list}" var="list">			
							<tr>
								<td>${list.pay_num}</td>
								<td>[ID : ${list.member_id }/ 이름 : ${list.member_name }] </td>
								<td>${list.date} ~ ${list.last_date}</td>
							</tr>
						</c:forEach>
					</c:if>	
					<tr>
						<td colspan="4">현재 사용 고객 리스트</td>
					</tr>					
					<tr>
						<td>결제 번호</td>
						<td>이용 고객</td>
						<td>사용 날짜</td>
						<td>물품 목록 확인</td>
					</tr>
					<c:if test="${current_size==0}">
						<tr>
							<td colspan="4"><span class="text-info">데이터가 없습니다.</span></td>
						</tr>
					</c:if>
					<c:if test="${current_size!=0}">
						<c:forEach items="${current}" var="cu">	
							<tr>
								<td>${cu.pay_num }</td>
								<td>[ID : ${cu.member_id }/ 이름 : ${cu.member_name }] </td>
								<td>${cu.date} ~ ${cu.last_date}</td>
								<td><a href="staffmodal?cmd=ITEMLIST_CONTAINER&res_num=${cu.res_num}" class="btn" data-toggle="modal" data-target="#container_item_modal">보기</a></td>
							</tr>
						</c:forEach>
					</c:if>					
			</tbody>
			<tfoot></tfoot>	
	</table>
	
		
	<div class="modal fade" id="container_item_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	          <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">물품목록</h3>
			  </div>
	          <div class="modal-body"></div>
	          <div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>			
			  </div>           
	        </div> <!-- /.modal-content -->
	    </div> <!-- /.modal-dialog -->
	</div> 
	
	<div class="modal fade" id="all_container_reservation" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	    <div class="modal-dialog">
	        <div class="modal-content">
	          <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">상세보기</h3>
			  </div>
	          <div class="modal-body"></div>
	          <div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>			
			  </div>           
	        </div> <!-- /.modal-content -->
	    </div> <!-- /.modal-dialog -->
	</div>  

	
	
	