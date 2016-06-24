<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h4 align="left">트럭 별 예약현황 <small>트럭 별 사용현황입니다.</small></h4>

<div align="right" id="truk_num">
<form class="form-inline" action="../staffpage?cmd=TRUCK_RESERVATION" method="post">
	<span>트럭 번호</span>&nbsp;&nbsp;	
	<select name="select_name">	
		<c:if test="${name_list!=null}">
			<c:forEach items="${name_list}" var="st">
				<!-- 트럭 번호 보여줌 -->
				<option>${st.car_name}</option>
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
			<th colspan="4">트럭 이용현황</th>
		</tr>
	</thead>
	<tbody>
		<tr><c:if test="${list!=null }">
				<td rowspan="${list_size+1}">
				<h4 style="margin: auto;">최근 사용 고객</h4>
				<p class="text-info">(이사 완료 5개까지)</p> <a class="btn"
				href="staffmodal?cmd=ALL_TRUCK_INFO&truck_num=${truck_num}"
				data-toggle="modal" data-target="#all_truck_reservation">전체 목록
					보기</a>				
				</td>
			</c:if>
			<c:if test="${list==null}">
				<td rowspan="2">
				<h4 style="margin: auto;">최근 사용 고객</h4>				
				</td>
			</c:if>
			<td>결제 번호</td>
			<td>이용 고객</td>
			<td>사용 날짜</td>
		</tr>
		<c:if test="${list_size==0}">
			<tr>
				<td colspan="3"><span class="text-info">차 번호를 선택해주세요.</span></td>
			</tr>
		</c:if>	
		<c:if test="${list_size!=0}">
			<c:forEach items="${list}" var="list">			
				<tr>
					<td>${list.pay_num}</td>
					<td>[ID : ${list.member_id }/ 이름 : ${list.member_name }] </td>
					<td>${list.date}</td>
				</tr>
			</c:forEach>
		</c:if>		
		<tr>
			<td colspan="4">현재 예약 리스트</td>
		</tr>
		<tr>
			<td>예약 번호</td>
			<td>고객</td>
			<td>사용 날짜</td>
			<td>예약 상세 보기</td>
		</tr>
		
		<c:if test="${current!=null}">
			<tr>
				<td>${current.pay_num}</td>
				<td>${current.member_id}/${current.member_name }</td>
				<td>${current.date}</td>
				<td><a
					href="staffmodal?cmd=CURRENTRESTURCK&truck_num=${truck_num }"
					class="btn" data-toggle="modal"
					data-target="#detail_truck_reservation">보기</a></td>
			</tr>
		</c:if>
		<c:if test="${current==null}">
			<tr>
				<td colspan="4"><span class="text-info">데이터가 없습니다.</span></td>
			</tr>
		</c:if>		
	</tbody>
	<tfoot></tfoot>
</table>

<div class="modal fade" id="detail_truck_reservation" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content" style="margin: auto">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>


<div class="modal fade" id="all_truck_reservation" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true" style="margin: auto;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 id="myModalLabel">예약 목록</h3>
			</div>
			<div class="modal-body"></div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
			</div>
		</div>
		<!-- /.modal-content -->
	</div>
	<!-- /.modal-dialog -->
</div>







