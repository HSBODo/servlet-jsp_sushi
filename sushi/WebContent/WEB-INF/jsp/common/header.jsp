<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>

<c:choose>
<c:when test="${empty member}">



</c:when>
<c:otherwise>
	<div class="div1">
     <a href="<%=request.getContextPath()%>/userdelete">회원탈퇴</a>
     <a href="<%=request.getContextPath()%>/logout">로그아웃/</a>
     <a href="<%=request.getContextPath()%>/usermodify">정보수정/</a>
     <p>${member.name}님 환영합니다.</p>
    </div>
</c:otherwise>    
    
    
    
</c:choose>    
	<div>
      <a class="title" href="<%=request.getContextPath()%>/index.html">송스시&참치</a>
    </div> 
</header>
<nav>
       <ul>
        <li><a href="<%=request.getContextPath()%>/board/list" >공지사항</a></li>
        <li><a href="<%=request.getContextPath()%>/review/list">리뷰/평점</a></li>
        <li><a href="<%=request.getContextPath()%>/gallery/list">메뉴소개</a></li>
       </ul>
</nav>
