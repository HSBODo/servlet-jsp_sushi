<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>2021. 8. 31.오후 4:26:40</title>

<jsp:include page="../common/head.jsp"></jsp:include>

<style>
 .msg{height: 20px;}
 .btn{margin-bottom: 10px;}
</style>

</head>


<body>


	<jsp:include page="../common/header.jsp" ></jsp:include>
<main class="login">
	
	<form method="post" class="form-group" id="formm" >
			<legend>회원정보수정</legend>
		<fieldset>
			
			<h4><label for="id">아이디</label></h4>
			<input type="text" name="id" id="id"  class="form-control" value="${member.id}" disabled="disabled" >
			<input type="hidden" name="id" id="id"  class="form-control" value="${member.id}"  hidden="">
			<p class="msg text-danger"></p>
			
			<h4><label for="pwd">비밀번호</label></h4>
			<input type="password" name="pwd" id="pwd" class="form-control" value="${member.pwd}">
			<p class="msg text-danger"></p>
	
					
			<h4><label for="email">이메일</label></h4>
			<input type="text" name="email" id="email" class="form-control" value="${member.email}">
			<p class="msg text-danger"></p>
			
			<h4><label for="name">이름</label></h4>
			<input type="text" name="name" id="name" class="form-control" value="${member.name}">
			<p class="msg text-danger"></p>
			
			<button class="btn btn-primary" id="btnmodify">수정하기</button>
			
		
		</fieldset>
	</form>
</main>

<script>


	$(function(){
		$("#btnmodify").click(function(){
			
			var email = $("#email").val();
			
			if(!formm.pwd.value){
				 $("#pwd").next().text("비밀번호를 입력하세요.");
				formm.pwd.focus();
			}else if(!formm.email.value){
				 $("#email").next().text("이메일을 입력하세요");
				formm.email.focus();
			}else if(!formm.name.value){
				 $("#name").next().text("이름을 입력하세요");
				formm.name.focus();
			}
					
			else if(email){
				$.ajax("emValid?email="+email, {
					success : function(data){
						
						if(data/1){ //가능
							 $("#email").next().text("");
								$("#formm").submit();
						}
						else{ //불가능
													
							 $("#email").next().text("중복된 이메일입니다.");
							
							 
						}
						
					}
				})
			}else {
				
			}

			 event.preventDefault(); 
		})
	});
	


</script>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>