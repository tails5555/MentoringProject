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


      .container {
        margin-top: 30px;
        margin-left : auto;
        margin-right : auto;
      }
      .search{
        margin-top : 10px;
        margin-bottom : 10px;
      }
      thead{
        background-color : #A9F5BC;
      }
      tbody tr:hover {
        background-color: #CEF6D8;
        cursor : pointer;
      }
   </style>
   <script type="text/javascript">
    $(function () {
      $('[data-toggle="popover"]').popover();
    });
   </script>
 </head>

 <body>
   <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="${R}user/index"><img src="${R}img\title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="index.html">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">참여마당
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li <c:if test="${param.id eq 1}">class="active"</c:if>><a href="${R}user/notice/list?id=1">공지사항</a></li>
              <li <c:if test="${param.id eq 2}">class="active"</c:if>><a href="${R}user/notice/list?id=2">건의사항</a></li>
            </ul>
        </li>
        <li>
          <a href="${R}user/intro">멘토링 사업소개</a>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="menti_apli.html">멘티 신청</a></li>
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
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <sec:authorize access="not authenticated">
	      <li><a href="login"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
	      <li><a href="sign.html"><i class="glyphicon glyphicon-pencil"> 회원가입</i></a></li>
	    </sec:authorize>
	    <sec:authorize access="authenticated">
	      <li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
	      <li><a href="logout_processing"><i class="glyphicon glyphicon-user"> 로그아웃</i></a></li>
	    </sec:authorize>
      </ul>
    </div>
   </nav>
   <div>
       <img src="${R}img/topimage.jpg" class="img-responsive"/>
   </div>
  <div class="container">

      <div class="row">

        <div class="col-md-3">
          <h1 class="my-4"><strong>참여마당</strong></h1>
          <div class="list-group">
            <a href="${R}user/notice/list?id=1" class="list-group-item <c:if test="${param.id eq 1}">active</c:if>">공지사항</a>
            <a href="${R}user/notice/list?id=2" class="list-group-item <c:if test="${param.id eq 2}">active</c:if>">건의사항</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-md-9">
          <h1 class="my-4"><strong>${ noticeBBS.bbsName }</strong></h1>
          <div class="row search">
              <form class="form-inline" align="right">
                <select class="form-control">
                  <option>제목</option>
                  <option>작성자</option>
                  <option>제목+내용</option>
                </select>
                <input type="text" class="form-control" id="searchKeyword" placeholder="검색어를 입력하세요."/>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-search"> 검색하기</i></button>
              </form>
          </div>
          <div class="row">
            <div class="col-md-12">
              <table class="table">
                <thead>
                  <tr>
                    <th style="text-align: center" width="20px">번호</th>
                    <th style="text-align: center" width="200px">제목 </th>
                    <th style="text-align: center" width="80px">작성자</th>
                    <th style="text-align: center" width="80px">작성시간</th>
                    <th style="text-align: center" width="80px">조회</th>
                  </tr>
                </thead>

                <tbody>
                <c:forEach var="post" items="${ postList }">
	              <tr>
	              	<td>${ post.id }
	              	<td>${ post.title }</td>
	              	<td>${ post.userName }</td>
	              	<td>${ post.writeDate }</td>
	              	<td>${ post.views }
	              </tr>
	            </c:forEach> 
                </tbody>
              </table>
            </div>
          </div>
          <div class="search" align="right">
            <a href="notice_apli.html"><button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-placement="top" data-content="글쓰기 권한이 없습니다.">
              <i class="glyphicon glyphicon-pencil"> 글쓰기</i></button></a>
          </div>
          <nav aria-label="Page navigation">
            <ul class="pagination">
              <li>
                <a href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="active"><a href="#">1</a></li>
              <li><a href="#">2</a></li>
              <li><a href="#">3</a></li>
              <li><a href="#">4</a></li>
              <li><a href="#">5</a></li>
              <li>
                <a href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>

        </div>
      </div>

    </div>
    <hr/>
    <div class="row">
      <div class="col-md-3" align="center">
        <img src="img/skhuniv.jpg"/>
      </div>
      <div class="col-md-9">
        <p>08359 서울시 구로구 연동로 320 / 지하철 1, 7호선 온수역(성공회대입구역)</p>
        <p><i class="glyphicon glyphicon-earphone"></i> TEL : 02-2610-4114 &nbsp&nbsp|&nbsp&nbsp <i class="glyphicon glyphicon-print"></i> FAX : 02-2683-8858</p>
      </div>
    </div>
 </body>
</html>
