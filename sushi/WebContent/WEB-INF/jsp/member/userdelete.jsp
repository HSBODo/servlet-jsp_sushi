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


	<jsp:include page="../common/header.jsp"></jsp:include>
<div class="login" style="height: 650px;">
	
	<form method="post" class="form-group" id="formd" >
			<legend>회원탈퇴</legend>
			<fieldset>
			
			<h4><label for="id">아이디</label></h4>
			<input type="text" name="id" id="id"  class="form-control" value="${member.id}" disabled="disabled" >
			<input type="hidden" name="id" id="id"  class="form-control" value="${member.id}"  hidden="">
			
			
					
			<h4><label for="email">이메일</label></h4>
			<input type="text" name="email" id="email" class="form-control" value="${member.email}" disabled="disabled">
			<input type="hidden" name="email" id="email"  class="form-control" value="${member.email}"  hidden="">
			
			<h4><label for="name">이름</label></h4>
			<input type="text" name="name" id="name" class="form-control" value="${member.name}" disabled="disabled">
			<input type="hidden" name="name" id="name"  class="form-control" value="${member.name}"  hidden="">
			
			<h4><label for="pwd">비밀번호</label></h4>
			<input type="password" name="pwd" id="pwd" class="form-control" placeholder="비밀번호를 입력해주세요.">
			<p class="msg text-danger"></p>
			
			<a href="<%=request.getContextPath()%>/logout"><button class="btn btn-primary" id="btndelete">탈퇴하기</button></a>
			
		
		</fieldset>
	</form>
</div>

<script>

	$(function(){
		$("#btndelete").click(function(){
			
			var pwd = $("#pwd").val();
			
			if(!formd.pwd.value){
				 $("#pwd").next().text("비밀번호를 입력하세요.");
				formd.pwd.focus();
			}
			
			else if(pwd){
				$.ajax("pwdValid?pwd="+pwd, {
					success : function(data){
						
						if(data/1){ //가능
							
							 $("#pwd").next().text("");
							$("#formd").submit();
						}
						else{ //불가능
						
							 $("#pwd").next().text("비밀번호가 일치하지 않습니다.");
							
							
						}
						
					}
				})
			}
			else {
				
			}

			 event.preventDefault(); 
		})
	});


</script>
	
	
	<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>