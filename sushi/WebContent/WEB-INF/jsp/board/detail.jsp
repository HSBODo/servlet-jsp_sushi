<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="../common/head.jsp"></jsp:include>
<style type="text/css">
.detail table{width: 100%; margin: 40px auto; border-collapse:  collapse; table-layout: fixed; }
.detail td{padding:8px;border-top:3px solid #bbb;  word-break: break-all;vertical-align: text-top;}
.detail td + td {width:100px;}
.detail tr:last-child td { heigh: 300px; vertical-align: top;}
.cont {height: 500px;}
</style>


</head>


<body>

<jsp:include page="../common/header.jsp"></jsp:include>
<main class="detail">

<table>
	<tr>
		<td >${board.title}</td>
		<td>${board.regDate}</td>
	</tr>
	
	<tr>
		<td colspan="2">
		<p>-첨부파일-</p>
		<c:forEach items="${board.attachs }" var="attach">
		<p><a href="${pageContext.request.contextPath}/download?filename=${attach.path}/${attach.uuid}">${attach.origin}</a></p>
		</c:forEach>
		</td>
	</tr>
	
	<tr>
		<td class="cont" colspan="2">${board.content}</td>
	</tr>
	
	<tr>
		<td colspan="2"> <c:if test="${member.id eq board.id }"><a href="<%=request.getContextPath()%>/board/list"> <button id="delbtn">삭제</button></a> </c:if><c:if test="${member.id eq board.id}"><a href="boardUpdate?bno=${board.bno}"><button>수정</button></a></c:if><a href="<%=request.getContextPath()%>/board/list"><button>목록</button></a></td>
	</tr>
		

</table>

<c:if test="${not empty member }">

<div class="col-10 mx-auto ">
	<div class="form-group clearfix" >
			<p>${member.name}</p>
			<form  id="frmReplyWrite">
 	 	 	<input type="text" class="form-control" id="title" placeholder="댓글 제목을 입력하세요" name="title">
 	 	 	<textarea class="form-control my-1" placeholder="댓글을 입력하세요" name="content" id="content"></textarea>
 	 	 	<input type="hidden" name="bno" value="${board.bno}">
 	 	 	<input type="hidden" name="id" value="${member.id}">
 	 	 	<button class="btn btn-primary flaoat-right disabled" id="btnReplyWrite">등록</button>
 	 	 	</form>
 	</div>
</div>
</c:if>	


<div class="col-10 mx-auto reply-wrapper">

</div>
</main>
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
	var cp = "${pageContext.request.contextPath}";
	var bno = "${param.bno}";
	
	
$(function(){
		showList();
		
	function showList(){
		
		var url = cp + "/reply/list?bno="+ bno;
		
		
		$.getJSON(url).done(function(data){
		
			
		var str = "";	
		
		for(var i in data){
			str +=	'<div class="card mt-3 border-secondary" data-rno="'+ data[i].rno +'">'
			str +=		'<div class="card-header bg-dark text-light">'+data[i].id +': '+ data[i].title +'</div>'
			str +=		'<div class="card-body">'+ data[i].content +'</div>'
			str +=	'</div>'
			
		}	
		$(".reply-wrapper").html(str);
		
		})
	}
		// 이벤트 위임
		
		$(".reply-wrapper").on("click",".card",function(){
			var url = cp + "/reply?rno=" + $(this).data("rno");
			
			$.getJSON(url).done(function(data){
				console.log(data);
				console.log(data.title);
				console.log(data.content);
				console.log(data.id);
				
				$("#myModal")
					.data("rno",data.rno)
					
					.find(".modal-title").text(data.title)
					.end()
				$("#myModal").find(".modal-body").text(data.content)
					.end().modal("show");
				//$("#myModal").modal("show");
			
		});
	})
	
	//댓글 삭제
	$("#btnRm").click(function(){
		
		var rno = $(this).closest(".modal").data("rno");
		var url = cp + "/reply?rno=" + rno ;
		
	
		
		if(confirm("삭제하시겠습니까?")) {
			$.ajax(url, {
				method:"delete",
				success : function(data) {
					if(data/1) { //  가입 가능
						showList();
						
					} 
					else { // 가입 불가능
						alert("삭제권환이 없습니다.");
					}
				}
			});
		} else {
			return false;
		}
	});
		
// 댓글 유효성 

		$("#content").keyup(function() {
			var contentLen = $("#content").val().trim().length;
			
			if(contentLen) {
				$("#btnReplyWrite").removeClass("disabled");
			} 
			else {
				$("#btnReplyWrite").addClass("disabled");
			}
		});
		
		
		
	$("#title, #content").keyup(function () {
	var titleLen=$("#title").val().trim().length;
	var contentLen=	$("#content").val().trim().length;
	
	if(titleLen && contentLen){
		$("#btnReplyWrite").removeClass("disabled");
	}else{
		$("#btnReplyWrite").addClass("disabled");
	}
	})	
		
	$("#frmReplyWrite").submit(function(){
		event.preventDefault();
		
		if($(this).find(".btn").is(".disabled")) return;
		console.log($(this).serialize())
		
		var reply = {};
		
		reply.title = $(this.title).val();
		reply.content = $(this.content).val();
		reply.id = $(this.id).val();
		reply.bno = $(this.bno).val();
		
		var data = JSON.stringify(reply);
		
		
		var frm =this;
		
		var url = cp + "/reply"
		
		$.ajax(url,{
			method:"post",
			data: {"jsonData":data},
			success : function(data){
				showList();
			}
		})
	});
});	


//글 삭제
$("#delbtn").click(function(){
	
	
	var bno = ${board.bno}
	var url = cp + "/board/delete?bno="+bno ;
	
	$.ajax(url,{
		method:"delete",
		success:function(data) {
			//성공적으로 종료 
			
			
		}
	});
});
</script>

<!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
     
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        Modal body..
      </div>

      <!-- Modal footer -->
 	
      <div class="modal-footer">
        <button type="button" class="btn btn-danger"  id="btnRm">삭제</button>
      </div>
	
    </div>
  </div>
</div>



</body>
</html>