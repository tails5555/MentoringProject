<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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


        .container { margin-top: 30px;  }

		td{ padding:5px;}
    .userEntity{
      padding-left : 5px;
      padding-right : 5px;
      padding-top : 5px;
      padding-bottom : 5px;
      border : 1px solid #A4A4A4;
      background-color : #D8D8D8;
      font-weight : bold;
      text-align : center;
    }
    .userValue{
      padding-left : 5px;
      padding-right : 5px;
      padding-top : 5px;
      padding-bottom : 5px;
    }
   </style>
 </head>

 <body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index"><img src="${R}img\title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="index">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">참여마당
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
             <li ><a href="${R}user/notice/list?bd=1">공지사항</a></li>
              <li><a href="${R}user/notice/list?bd=2">참여마당</a></li>
            </ul>
        </li>
        <li>
          <a href="intro.html">멘토링 사업소개</a>
        </li>
         <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="menti_apli.html">멘티 신청</a></li>
              <li><a href="mento_apli.html">멘토 신청</a></li>
              <li><a href="mento_list.html">멘토/멘티 목록</a></li>
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
        <sec:authorize access="authenticated">
	        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
	        <li class="dropdown active">
	          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
	          <span class="caret"></span></a>
	            <ul class="dropdown-menu">
	              <li><a href="${R}user/mento_open">멘토링 개설/폐쇄</a></li>
	              <li><a href="report_confirm.html">보고서 확인</a></li>
	              <li><a href="${R}user/survey">설문조사 관리</a></li>
	              <li><a href="${R}user/schedule">멘토, 멘티 신청기간 여부</a></li>
	              <li class="active"><a href="${R}user/list">회원 목록 관리</a></li>
	              <li><a href="${R}user/intro/titleList">사업 안내문 수정</a></li>
	            </ul>
	        </li>
	        </sec:authorize>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
	<li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
        <li><a href="logout_processing"><i class="glyphicon glyphicon-user"> 로그아웃</i></a></li>
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
           <a href="${R}user/mento_open" class="list-group-item">멘토링 개설/폐쇄</a>
            <a href="report_confirm.html" class="list-group-item ">보고서 확인</a>
            <a href="${R}user/survey" class="list-group-item ">설문조사 관리</a>
            <a href="${R}user/schedule" class="list-group-item  ">멘토, 멘티 신청기간 여부</a>
            <a href="${R}user/list" class="list-group-item active">회원 목록 관리</a>
            <a href="${R}user/intro/titleList" class="list-group-item ">사업 안내문 수정</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->
	<form:form method="post" modelAttribute="user">  
        <div class="col-md-9">
          <!-- Introduction Row -->
          <h1 class="my-4"><strong>회원 정보 확인</strong></h1>
          <br/>
		        <table class="table table-bordered">
            <tr>
              <td class="userEntity">학번(교번, 직번)</td>
              <td class="userValue">${ user.number }</td>
            	<td class="userEntity">이름</td>
              <td class="userValue">${ user.userName }</td>
            </tr>
            <tr>
              <td class="userEntity">학과</td>
              <td class="userValue">${ user.departmentName }</td>
            	<td class="userEntity">이메일</td>
              <td class="userValue">${ user.email }</td>
            </tr>
            <tr>
              <td class="userEntity">주소</td>
              <td class="userValue">${ user.address}</td>
            	<td class="userEntity">핸드폰</td>
              <td class="userValue">${ user.phoneNumber}</td>
            </tr>
            <tr>
              <td class="userEntity" colspan="4">인사말</td>
            </tr>
            <tr>
              <td class="userValue" colspan="4">
                	인사말 <br/>
                	인사말 <br/>
                	인사말 <br/>
                	인사말 <br/>
                	인사말 <br/>
              </td>
            </tr>
            <tr>
              <td class="userEntity" colspan="4">사진</td>
            </tr>
            <tr>
              <td class="userValue" colspan="4">
                이 자리에 사진을 올리겠습니다.<br/>
                이 자리에 사진을 올리겠습니다.<br/>
                이 자리에 사진을 올리겠습니다.<br/>
                이 자리에 사진을 올리겠습니다.<br/>
                이 자리에 사진을 올리겠습니다.<br/>
                이 자리에 사진을 올리겠습니다.<br/>
                이 자리에 사진을 올리겠습니다.
              </td>
            </tr>
            <tr>
            
           <form:hidden path="userId" value="${user.userId}"/>
            
              <td class="userEntity" colspan="2">회원 유형</td>
              
              <td class="userValue" colspan="2">
                  <c:choose>
       <c:when test="${user.userType == '멘티'}">
                  <form:select path="userType" class="form-control w200"
                   itemValue="userType" itemLabel="userType" items="${ userType }" />

       </c:when>
    
       <c:when test="${user.userType == '멘토'}">
                  <form:select path="userType" class="form-control w200"
                   itemValue="userType" itemLabel="userType" items="${ userType }" />
       </c:when>
       
  <c:when test="${user.userType == '학생회장'}">
                  <form:select path="userType" class="form-control w200"
                   itemValue="userType" itemLabel="userType" items="${ userType }" />
       </c:when>

       <c:otherwise>
         <button type="button" class="btn btn-default">
            <i class="glyphicon glyphicon-user"></i>관리자는 변경할 수 없습니다.</button>
       </c:otherwise>
       
   </c:choose>         
             

              </td>
            </tr>
          </table>

          
          <a href="list.do"><button class="btn btn-info" type="button"><i class="glyphicon glyphicon-list"> 목록으로</i></button></a>
          <button class="btn btn-warning" type="submit" ><i class="glyphicon glyphicon-user"> 권한 설정하기</i></button>
          
          
      <c:choose>
       <c:when test="${user.userType == '멘티'}">
             <a href="delete.do?id=${ user.userId }" class="btn btn-danger" data-confirm-delete>
          <i class="glyphicon glyphicon-remove"></i>회원 삭제</a>
       </c:when>
       <c:when test="${user.userType == '멘토'}">
             <a href="delete.do?id=${ user.userId }" class="btn btn-danger" data-confirm-delete>
          <i class="glyphicon glyphicon-remove"></i>회원 삭제</a>
       </c:when>

       <c:otherwise>
        <button type="button" class="btn btn-default">
            <i class="glyphicon glyphicon-remove"></i>관리자는 삭제할 수 없습니다.</button>
       </c:otherwise>
   </c:choose>
      
          
        </div>
      </div>
  </div>
 </form:form>
  
  
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
