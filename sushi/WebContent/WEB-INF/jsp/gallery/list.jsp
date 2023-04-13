<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>

<jsp:include page="../common/head.jsp"></jsp:include>

	<style type="text/css">

.gbtn{text-align: center; margin-bottom: 50px;}
}
	</style>
</head>

<body>

<jsp:include page="../common/header.jsp"></jsp:include>
<div class="list" style="height: 700px;">
	<div class="container">
	
	<c:set var="endCount" value="${page.cri.amount-(page.cri.amount-1) % 3 + 2 }"/>
	
	<c:forEach begin="1" end="${endCount}" varStatus="stat">
		<c:set var="board" value="${list[stat.index-1] }"></c:set>
			<c:if test="${stat.index % 3 ==1 }">
		<div class="row justify-content-center">
		</c:if>		
		<div class="col m-3" >
		<c:if test="${not empty board }">
			<div><img class="border border-secondary w-100" src="${pageContext.request.contextPath}/display?filename=${board.attachs[0].path}/s_${board.attachs[0].uuid}" ></div>
			<div class="text-nowrap text-truncate" style="width: 250px;">
			   <a href="#"> ${board.title}</a>
			   </div>
		</c:if>
		</div>
		<c:if test="${stat.index %3 ==0 }">
		</div>
		</c:if>
	</c:forEach>
	<hr>
					
  			<ul class="pagination justify-content-center">
  		  				<li class="page-item ${page.prev?'':'disabled'}">
  							<a class="page-link" href="list?pageNum=${page.startPage-1}&amount=${page.cri.amount}">&lt</a></li>
  				
  				<c:forEach begin="${page.startPage}" end="${page.endPage}" var="p">
			  		<li class="page-item ${p == page.cri.pageNum ? 'active' : ''}">
			  			<a class="page-link" href="list?pageNum=${p}&amount=${page.cri.amount}">${p }</a>
			  		</li>
			 	</c:forEach>
			  	  				
 				<li class="page-item ${page.next?'':'disabled'}">
 					<a class="page-link" href="list?pageNum=${page.endPage+1}&amount=${page.cri.amount}">&gt</a></li>
			</ul>
		
	
		<c:if test="${member.id eq 'admin'}">
			<div class="gbtn">
				<td colspan="4"><a  href="write"><button>글쓰기</button></a></td>
			</div>
	
		</c:if>
	</div>	
	




</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>