<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<h4 align="left">이사 진행 상황 <small>오늘의 이사 진행 상황입니다.</small></h4>

<p id="search_filed">검색 <i class=" icon-chevron-down"></i></p>

<div id="content">
	<form action="../staffpage?cmd=PROGRESS" method="post">
	<input type="hidden" value="params" name="params" /> 
	<table class="table">
		<tr>

			<td> 예약번호 &nbsp;&nbsp;<input type='text' placeholder='예약 번호를 입력하세요' name='res_num' class="input-medium"> &nbsp;&nbsp; &nbsp;&nbsp;
			ID &nbsp;&nbsp;<input type='text' placeholder='ID를 입력하세요' name='id' class="input-medium"><br/>
			거리 &nbsp;&nbsp;
			<input type='text' placeholder='이상' name='dist1' class="input-medium">&nbsp;~&nbsp;
			<input type='text' placeholder='이하' name='dist2' class="input-medium">
			<br/>
			<div align="center"><input type="submit" class="btn" value="검색" /></div>
			</td>
		</tr>
	</table>
		
	</form>
</div>


<hr/>


<div class="row" style="margin: auto;">
	<table class="table table-striped table-bordered table-hover">
		<thead>
			<tr>
				<th>예약 번호</th>
				<th>아이디</th>
				<th>거리</th>
				<th>보기</th>				
			</tr>
		</thead>
		
		<tbody>
			<c:if test="${list_size!= 0}">
				<c:forEach items="${list}" var="list">			
				<tr><td >${list.res_num}</td>
					<td>[ID ${list.member_id } / 이름 ${list.member_name }]</td>
					<td >${list.dist } km</td>
					<td >
					<a id="showProgress" class="btn primary_btn"  href="staffmodal?cmd=SHOW_PROGRESS&pay_num=${list.pay_num }"  data-toggle="modal" data-target="#movement_status_modal">보기</a>
					</td>
				</tr>
				</c:forEach>
			</c:if>
			<c:if test="${list_size== 0}">
				<tr>
					<td colspan="5"><p class="text_info">오늘은 이사가 없습니다.</p></td>
				</tr>
			</c:if>					
		</tbody>
	</table>
		
</div>

<div align="center">

	<div class="pagination pagination-centered">
		<c:set var="loop" value="false" />

		<ul>

			<c:if test="${totalBlock >= nowBlock+1}">
				<c:if test="${nowBlock!=0 }">
				<li><a href="../staffpage?cmd=PROGRESS=${nowPage-1}&nowBlock=${nowBlock-1}">Prev</a></li>
				</c:if>
				<c:forEach begin="1" end="5" var="i">
					<c:if test="${not loop}">
						<c:if test="${nowBlock*pagePerBlock+i-1 != totalPage}">
							<c:if test="${params!=null}">
								<li><a href="../staffpage?cmd=PROGRESS&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}
								&params=params&id=${id}&dist1=${dist1}&date2=${dist2}&res_num=${res_num}
								">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
							<c:if test="${params==null}">
								<li><a href="../staffpage?cmd=PROGRESS&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
						</c:if>
						<c:if test="${nowBlock*pagePerBlock+i-1 == totalPage}">
							<c:set var="loop" value="true" />
						</c:if>

					</c:if>
				</c:forEach>
				<c:if test="${nowBlock!=totalBlock&&totalBlock>5}">
				<li><a href="../staffpage?cmd=PROGRESS&nowPage=${(nowBlock+1)*pagePerBlock}&nowBlock=${nowBlock+1}">Next</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
</div>





<!-- Modal -->
<div class="modal fade" id="movement_status_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">이사 진행 현황
			</h3>
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