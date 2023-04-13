<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>송스시&참치</title>
    <link rel="stylesheet" href="css/style.css">
    
   <jsp:include page="head.jsp"></jsp:include>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	
      
  
   <section >
      
        <h3 class="hide">1</h3>
        
      
        <c:choose>
        	<c:when test="${empty member}">
        		<form action="login">
      				 <a href="#"><button type="submit">로그인</button></a>
      			 </form>
       
       <ul>
           <li><a style="margin-left: 35px;" href="join">회원가입</a></li>
       </ul>
        	</c:when>
        	
        	
   
        	<c:otherwise>
     <ul class="loginok">
      		<li><p>${member.name}님<br> 환영합니다.</p></li>
     	<br>
           <li><a href="usermodify">정보수정/</a></li>
           <li><a href="logout">로그아웃</a></li>
     </ul>
        	</c:otherwise>
        	
        </c:choose>
        
     <script type="text/javascript">
    	$(function(){
    		$(".slider").bxSlider({
    		 mode:'fade',
    		 pager:false,
    		 controls:false,
    		 auto:true
    			
    		});
    	});
     </script>   
        
    		
       <article class="art1">
       <div style="max-width: 80%">
      	 <div class="slider" >
        	<img src="${pageContext.request.contextPath}/images/메인배경.jpg" alt="참다랑어">
        	<img src="${pageContext.request.contextPath}/images/시설1.jpg" alt="참다랑어">
       	 	<img src="${pageContext.request.contextPath}/images/시설2.jpg" alt="참다랑어">
      	 </div>
       		 <h3>참치&스시 전문점</h3>
        	<p>청정 바다와 자연이 허락하는 최상의 식재료와
            	셰프의 섬세하고 정교한 터치가 더해진
            	<br>정통 일식을 선보입니다. <br> 양심을 걸고 매일 신선하고 위생적인
            	재료로 청결관리에 신경쓰고 있습니다. <br> 전문셰프의 조리 과정을 
            	직접 눈으로 볼 수 있는 곳, <br>
            	정성을 다해 맛 좋고 건강한 음식을 제공합니다.
        	</p>
      	</div>
      	
       </article>
       
		<!--  
		<c:forEach items="${list }" var = "b">
		  <div>
		  	<h4 class = "text- truncate small"></h4>
		  </div>
		</c:forEach>
       -->
     
       
       
       <article class="art2">
           <h3>인기메뉴 Top4</h3> 
          <table>
              <tr>
                  <td><img src="${pageContext.request.contextPath}/images/참치top1.jpg" alt="top1"></td>
                  <td class="info"><h4 class="menu">참치 오도로</h4>참치의 대뱃살로 입속으로 입장하자마자 살살 녹으며 부드러움과 동시에 굉장한 고소함을 뿜어내어 참치 중에서도 그 인기가 상당하다. 화려한 마블링이 이 부위의 특징. 대뱃살 경우 와인이랑 즐겨 마셔도 좋다.</td>
                  <td><img src="${pageContext.request.contextPath}/images/초밥세트.jpg" alt="top2"></td>
                  <td class="info"><h4>2인 더블세트<br>(회덮밥,우동,스시14pcs,튀김)</h4>가족이나 커플끼리 와서 합리적인 가격에 푸짐함을 느끼세요. 연어초밥 광어초밥 날치알 군합과 우동 회덮밥 새우튀김으로 구성되어 있습니다. </td>
              </tr>
              <tr>
                  <td><img  src="${pageContext.request.contextPath}/images/참치top3.jpg" alt="top3"></td>
                  <td class="info"><h4>참치 주도로</h4>참치의 중뱃살로 대뱃살보다 지방량이 적어 고소함은 덜하지만 느끼한 걸 좋아하지 않는 사람에겐 최적의 부위다. 대뱃살만큼 부드럽지만 더욱 깔끔한 맛에 담백하기로 유명하다.</td>
                  <td><img  src="${pageContext.request.contextPath}/images/참치top4.jpg" alt="top4"></td>
                  <td class="info"><h4>참치 아카미</h4>참치의 속살(적신)로 선명한 붉은색을 띠며 누구나 참치를 즐길 수 있는 대중적인 부위입니다. 기름기가 없고 살이 연하여 질감이 살아있는 담백한 맛이 특징입니다.</td>
              </tr>
          </table>
          
       </article>

       <article class="art3">
           <h3>매장 소개</h3>
           <img src="${pageContext.request.contextPath}/images/장인.webp" alt="장인">
           <div>
               <h4>45년 경력의<br>정교한 터치</h4>
               <p>전문셰프와 참다랑어가 졍교한 터치를 만나 입에서 헤엄치는 듯한 식감과
                신선함을 선물합니다.  
                </p>
           </div>

           <img src="${pageContext.request.contextPath}/images/참치.webp" alt="참치">
           <div class="textlef">
            <h4>신선한 식재료</h4>
            <p>매일같이 강태공의 세월을 갈아 넣은 식재료를 선택하여 
               아이들도 안전하게 믿고 먹을 수 있는 음식 식재료의 자부심
                    
            </p>
        </div>
           <img src="${pageContext.request.contextPath}/images/위치.png" alt="시설2">
           <div>
            <h4>매장 위치</h4>
            <p>서울특별시 구로구 <br>
                연동로11길 30 
                <br><br>
                Open <br>11:30 - 22:00 <br><br>
                Break Time <br>
                15:00 - 17:00 <br><br>
                02-2615-3737<br><br>
                포장/배달 주문 가능
                
        </div>
          
       </article>
   </section>
   

     

<jsp:include page="footer.jsp"></jsp:include>
 </body>
 


</html>