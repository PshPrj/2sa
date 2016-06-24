<%@ page contentType="text/html; charset=utf-8" %>

<span style="font-size:14pt">컨테이너 통계</span>
<jsp:include page="site_info.jsp"/>
<hr/>

<table class="table table-bordered">
			<thead>
				<tr>
					<td >컨테이너 번호</td>
					<td >이용 횟수</td>
					<td >등록일자</td>
					<td>마지막 사용 일자</td>
					<td>현재 사용 회원</td>													
				</tr>				
			</thead>
			<tbody>				
					<tr>
						<td >A-1</td>
						<td >52</td>
						<td >2015-11-30 </td>
						<td >2016-05-30 </td>				
						<td><a href="./staff/statistics/modal/show_detail_info.jsp" class="btn" data-toggle="modal" data-target="#detail_modal">보기</a></td>						
					</tr>											
			</tbody>
			<tfoot> 
				<tr>
					<td colspan="4">총 보관횟수 </td>
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