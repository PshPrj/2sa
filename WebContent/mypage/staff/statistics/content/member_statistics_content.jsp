<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="s_title"><h4 id="statistics_title" align="left">회원 통계 <small>등록한 회원 통계 정보를 확인합니다.</small></h4></div>

<%@ include file="site_info.jsp" %>

 <p id="search_filed">검색  <i class=" icon-chevron-down"></i></p>

	<div id="content">
		<form  action="../staffpage?cmd=STATISTICS_CLIENT" method="post">
			<input type="hidden" value="params" name="params"/> 		
		  	 <span class="muted">회원 ID:  </span>&nbsp;&nbsp;<input type='text' placeholder='회원 ID를 입력하세요' name='id' class="input-small"/>&nbsp;&nbsp;&nbsp;
		 	 <span class="muted">회원 이름:  </span>&nbsp;&nbsp;<input type='text' placeholder='회원 이름을 입력하세요.' name='name' class="input-small">
		  	 <span class="muted">가입 날짜 :</span>&nbsp;&nbsp;<input type='date' placeholder='날짜 이상' name='date1' class="input-medium">&nbsp;&nbsp;~&nbsp;&nbsp;<input type='date' placeholder='날짜 이하' name='date2' class="input-medium">&nbsp;&nbsp;&nbsp;
			 <br/><div align="center"><input type="submit" class="btn" value="검색"/>	</div>	  	 
		</form>			
	</div>


<hr/>


<table class="table table-bordered">
			<thead>
				<tr>
					<td>회원 ID</td>
					<td>회원 이름</td>
					<td>가입 일자</td>
					<td>이사서비스 사용횟수</td>
					<td>상세보기</td>													
				</tr>				
			</thead>
			<tbody>
				<c:if test="${list != null}">
					<c:forEach items="${list}" var="st">				
						<tr>
							<td>${st.m_id }</td>
							<td>${st.m_name }</td>
							<td>${st.regi_date }</td>
							<td>${st.move_cnt}건 </td>				
							<td>
							<a href="staffmodal?cmd=MEMBERDETAIL&name=${st.m_name }&id=${st.m_id }&num=${st.num}" class="btn" data-toggle="modal" data-target="#detail_modal">보기</a></td>						
						</tr>
					</c:forEach>
				</c:if>											
			</tbody>
			<tfoot> 
				<tr>
					<td colspan="2">기간 내 가입 회원수</td>
					<td>${member_sum}명</td>
					<td>이용횟수</td>
					<td>${move_sum }건</td>															
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
	
	
<script> 
$(document).ready(function(){
	$("#content").hide();
    $("#search_filed").click(function(){
        $("#content").slideToggle("slow");
    });
});
</script>