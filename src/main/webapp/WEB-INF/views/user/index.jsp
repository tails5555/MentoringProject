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
    <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index"><img src="${R}img/title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li class="active"><a href="index">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li ><a href="${R}user/notice/list?id=1">공지사항</a></li>
              <li><a href="${R}user/notice/list?id=2">참여마당</a></li>
            </ul>
        </li>
        <li >
          <a href="${R}user/intro">멘토링 사업소개</a>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li ><a href="menti_apli.html">멘티 신청</a></li>
              <li><a href="${R}user/mentoApplication">멘토 신청</a></li>
              <li ><a href="mento_list.html">멘토/멘티 목록</a></li>
              <li><a href="mento_board.html">멘토링 게시판</a></li>
              <li><a href="survey.html">설문조사</a></li>
            </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="mento_timetable.html">멘티 시간표 확인</a></li>
              <li><a href="report_write.html">보고서 작성</a></li>
              <li><a href="board_manage.html">멘토링 과제게시판 관리</a></li>
            </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="mento_open.html">멘토링 개설/폐쇄</a></li>
              <li><a href="report_confirm.html">보고서 확인</a></li>
              <li ><a href="survey_manage.html">설문조사 관리</a></li>
              <li><a href="candidate_boolean.html">멘토, 멘티 신청기간 여부</a></li>
              <li><a href="student_manage.html">회원 목록 관리</a></li>
              <li><a href="intro_update.html">사업 안내문 수정</a></li>
            </ul>
        </li>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
        <li><a href="logout_processing"><i class="glyphicon glyphicon-user"> 로그아웃</i></a></li>
      </ul>
    </div>
   </nav>
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
              	<td>${ notice.title }</td>
              	<td>${ notice.userName }</td>
              	<td><fmt:formatDate value="${notice.writeDate}" pattern="yy-MM-dd HH:mm"/></td>
              </tr>
              </c:forEach>
            </tbody>
          </table>
          <a class="btn btn-success" href="${R}user/notice/list?id=1" role="button" align="right"><i class="glyphicon glyphicon-zoom-in"> 자세히</i></a>
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
  <hr/>
  <div class="row">
    <div class="col-md-3" align="center">
      <img src="${R}img/skhuniv.jpg"/>
    </div>
    <div class="col-md-9">
      <p>08359 서울시 구로구 연동로 320 / 지하철 1, 7호선 온수역(성공회대입구역)</p>
      <p><i class="glyphicon glyphicon-earphone"></i> TEL : 02-2610-4114 &nbsp&nbsp|&nbsp&nbsp <i class="glyphicon glyphicon-print"></i> FAX : 02-2683-8858</p>
    </div>
  </div>
 </body>
</html>
