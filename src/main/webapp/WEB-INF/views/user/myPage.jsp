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
  
  
  <script type="text/javascript">

	$(document).ready(function() {
		
		 $('input:checkbox[name="monCheck"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });

		 $('input:checkbox[name="tueCheck"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });
		 $('input:checkbox[name="wedCheck"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });
		 $('input:checkbox[name="thuCheck"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });
		 $('input:checkbox[name="friCheck"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });

		 
		 
	});
	


</script>

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
        td.entity{
          background-color : #E0F8F1;
          padding-left : 8px;
          padding-right : 8px;
          padding-top : 8px;
          padding-bottom : 8px;
          text-align : center;
        }
        td.context{
          padding-left : 8px;
          padding-right : 8px;
          padding-top : 8px;
          padding-bottom : 8px;
          text-align : left;
        }
        .impossible{
          border : 1px solid #01DF3A;
          border-radius : 10px;
          text-align : center
        }
        .available{
          background-color : #81F79F;
          border : 1px solid #01DF3A;
          border-radius : 10px;
          text-align : center;
        }
        .information{
          padding-top : 15px;
          padding-bottom : 5px;
          background-color : #E6E6E6;
          border : 1px solid #D8D8D8;
          border-radius : 5px;
          text-align : left;
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
           <li ><a href="${R}user/notice/list?bd=1">공지사항</a></li>
              <li><a href="${R}user/notice/list?bd=2">참여마당</a></li>
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
                 <li><a href="${R}user/mento_apli">멘토 신청</a></li>
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
     	<li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
      	<li class="active" ><a href="${R}user/myPage"><i class="glyphicon glyphicon-user"> 내정보</i></a></li>
        <li><a href="logout_processing"><i class="glyphicon glyphicon-remove-sign"> 로그아웃</i></a></li>
      </ul>
    </div>
   </nav>
  <div >
        <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>
<div class="container">


<!-- /.col-lg-3 -->

        <div class="col-md-9">

      <!-- Introduction Row -->
      <h1 class="my-4"><strong>My Page</strong></h1>

      <hr/>
      <div class="row">
        <div class="col-md-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="http://placehold.it/200x200" alt="">
          <h3>${ my.userName }
            <small>${ my.departmentName }</small>
          </h3>
          <p>잘 부탁 드려요~</p>
        </div>
        <div class="col-md-8">
          <table class="table-bordered" width="100%">
            <tr>
              <td class="entity">학번(교번, 직번)</td>
              <td colspan="2" class="context">${ my.number }</td>
            </tr>
            <tr>
              <td class="entity">이름</td>
              <td colspan="2" class="context">${ my.userName }</td>
            </tr>
             <tr>
              <td class="entity">학과</td>
              <td colspan="2" class="context">${ my.departmentName }</td>
            </tr>
            <tr>
              <td class="entity">전화번호</td>
              <td colspan="2" class="context">${ my.phoneNumber}</td>
            </tr>
            <tr>
              <td class="entity">이메일</td>
              <td colspan="2" class="context">${ my.email }</td>
            </tr>
            <tr>
              <td class="entity">회원 유형</td>
              <td colspan="2" class="context">${my.userType}</td>
            </tr>
        
          </table>
        </div>
      </div>
      <hr/>
      <!-- Team Members Row -->
      <div class="row">
        <div class="col-md-12">
        
        
 <form:form method="post" modelAttribute="user" class="form-inline" id="my-form">       
        
    <form class="form-inline">
      <div class="application">
        <h1 class="my-4"><strong>회원 정보 수정</strong></h1>
        <hr/>
          <form name="sentMessage" id="contactForm" novalidate>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>이름: </label>
                <form:input path="userName" type="text" class="form-control" value="${ my.userName }" id="name" required="required" />
                <p class="help-block text-danger"></p>
              </div>
            </div>

            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>학번: </label>
                <form:input path="number" type="text" class="form-control" value="${ my.number }" id="studentNumber" required="required" />
                <p class="help-block text-danger"></p>
              </div>
            </div>
            
            
   			<div class="form-group"  >
   			 <label>학과</label>
   			      <form:select path="departmentId" class="form-control w200"
                   itemValue="deptId" itemLabel="name" items="${ departments }" />

  			</div>
     
            <br/>
            <br/>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>이메일:  </label>
                <form:input path="email" type="email" class="form-control" value="${ my.email }" id="email" />
                <p class="help-block text-danger"></p>
              </div>
            </div>


            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>주소:  </label>
                <form:input path="address" type="text" class="form-control" value="${ my.address}" id="address" />
                <p class="help-block text-danger"></p>
              </div>
            </div>

			

            <div>
			<label>핸드폰:  </label>
            <form:input path="phone1" type="text" id="phone1" value="${my.phone1}" size="5" required="required"/>
            -
            <form:input path="phone2" type="text" id="phone2" value="${my.phone2}" size="5" required="required"/>
            -
            <form:input path="phone3" type="text" id="phone3" value="${my.phone3}" size="5" required="required"/>
            <span class="help-block text-danger"></span>
			</div>


             <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label style="vertical-align: top;">사진등록/변경:  </label>
                 <a href="#"><img class="rounded-circle img-fluid d-block mx-auto" src="http://placehold.it/200x200" alt=""></a>
                <p class="help-block text-danger"></p>
              </div>
            </div>

            <br/>





                    <div class="control-group">
                      <div class="form-group floating-label-form-group controls" >
                      <label style="vertical-align: top;">인사말:  </label>
                        <textarea rows="2" cols="100"  class="form-control" id="message"></textarea>
                        <p class="help-block text-danger"></p>
                      </div>
                    </div>


  <sec:authorize access="hasAnyRole('ROLE_MENTI', 'ROLE_MENTO', 'ROLE_STUDCHAIRMAN')">
<form class="form-inline">
                    <div class="row">
                      <div class="col-md-12">
                        <label>가능한 시간대(멘토링이 가능한 시간대를 표시해주세요.)</label>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <form class="form-inline" name="monday_available">
                          <h3>월</h3>
                          <div class="row">
                            <div class="col-md-2 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon1}" /> 9:00~10:30
                                </label>
                              </div>
                            </div>
                            <div class="col-md-2 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon2}"/> 10:30~12:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon3}"/> ~13:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon4}"/> ~14:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon5}"/> ~15:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-2 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon6}"/> 15:00~16:30
                                </label>
                              </div>
                            </div>
                            <div class="col-md-2 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon7}" /> 16:30~18:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="monCheck" value="${timetable.mon8}" /> 18:00~
                                </label>
                              </div>
                            </div>
                          </div>
                        </form>
                        <br/>
                        <button id='monEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                        <button id='monClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                        <script>
                        $("#monEmpty").click(function() {
                          $("input[name=monCheck]:checkbox").prop("checked", true);
                          $("input[name=monCheck]:checkbox").parent().parent().parent().addClass("available");
                        });
                        $("#monClass").click(function() {
                          $("input[name=monCheck]:checkbox").prop("checked", false);
                          $("input[name=monCheck]:checkbox").parent().parent().parent().removeClass("available");
                        });
                        </script>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <form class="form-inline" name="tuesday_available">
                          <h3>화</h3>
                          <div class="row">
                            <div class="col-md-2 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue1}"/> 9:00~10:30
                                </label>
                              </div>
                            </div>
                            <div class="col-md-2 impossible">
                              <div class="checkbox" >
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue2}"/> 10:30~12:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue3}"/> ~13:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue4}" /> ~14:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue5}" /> ~15:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-2 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue6}" /> 15:00~16:30
                                </label>
                              </div>
                            </div>
                            <div class="col-md-2 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue7}" /> 16:30~18:00
                                </label>
                              </div>
                            </div>
                            <div class="col-md-1 impossible">
                              <div class="checkbox">
                                <label>
                                  <input type="checkbox" name="tueCheck" value="${timetable.tue8}"/> 18:00~
                                </label>
                              </div>
                            </div>
                          </div>
                        </form>
                        <br/>
                        <button id='tueEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                        <button id='tueClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                        <script>
                        $("#tueEmpty").click(function() {
                          $("input[name=tueCheck]:checkbox").prop("checked", true);
                          $("input[name=tueCheck]:checkbox").parent().parent().parent().addClass("available");
                        });
                        $("#tueClass").click(function() {
                          $("input[name=tueCheck]:checkbox").prop("checked", false);
                          $("input[name=tueCheck]:checkbox").parent().parent().parent().removeClass("available");
                        });
                        </script>
                      </div>
                    </div>
                      <div class="row">
                        <div class="col-md-12">
                          <form class="form-inline" name="wednesday_available">
                            <br/>
                            <h3>수</h3>
                            <div class="row">
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed1}" /> 9:00~10:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox" >
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed2}"/> 10:30~12:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed3}"/> ~13:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed4}" /> ~14:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed5}"/> ~15:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed6}"/> 15:00~16:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed7}"/> 16:30~18:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="wedCheck" value="${timetable.wed8}" /> 18:00~
                                  </label>
                                </div>
                              </div>
                            </div>
                          </form>
                          <br/>
                          <button id='wedEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                          <button id='wedClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                          <script>
                          $("#wedEmpty").click(function() {
                            $("input[name=wedCheck]:checkbox").prop("checked", true);
                            $("input[name=wedCheck]:checkbox").parent().parent().parent().addClass("available");
                          });
                          $("#wedClass").click(function() {
                            $("input[name=wedCheck]:checkbox").prop("checked", false);
                            $("input[name=wedCheck]:checkbox").parent().parent().parent().removeClass("available");
                          });
                          </script>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <form class="form-inline" name="thursday_available">
                            <br/>
                            <h3>목</h3>
                            <div class="row">
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu1}" /> 9:00~10:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox" >
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu2}"/> 10:30~12:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu3}"/> ~13:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu4}" /> ~14:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu5}"/> ~15:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu6}"/> 15:00~16:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu7}"/> 16:30~18:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="thuCheck" value="${timetable.thu8}" /> 18:00~
                                  </label>
                                </div>
                              </div>
                            </div>
                          </form>
                          <br/>
                          <button id='thuEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                          <button id='thuClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                          <script>
                          $("#thuEmpty").click(function() {
                            $("input[name=thuCheck]:checkbox").prop("checked", true);
                            $("input[name=thuCheck]:checkbox").parent().parent().parent().addClass("available");
                          });
                          $("#thuClass").click(function() {
                            $("input[name=thuCheck]:checkbox").prop("checked", false);
                            $("input[name=thuCheck]:checkbox").parent().parent().parent().removeClass("available");
                          });
                          </script>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <form class="form-inline" name="friday_available">
                            <br/>
                            <h3>금</h3>
                            <div class="row">
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri1}" /> 9:00~10:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox" >
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri2}" /> 10:30~12:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri3}" /> ~13:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri4}" /> ~14:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri5}" /> ~15:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri6}" /> 15:00~16:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri7}" /> 16:30~18:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="friCheck"value="${timetable.fri8}" /> 18:00~
                                  </label>
                                </div>
                              </div>
                            </div>
                          </form>
                          <br/>
                          <button id='friEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                          <button id='friClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                          <script>
                          $("#friEmpty").click(function() {
                            $("input[name=friCheck]:checkbox").prop("checked", true);
                            $("input[name=friCheck]:checkbox").parent().parent().parent().addClass("available");
                          });
                          $("#friClass").click(function() {
                            $("input[name=friCheck]:checkbox").prop("checked", false);
                            $("input[name=friCheck]:checkbox").parent().parent().parent().removeClass("available");
                          });
                          </script>
                        </div>
                      </div>
                    </form>
 </sec:authorize>
       <hr>


      <div style="margin-top: 40px">
        <p><h3>수정이 끝났으면 저장 버튼을 눌러 주세요.</h3></p>

      <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-ok"> 저장</i></button>
      <a href="${R}user/index"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"> 취소</i></button></a>
      </div>

    </form>
</form:form>
        </div>


      </div>
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
