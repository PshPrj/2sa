<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div>
	<h4 align="left" style="margin-left: 10px;">컨테이너 관리</h4>
	<div class="row " align="right">
		<a class="btn" id="register_container" href="staffmodal?cmd=REGISTER_CON" data-toggle="modal" data-target="#register_container_modal">컨테이너 등록</a>&nbsp;&nbsp;&nbsp; 
		<span class="text-info">컨테이너 정보를 등록합니다.</span>		      
		<hr/>
	</div>
</div>
<table class="table table-striped table-bordered">
	<c:set var="cnt" value="0" /> 
	<tbody>
		<c:if test="${list!=null}">
			<c:forEach items="${list}" var="st">
				<c:if test="${cnt%3==0||list_size==cnt}">
					<tr>
				</c:if>
				
				<td>
				<p style="text-align: right;">${st.container_name}</p>
					<c:if test="${st.staff_num==0}">
						<p style="text-align: right;color:red;">담당자 배정 필요</p>
					</c:if>
				<a  class="btn primary_btn"  href="staffmodal?cmd=CONTAINERSTATUS&con_num=${st.container_num }&con_name=${st.container_name}&staff_num=${st.staff_num}"  data-toggle="modal" data-target="#container_status_modal"><img src="../img/8.png" style="margin-left: auto;margin-top: auto;"/></a>
				<p align="right"><a href="staffpage?cmd=DELETECONTAINER&con_num=${st.container_num }">삭제</a></p>
				</td>
				<c:if test="${cnt%6==2||list_size==cnt}">			
					</tr>
				</c:if>				
			<c:set var="cnt" value="${cnt+1}"/>
			</c:forEach>
		</c:if>				
	</tbody>					
</table>
		
		
<div align="center">
	<div class="pagination pagination-centered">
		<c:set var="loop" value="false" />
		<ul>
			<c:if test="${totalBlock >= nowBlock+1}">
				<c:if test="${nowBlock!=0}">			
					<li><a href="../staffpage?cmd=CONTAINER&nowPage=${nowPage-1}&nowBlock=${nowBlock-1}">Prev</a></li>
				</c:if>
				<c:forEach begin="1" end="5" var="i">
					<c:if test="${not loop}">
						<c:if test="${nowBlock*pagePerBlock+i-1 != totalPage}">
							<c:if test="${params!=null}">
								<li><a href="../staffpage?cmd=CONTAINER&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
							<c:if test="${params==null}">
								<li><a href="../staffpage?cmd=CONTAINER&nowPage=${nowBlock*pagePerBlock+i}&nowBlock=${nowBlock}">${i+nowBlock*pagePerBlock}</a></li>
							</c:if>
						</c:if>
						<c:if test="${nowBlock*pagePerBlock+i-1 == totalPage}">
							<c:set var="loop" value="true" />
						</c:if>
					</c:if>
				</c:forEach>
				<c:if test="${totalBlock > nowBlock+1}">
				<li><a href="../staffpage?cmd=CONTAINER&nowPage=${(nowBlock+1)*pagePerBlock+1}&nowBlock=${nowBlock+1}">Next</a></li>
				</c:if>
			</c:if>
		</ul>
	</div>
</div>
	
	 <!-- Modal -->
<div class="modal fade" id="container_status_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">컨테이너 관리</h3>
		  </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
			<button class="btn" id="close"aria-hidden="true">Close</button>
		  </div>           
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> 

<div class="modal fade" id="register_container_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
			<button type="button" class="close" 
				aria-hidden="true">×</button>
			<h3 id="myModalLabel">컨테이너 등록</h3>
		  </div>
          <div class="modal-body"></div>
          <div class="modal-footer">
			<button class="btn" data-dismiss="modal" id="close" aria-hidden="true">Close</button>			
		  </div>           
        </div> <!-- /.modal-content -->
    </div> <!-- /.modal-dialog -->
</div> 


<script>
	$("#close").click(function (){
		location.reload();
	});
</script>