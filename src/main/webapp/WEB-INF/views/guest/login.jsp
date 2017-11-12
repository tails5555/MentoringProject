<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		.login{
			background-repeat: no-repeat;
		 	background-position: center;
		 	background-size: 600px 330px;
		 	margin-top: 10px;
		 	background-image: url("/img/login.png")
		}
		div.row{
        padding-top : 100px;

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
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="mento_timetable.html">멘티 시간표 확인</a></li>
              <li><a href="report_write.html">보고서 작성</a></li>
              <li><a href="board_manage.html">멘토링 과제게시판 관리</a></li>
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
  	<div class="login">
  	<br>
	<h1><center>Login</center></h1>
	<h5><center>로그인을 하셔야 사용하실 수 있는 서비스 입니다.</center></h5>

	<hr style="border: solid 1px" align="center" width="400px" />
	
	<form method="post" action="login_processing">
		<div align="center" style="margin-bottom : 10px">
			<input type="text" name="loginId" placeholder="아이디 입력" style="width:350px; padding:5px; margin-bottom:5px" />
		</div>
		<div align="center">
			<input type="password" name="passwd" placeholder="비밀번호 입력" style="width:350px; padding:5px;margin-bottom:5px" />
		</div>
		<div align="center">
			<button type="submit" class="btn btn-primary" style="width: 350px; padding:5px" >
			<span class="glyphicon glyphicon-ok"></span>로그인</button>
		</div>
	</form>
	<hr style="border: solid 1px" align="center" width="400px" />
	<div align="center" style="">
	    <a href="search_password.html">비밀번호 찾기</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="create.do">회원가입</a>
	</div>
	<c:if test="${param.error !=null }">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<div class="panel panel-warning">
				<div class="panel-heading">
		    		<h3 class="panel-title">로그인에 실패하였습니다.</h3>
		  		</div>
			  	<div class="panel-body">
			    	학번, 교직원 번호와 비밀번호를 다시 확인해주시기 바랍니다. 초기 비밀번호는 a+휴대폰 뒷자리 4개입니다.
			  	</div>
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
	</c:if>
   </div>

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
