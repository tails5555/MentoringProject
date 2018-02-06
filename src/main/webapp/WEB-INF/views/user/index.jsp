<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${R}css/reset.css">
  	<link rel="stylesheet" type="text/css" href="${R}css/jquery-responsiveGallery.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
      p.animate{
        font-size : 20px;
        color : #FFFFFF;
        font-style:italic;
        font-weight: bold;
        animation-duration : 2s;
        animation-name : slidein;
      }
      @keyframes slidein {
        from {
          margin-left: 100%;
          width: 300%
        }

        to {
          margin-left: 0%;
          width: 100%;
        }
      }
      div.row{
        padding-top : 10px;
      }
      .info{
        padding-bottom : 10px;
        border-radius : 15px;
        background-color : #E0F8E6;
      }
      .w-gallery{
  			margin-top: 30px;
        margin-bottom : 40px;
  		}
   </style>
   <script type="text/javascript" src="${R}lib/modernizr.custom.js"></script>
 	<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
 	<script type="text/javascript" src="${R}src/jquery.responsiveGallery.js"></script>
 	<script type="text/javascript">
 		$(function () {
 			$('.responsiveGallery-wrapper').responsiveGallery({
 				animatDuration: 400,
 				$btn_prev: $('.responsiveGallery-btn_prev'),
 				$btn_next: $('.responsiveGallery-btn_next')
 			});
 		});
 	</script>
 </head>

 <body>
    <%@ include file="/WEB-INF/views/include/menu_for_user.jsp" %>
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
  	<!--페이지-->
  	<ol class="carousel-indicators">
  		<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
  		<li data-target="#myCarousel" data-slide-to="1"></li>
  	</ol>
  	<!--페이지-->
  	<div class="carousel-inner">
  		<div class="item active">
  			<img src="${R}img/slideimg01.jpg" style="width:100%" alt="First slide">
  			<div class="container">
  				<div class="carousel-caption">
  					<p class="animate">작은 마음이 하나 되어</p>
  					<p class="animate">성공회대 Mentoring에 오신 것을 환영합니다.</p>
  				</div>
  			</div>
  		</div>
  		<div class="item">
  			<img src="${R}img/slideimg02.jpg" style="width:100%" data-src="" alt="Second slide">
  			<div class="container">
  				<div class="carousel-caption">
  					<p class="animate">함께 공유하는 Mentoring</p>
  					<p class="animate">성공회대 Mentoring으로 시작해보세요.</p>
  				</div>
  			</div>
  		</div>
  	</div>
  	<a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
  	<a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
  </div>
  <div class="container">
    <div class="row justify-content-around">
        <div class="col-md-5 info">
          <table class="table">
            <thead>
              <tr>
                <td colspan="2"><i class="glyphicon glyphicon-blackboard"> 공지사항</i></td>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="notice" items="${ notices }">
              <tr>
              	<td>
              	<a href="${R}user/notice/view.do?bd=1&id=${notice.id}">
              		<c:choose>
              			<c:when test="${ notice.title.length() gt 18 }">${ notice.title.substring(0, 18) }...</c:when>
              			<c:otherwise>${ notice.title }</c:otherwise>
              		</c:choose>
              	</a>
              	</td>
              	<td>${ notice.userName }</td>
              	<td><fmt:formatDate value="${notice.writeDate}" pattern="yy-MM-dd HH:mm"/></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          <a class="btn btn-success" href="${R}user/notice/list?bd=1" role="button" align="right"><i class="glyphicon glyphicon-zoom-in"> 자세히</i></a>
        </div>
        <div class="col-md-2">
        </div>
        <div class="col-md-5 info">
          <table class="table">
            <thead>
              <tr>
                <td colspan="2"><i class="glyphicon glyphicon-calendar"> 일정안내</i></td>
              </tr>
            </thead>
            <tbody>
              <c:forEach var="schedule" items="${schedules}">
	              <tr>
	            	<td>${ schedule.startDate }</td>
	            	<td>~</td>
	            	<td>${ schedule.endDate }</td>
	            	<td>${ schedule.context }</td>
	              </tr>
              </c:forEach>
              <tr>
                <td colspan="4" align="center">기본적으로 12회 멘토링, 24시간 이수해야 함.<br/><small>(여건이 안 된다면 24시간 누적으로 횟수를 결정해도 상관 없음.)</small></td>
              </tr>
            </tbody>
          </table>
        </div>
    </div>
  </div>
  <hr/>
  <div class="w-gallery">
    <section id="responsiveGallery-container" class="responsiveGallery-container">
     <a class="responsiveGallery-btn responsiveGallery-btn_prev" href="javascript:void(0);"></a>
     <a class="responsiveGallery-btn responsiveGallery-btn_next" href="javascript:void(0);"></a>
      <ul class="responsiveGallery-wrapper">
        <li class="responsiveGallery-item"> <a href="http://www.skhu.ac.kr" class="responsivGallery-link" target="_blank"><img src="${R}assets/pics/0.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
          <div class="w-responsivGallery-info">
            <h2 class="responsivGallery-name">학교 홈페이지</h2>
            <h3 class="responsivGallery-position">www.skhu.ac.kr</h3>
          </div>
        </li>
        <li class="responsiveGallery-item"> <a href="https://report.skhu.net" class="responsivGallery-link" target="_blank"><img src="${R}assets/pics/1.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
          <div class="w-responsivGallery-info">
            <h2 class="responsivGallery-name">과제 제출</h2>
            <h3 class="responsivGallery-position">report.skhu.net</h3>
          </div>
        </li>
        <li class="responsiveGallery-item"> <a href="https://onedrive.live.com/?authkey=%21ABTEmxiOSgU9qh0&id=C704E2ECDA408483%2111104&cid=C704E2ECDA408483" class="responsivGallery-link" target="_blank"><img src="${R}assets/pics/2.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
          <div class="w-responsivGallery-info">
            <h2 class="responsivGallery-name">참조 자료</h2>
            <h3 class="responsivGallery-position">onedrive.live.com</h3>
          </div>
        </li>
        <li class="responsiveGallery-item"> <a href="https://forest.skhu.ac.kr" class="responsivGallery-link" target="_blank"><img src="${R}assets/pics/3.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
          <div class="w-responsivGallery-info">
            <h2 class="responsivGallery-name">학사 정보</h2>
            <h3 class="responsivGallery-position">forest.skhu.ac.kr</h3>
          </div>
        </li>
  			<li class="responsiveGallery-item"> <a href="https://ecareer.skhu.ac.kr" class="responsivGallery-link" target="_blank"><img src="${R}assets/pics/4.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
          <div class="w-responsivGallery-info">
            <h2 class="responsivGallery-name">E-Career</h2>
            <h3 class="responsivGallery-position">ecareer.skhu.ac.kr</h3>
          </div>
        </li>
  			<li class="responsiveGallery-item"> <a href="https://library.skhu.ac.kr/index.ax" class="responsivGallery-link" target="_blank"><img src="${R}assets/pics/5.png" height="320" width="320" alt="" class="responsivGallery-pic"></a>
          <div class="w-responsivGallery-info">
            <h2 class="responsivGallery-name">중앙도서관</h2>
            <h3 class="responsivGallery-position">library.skhu.ac.kr</h3>
          </div>
        </li>
      </ul>
    </section>
  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
