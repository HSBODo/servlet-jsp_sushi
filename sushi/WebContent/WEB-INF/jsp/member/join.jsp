<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>2021. 8. 31.오후 4:26:40</title>

<jsp:include page="../common/head.jsp"></jsp:include>

<style>
 .msg{height: 20px;}
</style>

</head>


<body>


	<jsp:include page="../common/header.jsp"></jsp:include>
<main class="login">
	
	<form method="post" class="form-group" id="formj" name="formj"  >
			<legend>회원가입</legend>
		<fieldset>
			
			<h4><label for="id">아이디</label></h4>
			<input type="text" name="id" id="id"  class="form-control">
			<p class="msg text-danger"></p>
			
			<h4><label for="pwd">비밀번호</label></h4>
			<input type="password" name="pwd" id="pwd" class="form-control">
			<p class="msg text-danger"></p>
					
			<h4><label for="email">이메일</label></h4>
			<input type="text" name="email" id="email" class="form-control">
			<p class="msg text-danger"></p>
			
			<h4><label for="name">이름</label></h4>
			<input type="text" name="name" id="name" class="form-control">
			<p class="msg text-danger"></p>
			
			<button class="btn btn-primary" id="btnJoin">회원가입</button>
			
		</fieldset>
	</form>
</main>

<script>

	$(function(){
		$("#btnJoin").click(function(){
			var id = $("#id").val();
			
			if(!formj.id.value){
				 $("#id").next().text("아이디를 입력하세요.");
				formj.id.focus();
			}else if(!formj.pwd.value){
				 $("#pwd").next().text("비밀번호를 입력하세요");
				formj.pwd.focus();
			}else if(!formj.email.value){
				 $("#email").next().text("이메일을 입력하세요");
				formj.email.focus();
			}else if(!formj.name.value){
				 $("#name").next().text("이름을 입력하세요");
				formj.name.focus();
			}else if(id){	
				$.ajax("idValid?id="+id, {
				success : function(data){
					
					if(data/1){ //가능
						 $("#id").next().text("");
							$("#formj").submit();
					}
					else{ //불가능
									 			
						 $("#id").next().text("이미 가입된 회원입니다.");
						 formj.id.focus();
						
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