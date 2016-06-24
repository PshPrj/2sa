<%@ page contentType="text/html; charset=utf-8" %>
<span style="font-size:14pt">트럭 통계</span>

	
		<jsp:include page="site_info.jsp"/>
	



<hr/>

<table class="table table-bordered">
			<thead>
				<tr>
					<td>트럭 번호</td>
					<td>차종</td>
					<td>용량</td>
					<td>이용 횟수</td>
					<td>등록 일자</td>
					<td>최근 사용일자</td>
					<td>현재 사용 고객</td>
				</tr>				
			</thead>
			<tbody>				
					<tr>
						<td>1555</td>
						<td>벤츠</td>
						<td>4.5톤 </td>
						<td>44 </td>
						<td>2015-06-01</td>
						<td>2016-07-08</td>
						<td><a href="./staff/statistics/modal/show_detail_info.jsp" class="btn" data-toggle="modal" data-target="#detail_modal">보기</a></td>						
					</tr>											
			</tbody>
			<tfoot> 
				<tr>
					<td colspan="6">총 사용횟수 </td>
					<td>451건</td>													
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
				<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>			
			  </div>           
	        </div> <!-- /.modal-content -->
	    </div> <!-- /.modal-dialog -->
	</div> 