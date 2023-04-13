<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>2021. 8. 31.오후 4:26:40</title>
<jsp:include page="../common/head.jsp"></jsp:include>

<link rel="stylesheet" href="css/style.css">

<style>
h3{text-align: center;}
</style>
</head>


<body>



	<jsp:include page="../common/header.jsp"></jsp:include>
<div class="login" style="height: 650px;">	
	
	<form method="post" >
		<fieldset>
			
			
			<h4><label for="id">아이디</label></h4>
			<input type="text" name="id" id="id">
			
			<h4><label for="pwd">비밀번호</label></h4>
			<input type="password" name="pwd">
			
			<p><label><input type="checkbox" name="savedId" id="savedId">아이디저장</label></p>
			
			<p><button>로그인</button></p>
			
		</fieldset>
	</form>
	
	
	<h3><%=request.getParameter("msg") == null? "":request.getParameter("msg")  %></h3>
</div>
	
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
	<script>
	  
		$(function() {
			var savedId=$.cookie("savedId");
			
			if(savedId){
				$("#id").val($.cookie("savedId"));
				$("#savedId").prop("checked",true);
			}
			
		});
	
	</script>

</body>
</html>