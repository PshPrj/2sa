<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:if test="${staff!=null}">
${staff.name}+${staff.id}+${staff.tel}+${staff.dept}
</c:if>

<c:if test="${truck!=null}">
${truck.car_name}+${truck.car_type}+${truck.capacity}
</c:if>
<c:if test="${flag!=null}">
	${flag }
</c:if>