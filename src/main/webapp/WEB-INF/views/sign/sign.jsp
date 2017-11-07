<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="R" value="/" />


<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
        rel="stylesheet" media="screen">
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="${R}res/common.js"></script>
  <link rel="stylesheet" href="${R}res/common.css">

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
			
			
			        .footer { border: 1px padding: 30px 10px; }
			      	.footer{ position: absolute; bottom: 0; text-align: center; width: 100% }
			        .footer img { margin-right: 20px;  }
			        .footer div:nth-child(2) { font: normal 9pt 굴림; color: #666;  }
			        .footer div:nth-child(3) { font: normal 9pt arial; color: #aaa; }
			
			
			        .container { margin-top: 30px; margin-left: 300px }
			        .application{ margin-top: 20px; }
			
			        label{
			          margin-right: 10px
			
			        }
			        .control-group{
			        		margin-top: 30px;
			        }


   </style>
   
</head>

 <body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index.html"><img src="${R}img\title.png"/></a>
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
              <li><a href="${R}guest/login">멘티 신청</a></li>
              <li><a href="${R}guest/login">멘토 신청</a></li>
              <li><a href="${R}guest/login">멘토/멘티 목록</a></li>
              <li><a href="${R}guest/login">멘토링 게시판</a></li>
              <li><a href="${R}guest/login">설문조사</a></li>
            </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="${R}guest/login">멘티 시간표 확인</a></li>
              <li><a href="${R}guest/login">보고서 작성</a></li>
              <li><a href="${R}guest/login">멘토링 과제게시판 관리</a></li>
            </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="${R}guest/login">멘토링 개설/폐쇄</a></li>
              <li><a href="${R}guest/login">보고서 확인</a></li>
              <li><a href="${R}guest/login">설문조사 관리</a></li>
              <li><a href="${R}guest/login">멘토, 멘티 신청기간 여부</a></li>
              <li><a href="${R}guest/login">회원 목록 관리</a></li>
              <li><a href="${R}guest/login">사업 안내문 수정</a></li>
            </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${R}guest/login"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
        <li class="active"><a href="${R}guest/create.do"><i class="glyphicon glyphicon-pencil"> 회원가입</i></a></li>
      </ul>
    </div>
   </nav>
  <div >
        <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>
<div class="container">


<form:form method="post" modelAttribute="user" class="form-inline">
        <!-- /.col-lg-3 -->

        <div class="col-md-9">

      <!-- Introduction Row -->
      <h1 class="my-4"><strong>회원 가입</strong></h1>

      <hr/>


      <!-- Team Members Row -->
      <div class="row">
        <div class="col-md-12">

      <div class="application">


          <form name="sentMessage" id="contactForm" novalidate>
          
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>이름: </label>
                <form:input path="userName" type="text" class="form-control" placeholder="이름" id="name"/>
                <p class="help-block text-danger"></p>
              </div>
            </div>

            <div class="control-group">
              <div class="form-group floating-label-form-group controls ">
                <label>학번: </label>
                <form:input path="studentNumber" type="text" class="form-control" placeholder="학번" id="studentNumber" />
                <p class="help-block text-danger"></p>
              </div>
            </div>


            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>비밀번호:  </label>
                <input  type="password" class="form-control" placeholder="비밀번호" id="password" >
                <p class="help-block text-danger"></p>
              </div>
            </div>

    		<div class="control-group ">
              <div class="form-group floating-label-form-group controls ">
                <label>비밀번호 확인:  </label>
                <form:input path="password" type="password" class="form-control" placeholder="비밀번호" id="password2" />
                <p class="help-block text-danger"></p>
              </div>
            </div>

            <div class="form-group" style="margin-top: 20px" >
   			 <label>학과</label>
   			      <form:select path="departmentId" class="form-control w200"
                   itemValue="deptId" itemLabel="name" items="${ departments }" />

  			</div>
            <br/>
            <br/>
            
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>이메일:  </label>
                <form:input path="email" type="email" class="form-control" placeholder="이메일" id="email" />
                <p class="help-block text-danger"></p>
              </div>
            </div>


            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>주소:  </label>
                <form:input path="address" type="text" class="form-control" placeholder="주소" id="address" />
                <p class="help-block text-danger"></p>
              </div>
            </div>

            <div>
			<label>핸드폰:  </label>
            <input type="text" name="phone1" size="5">
            -
            <input type="text" name="phone2" size="5">
            -
            <input type="text" name="phone3" size="5">
            <span class="help-block text-danger"></span>
			</div>

             <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label style="vertical-align: top;">사진등록:  </label>
                 <a href="#"><img class="rounded-circle img-fluid d-block mx-auto" src="http://placehold.it/200x200" alt=""></a>
                <p class="help-block text-danger"></p>
                <input type="file" name="photo"/>
              </div>
            </div>

            <br/>





                    <div class="control-group">
                      <div class="form-group floating-label-form-group controls" >
                      <label style="vertical-align: top;">인사말:  </label>
                        <textarea rows="2" cols="100"  class="form-control" placeholder="소개" id="message"></textarea>
                        <p class="help-block text-danger"></p>
                      </div>
                    </div>

       <hr>






      <div style="margin-top: 40px">
        <p><h3>회원가입을 신청하시려면 밑에 신청 버튼을 눌러 주세요.</h3></p>

      <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-ok"> 신청</i></button>
      <a href="${R}guest/index"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"> 취소</i></button></a>
      </div>

        </div>
      </div>
   </form:form>
  
    <!-- /.container -->
    </div>


  </div>

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
