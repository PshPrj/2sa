<!-- 
	임동범
	2016-06-14
	물품 목록 확인
	
 -->

<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE HTML>

<h4>물품 확인</h4>

<c:if test="${itemList != null}">
	<div class="accordion" id="accordion1">
		<c:forEach items="${itemList}" var="item" varStatus="status">
  			<div class="accordion-group">
    			<div class="accordion-heading">
      				<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#collapse${status.count}">
        				#${item.estimate_board_num}
        				<fmt:parseDate value="${item.estimate_date}" pattern="yyyy-MM-dd HH:mm:ss" var="est_date"/>
        				<fmt:formatDate value="${est_date }" pattern="yyyy일 MM월 dd일 HH시 mm분 ss초" var="date"/>
        				${date}
        				에 저장한 물품 목록입니다.
      				</a>
    			</div>
    			<div id="collapse${status.count}" class="accordion-body collapse">
      				<div class="accordion-inner">
      					<table class="table" style="margin-bottom: 0px;">
	        				<c:forTokens items="${item.estimate_content}" delims="," var="name" varStatus="name_cnt">
    	    				<tr>
        						<td class="span5" style="border:none;">${name_cnt.count}</td>
        						<td class="span7" style="border:none;">${name}</td>
        					</tr>
							</c:forTokens>
							<c:forEach items="${pictureList}" var="pic" varStatus="picStatus">
								<c:if test="${pic.picture_num != 0 && item.estimate_board_num == pic.estimate_board_num}">
       								<tr>
       									<td>내 방 사진 보기 ${picStatus.count}</td>
	       								<td>
    	   									<a href="#" role="button" class="btn" data-toggle="modal" data-target="#myRoomModal${pic.picture_num}">보기</a>
       									</td>
       								</tr>
								</c:if>
							</c:forEach>
						</table>
      				</div> <!-- accordion-inner -->
    			</div> <!-- collapse -->
  			</div> <!-- accordion-group -->
		</c:forEach>
	</div> <!-- accordion -->
</c:if>

<c:if test="${pictureList != null}">
	<c:forEach items="${pictureList}" var="pic" varStatus="picStatus">
	<c:if test="${pic.picture_num != 0}">
		<div id="myRoomModal${pic.picture_num}" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="payLabel" aria-hidden="true" data-backdrop="static" hidden="hidden">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
						<h3 id="myModalLabel">내 방 사진</h3>
					</div>
					<div class="modal-body">
						<img id="myRoom" src="../upload/estimate/${pic.img}">
					</div>
					<div class="modal-footer">
						<button class="btn" data-dismiss="modal" aria-hidden="true">닫기</button>
					</div>
				</div>
			</div>
		</div> <!-- modal -->
	</c:if>
	</c:forEach>
</c:if>

<style>
.accordion-inner td {
	text-align: center;
}

#myRoom {
	height: 100%;
	width: 100%;
}
</style>