<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
 <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Custom styles for this template -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
    <style>
      .navbar {
        background-color: #ffffff;
      }
      .navbar .navbar-brand {
        color: #9aadb2;
      }
      .navbar .navbar-brand:hover,
      .navbar .navbar-brand:focus {
        color: #090909;
      }
      .navbar .navbar-text {
        color: #9aadb2;
      }
      .navbar .navbar-nav .nav-link {
        color: #9aadb2;
        border-radius: .25rem;
        margin: 0 0.25em;
      }
      .navbar .navbar-nav .nav-link:not(.disabled):hover,
      .navbar .navbar-nav .nav-link:not(.disabled):focus {
        color: #090909;
      }
      .navbar .navbar-nav .nav-item.active .nav-link,
      .navbar .navbar-nav .nav-item.active .nav-link:hover,
      .navbar .navbar-nav .nav-item.active .nav-link:focus,
      .navbar .navbar-nav .nav-item.show .nav-link,
      .navbar .navbar-nav .nav-item.show .nav-link:hover,
      .navbar .navbar-nav .nav-item.show .nav-link:focus {
        color: #090909;
        background-color: #a2a39f;
      }
      .navbar .navbar-toggle {
        border-color: #a2a39f;
      }
      .navbar .navbar-toggle:hover,
      .navbar .navbar-toggle:focus {
        background-color: #a2a39f;
      }
      .navbar .navbar-toggle .navbar-toggler-icon {
        color: #9aadb2;
      }
      .navbar .navbar-collapse,
      .navbar .navbar-form {
        border-color: #9aadb2;
      }
      .navbar .navbar-link {
        color: #9aadb2;
      }
      .navbar .navbar-link:hover {
        color: #090909;
      }

      @media (max-width: 575px) {
        .navbar-expand-sm .navbar-nav .show .dropdown-menu .dropdown-item {
          color: #9aadb2;
        }
        .navbar-expand-sm .navbar-nav .show .dropdown-menu .dropdown-item:hover,
        .navbar-expand-sm .navbar-nav .show .dropdown-menu .dropdown-item:focus {
          color: #090909;
        }
        .navbar-expand-sm .navbar-nav .show .dropdown-menu .dropdown-item.active {
          color: #090909;
          background-color: #a2a39f;
        }
      }

      @media (max-width: 767px) {
        .navbar-expand-md .navbar-nav .show .dropdown-menu .dropdown-item {
          color: #9aadb2;
        }
        .navbar-expand-md .navbar-nav .show .dropdown-menu .dropdown-item:hover,
        .navbar-expand-md .navbar-nav .show .dropdown-menu .dropdown-item:focus {
          color: #090909;
        }
        .navbar-expand-md .navbar-nav .show .dropdown-menu .dropdown-item.active {
          color: #090909;
          background-color: #a2a39f;
        }
      }

      @media (max-width: 991px) {
        .navbar-expand-lg .navbar-nav .show .dropdown-menu .dropdown-item {
          color: #9aadb2;
        }
        .navbar-expand-lg .navbar-nav .show .dropdown-menu .dropdown-item:hover,
        .navbar-expand-lg .navbar-nav .show .dropdown-menu .dropdown-item:focus {
          color: #090909;
        }
        .navbar-expand-lg .navbar-nav .show .dropdown-menu .dropdown-item.active {
          color: #090909;
          background-color: #a2a39f;
        }
      }

      @media (max-width: 1199px) {
        .navbar-expand-xl .navbar-nav .show .dropdown-menu .dropdown-item {
          color: #9aadb2;
        }
        .navbar-expand-xl .navbar-nav .show .dropdown-menu .dropdown-item:hover,
        .navbar-expand-xl .navbar-nav .show .dropdown-menu .dropdown-item:focus {
          color: #090909;
        }
        .navbar-expand-xl .navbar-nav .show .dropdown-menu .dropdown-item.active {
          color: #090909;
          background-color: #a2a39f;
        }
      }

      .navbar-expand .navbar-nav .show .dropdown-menu .dropdown-item {
        color: #9aadb2;
      }
      .navbar-expand .navbar-nav .show .dropdown-menu .dropdown-item:hover,
      .navbar-expand .navbar-nav .show .dropdown-menu .dropdown-item:focus {
        color: #090909;
      }
      .navbar-expand .navbar-nav .show .dropdown-menu .dropdown-item.active {
        color: #090909;
        background-color: #a2a39f;
      }

      div.row{
        margin-left : auto;
        margin-right : auto;
      }

      .container { margin-top: 30px;  }

      a:hover, a:visited, a:link, a:active {
        text-decoration: none;
      }

      .controls {
        margin-bottom: 10px;
      }

      .collapse-group {
        padding: 10px;
        border: 1px solid darkgrey;
        margin-bottom: 10px;
      }

      .panel-title .trigger:before {
        content: '\e082';
        font-family: 'Glyphicons Halflings';
        vertical-align: text-bottom;
      }

      .panel-title .trigger.collapsed:before {
        content: '\e081';
      }
      .calendar{
        border : 1px solid #81F7F3;
        border-radius : 15px;
        background-color : #E0F8F7;
      }
      .calendarImage{
        border-radius : 15px;
        margin-left : 20px;
        margin-right : 20px;
        margin-top : 20px;
        margin-bottom : 20px;
      }
      .table{
        width : 95%;
        text-align : center;
        margin-left : 20px;
        margin-right : 20px;
        margin-top : 20px;
        margin-bottom : 20px;
      }
   </style>
 </head>

 <body>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
      <sec:authorize access="not authenticated">
        <a class="navbar-brand" href="${R}guest/index"><img src="${R}img\title.png"/></a>
      </sec:authorize>
      <sec:authorize access="authenticated">
        <a class="navbar-brand" href="${R}user/index"><img src="${R}img\title.png"/></a>
      </sec:authorize>
      </div>
      <ul class="nav navbar-nav">
      	<sec:authorize access="not authenticated">
        <li><a href="${R}guest/index">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
      	</sec:authorize>
        <sec:authorize access="authenticated">
        <li><a href="${R}user/index">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        </sec:authorize>
        <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
            <sec:authorize access="not authenticated">
	        	<li><a href="${R}guest/notice/list?bd=1">공지사항</a></li>
	        	<li><a href="${R}guest/login">참여마당</a></li>
	      	</sec:authorize>
	        <sec:authorize access="authenticated">
	        	<li><a href="${R}user/notice/list?bd=1">공지사항</a></li>
	        	<li><a href="${R}user/notice/list?bd=2">참여마당</a></li>
	        </sec:authorize>
            </ul>
        </li>
        <li  class="active">
          <a href="intro">멘토링 사업소개</a>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <sec:authorize access="not authenticated">
		        <li><a href="login">멘티 신청</a></li>
		      </sec:authorize>
		      <sec:authorize access="authenticated">
		        <li><a href="${R}user/menti_apli">멘토 신청</a></li>
		      </sec:authorize>
              <sec:authorize access="not authenticated">
		        <li><a href="login">멘토 신청</a></li>
		      </sec:authorize>
		      <sec:authorize access="authenticated">
		        <li><a href="${R}user/mento_apli">멘토 신청</a></li>
		      </sec:authorize>
              <li ><a href="${R}user/mento_list">멘토/멘티 목록</a></li>
              <li><a href="${R}user/groupBBS">멘토링 게시판</a></li>
              <li><a href="survey.html">설문조사</a></li>
            </ul>
        </li>
        <sec:authorize access="authenticated">
	        <sec:authorize access="hasAnyRole('ROLE_MENTO', 'ROLE_STUDCHAIRMAN')">
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
	          <span class="caret"></span></a>
	            <ul class="dropdown-menu">
	              
	              <li><a href="${R}user/mento_timetable?timetableView=">멘티 시간표 확인</a></li>
	              <li><a href="${R}user/report/write">보고서 작성</a></li>
	              <li><a href="board_manage.html">멘토링 과제게시판 관리</a></li>
	            </ul>
	        </li>
	        </sec:authorize>
        </sec:authorize>
        <sec:authorize access="authenticated">
	        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
	          <span class="caret"></span></a>
	            <ul class="dropdown-menu">
	              <li><a href="${R}user/mento_open">멘토링 개설/폐쇄</a></li>
	              <li><a href="${R}user/report/confirm">보고서 확인</a></li>
	              <li ><a href="${R}user/survey">설문조사 관리</a></li>
	              <li><a href="${R}user/schedule">멘토, 멘티 신청기간 여부</a></li>
	              <li><a href="${R}user/list">회원 목록 관리</a></li>
	              <li><a href="${R}user/intro/titleList">사업 안내문 수정</a></li>
	            </ul>
	        </li>
	        </sec:authorize>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      <sec:authorize access="not authenticated">
        <li><a href="${R}guest/login"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
        <li><a href="${R}guest/create.do"><i class="glyphicon glyphicon-pencil"> 회원가입</i></a></li>
      </sec:authorize>
      <sec:authorize access="authenticated">
        <li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
        <li><a href="${R}user/Edit.do"><i class="glyphicon glyphicon-user"> 내정보</i></a></li>
        <li><a href="${R}user/logout_processing"><i class="glyphicon glyphicon-remove-sign"> 로그아웃</i></a></li>
      </sec:authorize>
      </ul>
    </div>
   </nav>
  <div>
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>
  <div class="container">

      <div class="row">
        <div class="col-md-12">
          <h1 class="my-4" style="font-size: 40px; font-weight:700; font-style: italic;"><strong>멘토링 사업소개</strong></h1>
          <div class="collapse-group">
            <div class="controls">
              <button class="btn btn-primary open-button" type="button">
                <i class="glyphicon glyphicon-fullscreen"> 모두펼치기</i>
              </button>
              <button class="btn btn-primary close-button" type="button">
                <i class="glyphicon glyphicon-resize-small"> 모두접기</i>
              </button>
            </div>
			<c:forEach var="title" items="${titles}">
	            <div class="panel panel-info">
	              <div class="panel-heading" role="tab" id="headingOne">
	                <h4 class="panel-title">
	                  <a role="button" data-toggle="collapse" href="#list${title.id}" aria-expanded="true" class="trigger collapsed">
	                    <strong>${title.title}</strong>
	                  </a>
	                </h4>
	              </div>
	              <div id="list${title.id}" class="panel-collapse collapse" role="tabpanel">
	                <div class="panel-body">
	                  <ul>
	                  	<c:forEach var="detail" items="${title.details}">
	                    	<li> ${detail.detail}</li>
	                    </c:forEach>
	                  </ul>
	                </div>
	              </div>
	            </div>
			</c:forEach>
          </div>
        </div>
      </div>
      <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
	      	<a href="${R}user/intro/titleList"><button class="btn btn-primary"><i class="glyphicon glyphicon-list-alt"></i> 소개문 편집하러 가기</button></a>
	  </sec:authorize>
      <hr/>
      <div class="row">
        <div class="col-md-12">
          <h1 class="my-4" style="font-size: 40px; font-weight:700; font-style: italic;"><strong>일정 안내</strong></h1>
        </div>
      </div>
      <div class="row calendar">
        <div class="col-md-4">
          <img src="${R}img\onenote01.png" class="img-responsive calendarImage" />
        </div>
        <div class="col-md-8">
          <table class="table" align="center">
          	<c:forEach var="schedule" items="${schedules}">
	          	<tr>
	              <td>${ schedule.startDate }</td>
	              <td>~</td>
	              <td>${ schedule.endDate }</td>
	              <td>${ schedule.context }</td>
	            </tr>
          	</c:forEach>
            <tr>
              <td colspan="4" align="left">
                <ul>
                  <li>기본적으로 12회 멘토링을 하는데 누적 24시간 이수해야 합니다.</li>
                  <li>여건이 안 된다면 횟수는 제한 없이 24시간 이수해도 상관 없습니다.</li>
                  <li>멘토링 인원은 5명이 기본이지만, 최소 3명부터 최대 10명까지 가능합니다.</li>
                  <li>멘토링 이수 시간이 24시간 초과되면 우수 멘토링 대상에서 제외되오니 일정 조정을 최대한 맞추시길 바라겠습니다.</li>
                </ul>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <script>
     $(".open-button").on("click", function() {
       $(this).closest('.collapse-group').find('.collapse').collapse('show');
     });

     $(".close-button").on("click", function() {
       $(this).closest('.collapse-group').find('.collapse').collapse('hide');
     });
    </script>
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
