<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
 <head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="${R}res/common.js"></script>
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
      .row {
        margin-left : auto;
        margin-right : auto;
      }

      .footer { border: 1px padding: 30px 10px; }
      .footer{ position: absolute; bottom: 0; text-align: center; width: 100% }
      .footer img { margin-right: 20px;  }
      .footer div:nth-child(2) { font: normal 9pt 굴림; color: #666;  }
      .footer div:nth-child(3) { font: normal 9pt arial; color: #aaa; }

      .container {
        margin-top: 30px;
        margin-left : auto;
        margin-right : auto;
      }
      .information{
        padding-top : 10px;
        padding-bottom : 5px;
        background-color : #E6E6E6;
        border : 1px solid #D8D8D8;
        border-radius : 5px;
        text-align : left;
      }
      .introEntity{
        padding-left : 5px;
        padding-right : 5px;
        padding-top : 5px;
        padding-bottom : 5px;
        border : 1px solid #A4A4A4;
        background-color : #D8D8D8;
        font-weight : bold;
        text-align : center;
      }
      .introValue{
        padding-left : 5px;
        padding-right : 5px;
        padding-top : 5px;
        padding-bottom : 5px;
        border : 1px solid #A4A4A4;
        text-align : center;
      }
   </style>
 </head>

 <body>
   <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="${R}user/index"><img src="${R}img/title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="${R}user/index">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li ><a href="${R}user/notice/list?bd=1">공지사항</a></li>
              <li><a href="${R}user/notice/list?bd=2">참여마당</a></li>
            </ul>
        </li>
        <li >
          <a href="${R}user/intro">멘토링 사업소개</a>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="${R}user/menti_apli">멘티 신청</a></li>
              <li><a href="${R}user/mento_apli">멘토 신청</a></li>
              <li ><a href="${R}user/mento_list">멘토/멘티 목록</a></li>
              <li><a href="${R}user/groupBBS">멘토링 게시판</a></li>
              <li><a href="${R}user/mentoringSurvey">설문조사</a></li>
            </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_MENTO', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              
              <li><a href="${R}user/mento_timetable?timetableView=">멘티 시간표 확인</a></li>
              <li><a href="${R}user/report/write">보고서 작성</a></li>
              <li><a href="${R}user/board_manage">멘토링 과제게시판 관리</a></li>
            </ul>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="${R}user/mento_open">멘토링 개설/폐쇄</a></li>
              <li><a href="${R}user/report/confirm">보고서 확인</a></li>
              <li><a href="${R}user/survey">설문조사 관리</a></li>
              <li><a href="${R}user/schedule">멘토, 멘티 신청기간 여부</a></li>
              <li><a href="${R}user/list">회원 목록 관리</a></li>
              <li class="active"><a href="${R}user/intro/titleList">사업 안내문 수정</a></li>
            </ul>
        </li>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
      	<li><a href="${R}user/Edit.do"><i class="glyphicon glyphicon-user"> 내정보</i></a></li>
        <li><a href="${R}user/logout_processing"><i class="glyphicon glyphicon-remove-sign"> 로그아웃</i></a></li>
      </ul>
    </div>
   </nav>
   <div>
       <img src="${R}img/topimage.jpg" class="img-responsive"/>
   </div>
   <div class="container">

      <div class="row">

        <div class="col-md-3">
          <h1 class="my-4"><strong>사이트 관리</strong></h1>
          <div class="list-group">
            <a href="${R}user/mento_open" class="list-group-item ">멘토링 개설/폐쇄</a>
            <a href="${R}user/report/confirm" class="list-group-item ">보고서 확인</a>
            <a href="${R}user/survey" class="list-group-item ">설문조사 관리</a>
            <a href="${R}user/schedule" class="list-group-item ">멘토, 멘티 신청기간 여부</a>
            <a href="${R}user/list" class="list-group-item ">회원 목록 관리</a>
            <a href="${R}user/intro/titleList" class="list-group-item active">사업 안내문 수정</a>
          </div>
        </div>
	        <div class="col-md-9">
	          <h1 class="my-4"><strong>사업 세부문 수정</strong></h1>
	          <!-- Team Members Row -->
	          <div class="row">
	            <div class="col-md-12">
	              <h2>세부글 확인하기</h2>
	              <hr/>
	              <div class="row">
	                <div class="col-md-3 introEntity">
	                  	제목
	                </div>
	                <div class="col-md-9 introValue">
	                  	${ title.title }
	                </div>
	              </div>
	                <hr/>
	                <table class="table table-bordered">
	                  <thead class="introEntity">
	                  <tr>
	                    <td width="50px">번호</td>
	                    <td>세부 글</td>
	                    <td>최종 편집자</td>
	                    <td>편집하기</td>
	                  </tr>
	                  </thead>
	                  <tbody class="introValue">
	                  <c:forEach var="detail" items="${ details }">
	                    <tr>
	                      <td>${ detail.id }</td>
	                      <td>${ detail.detail }</td>
	                      <td>${ detail.adminName }</td>
	                      <td>
	                        <a href="detailUpdate?id=${ title.id }&dId=${detail.id}"><button class="btn btn-success" type="button"><i class="glyphicon glyphicon-pencil"> 편집/삭제</i></button></a>
	                      </td>
	                    </tr>
	                  </c:forEach>
	                  </tbody>
	                </table>
	                <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#titleEdit"><i class="glyphicon glyphicon-pencil"></i> 제목 편집/삭제</button>
	                <a href="detailCreate?id=${title.id }"><button class="btn btn-success" type="button"><i class="glyphicon glyphicon-plus"> 세부문 추가</i></button></a>
	                <a href="titleList"><button class="btn btn-info"><i class="glyphicon glyphicon-align-justify"></i>제목 목록으로</button></a>
          		</div>
          	</div>
          	
          	<div id="titleEdit" class="collapse">
          		<hr/>
	              <h3>제목 편집하기</h3>
	              <form:form method="post" modelAttribute="title">
	              	<form:input path="title" class="form-control w300" placeholder="제목을 입력해주세요."/>
	              	<br/>
		              	<button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-pencil"></i> 수정하기</i></button>
		              	<a href="titleDelete.do?id=${ title.id }" class="btn btn-danger" data-confirm-delete><i class="glyphicon glyphicon-trash"></i> 삭제하기</a>
		                <button class="btn btn-info" type="button" data-toggle="collapse" data-target="#titleEdit"><i class="glyphicon glyphicon-remove"> 취소</i></button>
	              	</form:form>              
            		</div>
	    		</div>
	  		</div>
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
