<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<jsp:include page="../common/head.jsp"></jsp:include>

<style type="text/css">
.boardUpdate table{width: 80%; margin: 40px auto; border-collapse:  collapse; }
.boardUpdate td{padding:8px;  }
.boardUpdate textarea {width: 100%; height: 300px ; padding: 5px; resize: none; overflow-y: scroll;}
.boardUpdate input{width: 100%; padding: 5px;}
.boardUpdate .wbt{ border-top: 3px solid #bbb; width: 100%;}
.wbt button{float: right; margin: 0 5px;}

</style>
</head>

<body>

<jsp:include page="../common/header.jsp"></jsp:include>

<main class="boardUpdate">

<form method="post" enctype="multipart/form-data" onsubmit="return checkWrite()">
	<table>

		<tr> 
			<td><input type="text" name="title" id="title" value="${review.title}"></td>
		</tr>
		
		
	
		<tr>
			<td><textarea name="content" id="content">${review.content}</textarea>
		</tr>
		
		<tr>
			<td><input type="file" name="file1"></td>
		</tr>
		<tr>
			<td><input type="file" name="file2"></td>
		</tr>
		<tr>
			<td><input type="file" name="file3"></td>
		</tr>
		
		<tr>
			<td class="wbt"><button type="button" class="btn btn-secondary" id="cclbtn">취소</button><button class="btn btn-secondary">수정</button></td>
		
		</tr>
	</table>

</form>

</main>
<jsp:include page="../common/footer.jsp"></jsp:include>
<script>

function checkWrite() {
	var titleLen = $("#title").val().trim().length;
    var contentLen = $("#content").val().trim().length;
    
    if(!titleLen) {
        alert("제목을 입력하세요");
        $("#title").focus();
        return false;
    }
    
    if(!contentLen) {
        alert("내용을 입력하세요");
        $("#content").focus();
        return false;
    }
}


$(function() {
	$("#cclbtn").click(function() {
		history.go(-1);
	});
})
</script>
</body>
</html>