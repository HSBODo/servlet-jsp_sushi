<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>

<head>

<jsp:include page="../common/head.jsp"></jsp:include>

<style>
.list table{width: 80%; margin: 40px auto; border-collapse:  collapse; table-layout: fixed;}
.list th, .list td {padding: 8px;}
.list th { background: #bbb; text-align: center;}
.list td{border-top: 3px solid #bbb; text-align: center; }
.list td+ td {text-align: left; width: 80%;overflow: hidden;white-space: nowrap; text-overflow: ellipsis;}
.list td + td + td { text-align: center; width: 10%;}
.listitle {overflow: hidden;white-space: nowrap; text-overflow: ellipsis;  }
</style>
</head>

<body>

<jsp:include page="../common/header.jsp"></jsp:include>
<div class="list" style="height: 700px;">
<table>
	<tr>
		<th>연번</th>
		<th>제목</th>
		<th>평점</th>
		<th>작성자</th>
		<th>작성일</th>
		
	</tr>
	<c:forEach items='${list}' var="b">
	<tr>
		<td>${b.bno}</td>
		<td><a class="listitle" href="detail?bno=${b.bno}">${b.title}</a><span class="text-truncate small">[${b.replyCnt}]</span></td>
		<td>${b.rank}</td>
		<td>${b.id}</td>
		<td><fmt:formatDate value="${b.regDate}" pattern="yy/MM/dd"/> </td>
	</tr>
	
	
	
		
	</c:forEach>
	<tr>
		<td colspan="5" >
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
		
		</td>
			<!--  ${page} -->
	
	</tr>

	<c:if test="${not empty member }">
	<tr>
		<td colspan="5"><a  href="write"><button>글쓰기</button></a></td>
	</tr>
	
	</c:if>
</table>


</div>
<jsp:include page="../common/footer.jsp"></jsp:include>
</body>
</html>