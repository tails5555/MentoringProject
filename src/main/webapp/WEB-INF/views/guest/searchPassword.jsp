<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="R" value="/" />
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<style>

		
			.search{
			background-image: url("/SKHUMentoring/img/search_password.png");
			background-repeat: no-repeat;
		 	background-position: center;
		 	background-size: 600px 430px;
		 	margin-top: 20px;
			margin-bottom:10px;
		}
	</style>
</head>
<body>
  <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="${R}"><img src="${R}img/title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="${R}">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="${R}guest/notice/list?bd=1">공지사항</a></li>
              <li><a href="${R}guest/login">건의사항</a></li>
            </ul>
        </li>
        <li>
          <a href="${R}guest/intro">멘토링 사업소개</a>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li ><a href="${R}guest/login">멘티 신청</a></li>
              <li><a href="${R}guest/login">멘토 신청</a></li>
              <li ><a href="${R}guest/login">멘토/멘티 목록</a></li>
              <li><a href="${R}guest/login">멘토링 게시판</a></li>
              <li><a href="${R}guest/login">설문조사</a></li>
            </ul>
        </li>
        <sec:authorize access="authenticated">
	        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
	        <li class="dropdown">
	          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
	          <span class="caret"></span></a>
	            <ul class="dropdown-menu">
	              <li><a href="${R}user/mento_open">멘토링 개설/폐쇄</a></li>
	              <li><a href="report_confirm.html">보고서 확인</a></li>
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
        <li class="active"><a href="${R}guest/login"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
        <li><a href="${R}guest/create.do"><i class="glyphicon glyphicon-pencil"> 회원가입</i></a></li>
      </ul>
    </div>
   </nav>
  <div >
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>

  	<div class="search">
  	<br>
	<h1><center>비밀번호 초기화 서비스</center></h1>
	<h5><center>이메일을 통해 초기화된 비밀번호를 보내드립니다.</center></h5>

	<hr style="border: solid 1px" align="center" width="400" />

	  <form:form method="post" modelAttribute="user">  
		<div align="center" margin-bottom:10px;>
			<form:input type="text" path="number" placeholder="아이디 입력(교번/학번)" style="width:350px; padding:5px; margin-bottom:5px" />
		</div>
		<div align="center">
			<form:input type="email" path="email" placeholder="이메일 입력" style="width:350px; padding:5px;margin-bottom:5px" />
		</div>
		<div align="center">
			<button type="submit" class="btn btn-primary" style="width: 350px; padding:5px" >이메일 보내기</button>
		</div>


	<hr style="border: solid 1px" align="center" width="400" />
	<div align="center">
    	<p>-신규계정( 신/편입생 ) 초기 비밀번호는 a+휴대폰 뒷자리4개  ex> a5906</p>
        <p>-아이디( 교번/학번 ) , 이메일을 입력한 후 등록되어 있는 정보와 일치하면 <br>초기화된 비밀번호를 포함한 메일 발송</p>
		<p>-비밀번호는 "a+휴대폰 뒷자리 4개 " 로 초기화 됩니다.
		<br>
		<br>
	</div>
   </div>
   
	</form:form>

   <div class="row">
		 <hr/>
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
