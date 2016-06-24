<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<table class="table table-bordered">
			<thead>
				<tr>
					<td>총 회원수</td>
					<td>총 직원수</td>
					<td>총 트럭수</td>
					<td>총 컨테이너 수</td>
					<td>총 결제횟수</td>
					<td>총 견적수</td>
				</tr>				
			</thead>
			<tbody>				
					<tr>
						<td>${data.all_member}명</td>
						<td>${data.all_staff}명</td>
						<td>${data.all_truck}대</td>
						<td>${data.all_container}개</td>
						<td>${data.all_payment}건</td>
						<td>${data.all_estimation}건</td>
					</tr>											
			</tbody>
			<tfoot></tfoot>				
	</table>





	
	