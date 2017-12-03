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
		
		 $('checkbox[name="time"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });

		 $('form:checkbox[name="tueCheck"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });
		 $('form:checkbox[name="wedCheck"]').each(function() {
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
   <script>
   $(function() {
	   $("[data-confirm-profile-delete]").click(function() {
	     return confirm("프로필 사진을 초기화합니다. 계속 하시겠습니까?");
	   })
	})

   </script>
</head>

 <body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index"><img src="${R}img/title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="index">
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
              <li><a href="survey.html">설문조사</a></li>
            </ul>
        </li>
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
        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="${R}user/mento_open">멘토링 개설/폐쇄</a></li>
              <li><a href="${R}user/report/confirm">보고서 확인</a></li>
              <li><a href="${R}user/survey">설문조사 관리</a></li>
              <li><a href="${R}user/schedule">멘토, 멘티 신청기간 여부</a></li>
              <li><a href="${R}user/list">회원 목록 관리</a></li>
              <li><a href="${R}user/intro/titleList">사업 안내문 수정</a></li>
            </ul>
        </li>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
      	<li class="active"><a href="${R}user/Edit.do"><i class="glyphicon glyphicon-user"> 내정보</i></a></li>
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
          <img class="rounded-circle img-fluid d-block mx-auto" src="<c:choose><c:when test="${my.profileId ne -1}">${R}user/image/profile/${my.profileId}</c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>" alt="" width="200px" height="200px">
          <h3>${ my.userName }
            <small>${ my.departmentName }</small>
          </h3>
          <c:if test="${ my.profileId ne -1 }"><a href="${R}user/reset?id=${ my.profileId }" data-confirm-profile-delete><button class="btn btn-danger" type="button"><i class="glyphicon glyphicon-eye-close"></i> 프로필 초기화</button></a></c:if>
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
              <td colspan="2" class="context">${ my.phone1 } - ${ my.phone2 } - ${ my.phone3 }</td>
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
        
        
 <form:form method="post" modelAttribute="user" class="form-inline" id="my-form"  enctype="multipart/form-data">       
        
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
                <label style="vertical-align: top;">사진 ${ (my.profileId != -1) ? "변경" : "등록" } :  </label>
                 <input type="file" name="profile" class="form-control"/>
              </div>
            </div>

            <br/>
			<c:if test="${ my.userType eq '교수' || my.userType eq '직원' }">
			<div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>사무실 번호 :  </label>
                <form:input path="officeId" type="text" class="form-control" value="${ my.officeId }" id="address" />
                <p class="help-block text-danger"></p>
              </div>
            </div>
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>사무실 전화 번호 :  </label>
                <form:input path="officePhone" type="text" class="form-control" value="${ my.officePhone }" id="address" />
                <p class="help-block text-danger"></p>
              </div>
            </div>
			</c:if>




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
    
                <br/>
                <div class="row">
                  <div class="col-md-12">
                    <label>가능한 시간대(멘토링이 가능한 시간대를 표시해주세요.)</label>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12">
                      <h3>월</h3>
                      <div class="row">
                        <div class="col-md-2 impossible <c:if test="${ timetable.mon1 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>

                              <form:checkbox path="mon1" value="${timetable.mon1}" name="time" /> 9:00~<br/>10:30

                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.mon2 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>

                              <form:checkbox path="mon2" value="${timetable.mon2 }" name="time" /> 10:30~<br/>12:00

                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.mon3 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>

                              <form:checkbox path="mon3" value= "${timetable.mon3 }" name="time" /> ~13:00

                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.mon4 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>

                              <form:checkbox path="mon4" value="${timetable.mon4 }" name="time" /> ~14:00

                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.mon5 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label> 

                              <form:checkbox path="mon5" value="${timetable.mon5 }" name="time" /> ~15:00

                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.mon6 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>

                              <form:checkbox path="mon6" value="${timetable.mon6 }" name="time" /> 15:00~<br/>16:30


                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.mon7 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>

                              <form:checkbox path="mon7" value="${timetable.mon7 }" name="time" /> 16:30~<br/>18:00

                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.mon8 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>

								<form:checkbox path="mon8" value="${timetable.mon8 }" name="time" /> 18:00~

                            </label>
                          </div>
                        </div>
                      </div>
                    <br/>
                    <button id='monEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                    <button id='monClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                    <script>
                    $("#monEmpty").click(function() {
                      $("input[name=mon1]:checkbox").prop("checked", true);
                      $("input[name=mon2]:checkbox").prop("checked", true);
                      $("input[name=mon3]:checkbox").prop("checked", true);
                      $("input[name=mon4]:checkbox").prop("checked", true);
                      $("input[name=mon5]:checkbox").prop("checked", true);
                      $("input[name=mon6]:checkbox").prop("checked", true);
                      $("input[name=mon7]:checkbox").prop("checked", true);
                      $("input[name=mon8]:checkbox").prop("checked", true);
                      $("input[name=mon1]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=mon2]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=mon3]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=mon4]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=mon5]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=mon6]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=mon7]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=mon8]:checkbox").parent().parent().parent().addClass("available");
                    });
                    $("#monClass").click(function() {
                  	  $("input[name=mon1]:checkbox").prop("checked", false);
                      $("input[name=mon2]:checkbox").prop("checked", false);
                      $("input[name=mon3]:checkbox").prop("checked", false);
                      $("input[name=mon4]:checkbox").prop("checked", false);
                      $("input[name=mon5]:checkbox").prop("checked", false);
                      $("input[name=mon6]:checkbox").prop("checked", false);
                      $("input[name=mon7]:checkbox").prop("checked", false);
                      $("input[name=mon8]:checkbox").prop("checked", false);
                      $("input[name=mon1]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=mon2]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=mon3]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=mon4]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=mon5]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=mon6]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=mon7]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=mon8]:checkbox").parent().parent().parent().removeClass("available");
                    });
                    </script>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-12">
                      <h3>화</h3>
                      <div class="row">
                        <div class="col-md-2 impossible <c:if test="${ timetable.tue1 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="tue1" /> 9:00~<br/>10:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.tue2 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="tue2" /> 10:30~<br/>12:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.tue3 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="tue3"  /> ~13:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.tue4 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="tue4"  /> ~14:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.tue5 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="tue5"  /> ~15:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.tue6 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="tue6" /> 15:00~<br/>16:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.tue7 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="tue7" /> 16:30~<br/>18:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.tue8 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
								<form:checkbox path="tue8" /> 18:00~
                            </label>
                          </div>
                        </div>
                      </div>
                    <br/>
                    <button id='tueEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                    <button id='tueClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                    <script>
                    $("#tueEmpty").click(function() {
                      $("input[name=tue1]:checkbox").prop("checked", true);
                      $("input[name=tue2]:checkbox").prop("checked", true);
                      $("input[name=tue3]:checkbox").prop("checked", true);
                      $("input[name=tue4]:checkbox").prop("checked", true);
                      $("input[name=tue5]:checkbox").prop("checked", true);
                      $("input[name=tue6]:checkbox").prop("checked", true);
                      $("input[name=tue7]:checkbox").prop("checked", true);
                      $("input[name=tue8]:checkbox").prop("checked", true);
                      $("input[name=tue1]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=tue2]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=tue3]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=tue4]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=tue5]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=tue6]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=tue7]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=tue8]:checkbox").parent().parent().parent().addClass("available");
                    });
                    $("#tueClass").click(function() {
                  	  $("input[name=tue1]:checkbox").prop("checked", false);
                      $("input[name=tue2]:checkbox").prop("checked", false);
                      $("input[name=tue3]:checkbox").prop("checked", false);
                      $("input[name=tue4]:checkbox").prop("checked", false);
                      $("input[name=tue5]:checkbox").prop("checked", false);
                      $("input[name=tue6]:checkbox").prop("checked", false);
                      $("input[name=tue7]:checkbox").prop("checked", false);
                      $("input[name=tue8]:checkbox").prop("checked", false);
                      $("input[name=tue1]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=tue2]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=tue3]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=tue4]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=tue5]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=tue6]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=tue7]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=tue8]:checkbox").parent().parent().parent().removeClass("available");
                    });
                    </script>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-12">
                      <h3>수</h3>
                      <div class="row">
                        <div class="col-md-2 impossible <c:if test="${ timetable.wed1 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="wed1" /> 9:00~<br/>10:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.wed2 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="wed2" /> 10:30~<br/>12:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.wed3 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="wed3" /> ~13:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.wed4 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="wed4" /> ~14:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.wed5 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="wed5" /> ~15:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.wed6 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="wed6" /> 15:00~<br/>16:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.wed7 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="wed7" /> 16:30~<br/>18:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.wed8 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
								<form:checkbox path="wed8" /> 18:00~
                            </label>
                          </div>
                        </div>
                      </div>
                    <br/>
                    <button id='wedEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                    <button id='wedClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                    <script>
                    $("#wedEmpty").click(function() {
                      $("input[name=wed1]:checkbox").prop("checked", true);
                      $("input[name=wed2]:checkbox").prop("checked", true);
                      $("input[name=wed3]:checkbox").prop("checked", true);
                      $("input[name=wed4]:checkbox").prop("checked", true);
                      $("input[name=wed5]:checkbox").prop("checked", true);
                      $("input[name=wed6]:checkbox").prop("checked", true);
                      $("input[name=wed7]:checkbox").prop("checked", true);
                      $("input[name=wed8]:checkbox").prop("checked", true);
                      $("input[name=wed1]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=wed2]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=wed3]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=wed4]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=wed5]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=wed6]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=wed7]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=wed8]:checkbox").parent().parent().parent().addClass("available");
                    });
                    $("#wedClass").click(function() {
                  	  $("input[name=wed1]:checkbox").prop("checked", false);
                      $("input[name=wed2]:checkbox").prop("checked", false);
                      $("input[name=wed3]:checkbox").prop("checked", false);
                      $("input[name=wed4]:checkbox").prop("checked", false);
                      $("input[name=wed5]:checkbox").prop("checked", false);
                      $("input[name=wed6]:checkbox").prop("checked", false);
                      $("input[name=wed7]:checkbox").prop("checked", false);
                      $("input[name=wed8]:checkbox").prop("checked", false);
                      $("input[name=wed1]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=wed2]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=wed3]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=wed4]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=wed5]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=wed6]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=wed7]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=wed8]:checkbox").parent().parent().parent().removeClass("available");
                    });
                    </script>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-12">
                      <h3>목</h3>
                      <div class="row">
                        <div class="col-md-2 impossible <c:if test="${ timetable.thu1 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="thu1" /> 9:00~<br/>10:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.thu2 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="thu2" /> 10:30~<br/>12:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.thu3 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="thu3" /> ~13:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.thu4 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="thu4" /> ~14:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.thu5 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="thu5" /> ~15:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.thu6 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="thu6" /> 15:00~<br/>16:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.thu7 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="thu7" /> 16:30~<br/>18:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.thu8 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
								<form:checkbox path="thu8" /> 18:00~
                            </label>
                          </div>
                        </div>
                      </div>
                    <br/>
                    <button id='thuEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                    <button id='thuClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                    <script>
                    $("#thuEmpty").click(function() {
                      $("input[name=thu1]:checkbox").prop("checked", true);
                      $("input[name=thu2]:checkbox").prop("checked", true);
                      $("input[name=thu3]:checkbox").prop("checked", true);
                      $("input[name=thu4]:checkbox").prop("checked", true);
                      $("input[name=thu5]:checkbox").prop("checked", true);
                      $("input[name=thu6]:checkbox").prop("checked", true);
                      $("input[name=thu7]:checkbox").prop("checked", true);
                      $("input[name=thu8]:checkbox").prop("checked", true);
                      $("input[name=thu1]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=thu2]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=thu3]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=thu4]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=thu5]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=thu6]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=thu7]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=thu8]:checkbox").parent().parent().parent().addClass("available");
                    });
                    $("#thuClass").click(function() {
                  	  $("input[name=thu1]:checkbox").prop("checked", false);
                      $("input[name=thu2]:checkbox").prop("checked", false);
                      $("input[name=thu3]:checkbox").prop("checked", false);
                      $("input[name=thu4]:checkbox").prop("checked", false);
                      $("input[name=thu5]:checkbox").prop("checked", false);
                      $("input[name=thu6]:checkbox").prop("checked", false);
                      $("input[name=thu7]:checkbox").prop("checked", false);
                      $("input[name=thu8]:checkbox").prop("checked", false);
                      $("input[name=thu1]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=thu2]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=thu3]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=thu4]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=thu5]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=thu6]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=thu7]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=thu8]:checkbox").parent().parent().parent().removeClass("available");
                    });
                    </script>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-md-12">
                      <h3>금</h3>
                      <div class="row">
                        <div class="col-md-2 impossible <c:if test="${ timetable.fri1 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="fri1" /> 9:00~<br/>10:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.fri2 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="fri2" /> 10:30~<br/>12:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.fri3 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="fri3" /> ~13:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.fri4 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="fri4" /> ~14:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.fri5 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="fri5" /> ~15:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.fri6 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="fri6" /> 15:00~<br/>16:30
                            </label>
                          </div>
                        </div>
                        <div class="col-md-2 impossible <c:if test="${ timetable.fri7 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
                              <form:checkbox path="fri7" /> 16:30~<br/>18:00
                            </label>
                          </div>
                        </div>
                        <div class="col-md-1 impossible <c:if test="${ timetable.fri8 eq true }">available</c:if>">
                          <div class="checkbox">
                            <label>
								<form:checkbox path="fri8" /> 18:00~
                            </label>
                          </div>
                        </div>
                      </div>
                    <br/>
                    <button id='friEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                    <button id='friClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                    <script>
                    $("#friEmpty").click(function() {
                      $("input[name=fri1]:checkbox").prop("checked", true);
                      $("input[name=fri2]:checkbox").prop("checked", true);
                      $("input[name=fri3]:checkbox").prop("checked", true);
                      $("input[name=fri4]:checkbox").prop("checked", true);
                      $("input[name=fri5]:checkbox").prop("checked", true);
                      $("input[name=fri6]:checkbox").prop("checked", true);
                      $("input[name=fri7]:checkbox").prop("checked", true);
                      $("input[name=fri8]:checkbox").prop("checked", true);
                      $("input[name=fri1]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=fri2]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=fri3]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=fri4]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=fri5]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=fri6]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=fri7]:checkbox").parent().parent().parent().addClass("available");
                      $("input[name=fri8]:checkbox").parent().parent().parent().addClass("available");
                    });
                    $("#friClass").click(function() {
                  	  $("input[name=fri1]:checkbox").prop("checked", false);
                      $("input[name=fri2]:checkbox").prop("checked", false);
                      $("input[name=fri3]:checkbox").prop("checked", false);
                      $("input[name=fri4]:checkbox").prop("checked", false);
                      $("input[name=fri5]:checkbox").prop("checked", false);
                      $("input[name=fri6]:checkbox").prop("checked", false);
                      $("input[name=fri7]:checkbox").prop("checked", false);
                      $("input[name=fri8]:checkbox").prop("checked", false);
                      $("input[name=fri1]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=fri2]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=fri3]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=fri4]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=fri5]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=fri6]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=fri7]:checkbox").parent().parent().parent().removeClass("available");
                      $("input[name=fri8]:checkbox").parent().parent().parent().removeClass("available");
                    });
                    </script>
                  </div>
                </div>
               
            
              </div>
            </div>
            <script>
            $(document).ready(function() {
              $("input:checkbox").on('click', function() {
                if ( $(this).prop('checked')) {
                  $(this).parent().parent().parent().addClass("available"); }
                else { $(this).parent().parent().parent().removeClass("available"); }
                });
              });
            </script>
            <hr/>
            <div class="row">
              <div class="col-md-12 information">
                <p> ⊙ 시간표 조율은 수업이 없는 날만 체크하는 것이 아닙니다. 멘티가 가능한 시간들을 조율해서 체크해주시길 바랍니다.</p>
                <p> ⊙ 멘토링 매치 결과는 일주일 후에 문자로 연락드립니다. </p>
              </div>
            </div>
                      
                      
                      
                    </form>
                  </form>  
 </sec:authorize>
       <hr>


      <div style="margin-top: 40px">
        <p><h3>수정이 끝났으면 저장 버튼을 눌러 주세요.</h3></p>

      <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-ok"> 저장</i></button>
      <a href="${R}user/index"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"> 취소</i></button></a>
      </div>

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
