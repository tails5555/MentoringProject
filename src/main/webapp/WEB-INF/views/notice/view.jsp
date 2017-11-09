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
      .reportEntity{
        padding-left : 10px;
        padding-right : 10px;
        padding-top : 12px;
        padding-bottom : 12px;
        border : 1px solid #A9F5BC;
        background-color : #CEF6D8;
        font-weight : bold;
        text-align : center;
      }
      .reportInput{
        padding-left : 5px;
        padding-right : 5px;
        padding-top : 12px;
        padding-bottom : 12px;
        border : 1px solid #A9F5BC;
      }
      .mentiList{
        padding-top : 12px;
        padding-bottom : 11px;
        border : 1px solid #A4A4A4;
      }
      .mentoPicture{
        border : 1px solid #A4A4A4;
        background-color : #D8D8D8;
        text-align : center;
        font-weight : bold;
        padding-top : 10px;
        padding-bottom : 10px;
      }
      .mentoPictureDisplay{
        border : 1px solid #A4A4A4;
        padding-left : 20px;
        padding-right : 20px;
        padding-top : 20px;
        padding-bottom : 20px;
      }
      .upload{
        border : 1px solid #A4A4A4;
        background-color : #D8D8D8;
        font-weight : bold;
        padding-top : 7px;
        padding-bottom : 7px;
      }
      .complete{
        margin-top : 20px;
      }
      .input_time{
        width : 60px;
      }
      div#context{ min-height : 500px}
   </style>
   <script type="text/javascript">
    $(function () {
      $('[data-toggle="popover"]').popover();
    });
   </script>
   <script>
   $(function() {
	   $("[data-confirm-comment-delete]").click(function() {
	     return confirm("댓글을 삭제합니다. 계속 하시겠습니까?");
	   })
	   $("[data-confirm-file-delete]").click(function() {
	     return confirm("파일을 삭제합니다. 계속 하시겠습니까?");
	   })
	   $("[data-confirm-fileAll-delete]").click(function() {
	     return confirm("파일을 모두 삭제합니다. 계속 하시겠습니까?");
	   })
	   $("[data-confirm-post-delete]").click(function() {
	     return confirm("현재 게시물을 삭제합니다. 계속 하시겠습니까?");
	   })
	})

   </script>
 </head>

 <body>
    <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
      	<sec:authorize access="not authenticated">
	      <a class="navbar-brand" href="${R}"><img src="${R}img\title.png"/></a>
	    </sec:authorize>
	    <sec:authorize access="authenticated">
	      <a class="navbar-brand" href="${R}user/index"><img src="${R}img\title.png"/></a>
	    </sec:authorize>
      </div>
      <ul class="nav navbar-nav">
        <sec:authorize access="not authenticated">
        <li><a href="${R}">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
      	</sec:authorize>
        <sec:authorize access="authenticated">
        <li><a href="${R}user/index">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        </sec:authorize>
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li <c:if test="${param.bd eq 1}">class="active"</c:if>><a href="${R}user/notice/list?bd=1">공지사항</a></li>
              <li <c:if test="${param.bd eq 2}">class="active"</c:if>><a href="${R}user/notice/list?bd=2">참여마당</a></li>
            </ul>
        </li>
        <li>
        	<sec:authorize access="not authenticated">
	      		<a href="${R}guest/intro">멘토링 사업소개</a>
		    </sec:authorize>
		  	<sec:authorize access="authenticated">
		      	<a href="${R}user/intro">멘토링 사업소개</a>
		  	</sec:authorize>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="menti_apli.html">멘티 신청</a></li>
              <li><a href="${R}user/mento_apli">멘토 신청</a></li>
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
	      <li><a href="${R}guest/login"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
	      <li><a href="${R}guest/create.do"><i class="glyphicon glyphicon-pencil"> 회원가입</i></a></li>
	    </sec:authorize>
	    <sec:authorize access="authenticated">
	      <li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
	      <li><a href="${R}user/logout_processing"><i class="glyphicon glyphicon-user"> 로그아웃</i></a></li>
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
          <h1 class="my-4"><strong>알립니다</strong></h1>
          <div class="list-group">
            <sec:authorize access="not authenticated">
            	<a href="${R}guest/notice/list?bd=1" class="list-group-item <c:if test="${param.bd eq 1}">active</c:if>">공지사항</a>
            </sec:authorize>
          	<sec:authorize access="authenticated">
            	<a href="${R}user/notice/list?bd=1" class="list-group-item <c:if test="${param.bd eq 1}">active</c:if>">공지사항</a>
            </sec:authorize>
            <a href="${R}user/notice/list?bd=2" class="list-group-item <c:if test="${param.bd eq 2}">active</c:if>">참여마당</a>
          </div>
        </div>
        <div class="col-md-9">
          
          <!-- Team Members Row -->
          <div class="row">
            <h1 class="my-4"><strong>${noticeBBS.bbsName}</strong></h1><h3><b>게시물 확인</b></h3>
            <div class="row">
            	<div class="col-md-2 reportEntity">제목</div>
            	<div class="col-md-10 reportInput">${ noticePost.title }</div>
            </div>
            <div class="row">
              <div class="col-md-2 reportEntity">올린이</div>
              <div class="col-md-4 reportInput">${ noticePost.userName }</div>
              <div class="col-md-2 reportEntity">올린 날짜</div>
              <div class="col-md-4 reportInput"><fmt:formatDate value="${noticePost.writeDate}" pattern="yyyy-MM-dd HH:mm"/></div>
            </div>
            <div class="row">
              <div class="col-md-2 reportEntity">연락</div>
              <div class="col-md-4 reportInput">${ noticePost.userEmail }</div>
              <div class="col-md-2 reportEntity">조회수</div>
              <div class="col-md-4 reportInput">${ noticePost.views }</div>
            </div>
            <c:if test="${noticeFile.size() ne 0}">
	            <div class="row">
	            	<div class="col-md-12 reportEntity">첨부 파일</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 reportInput">
		            	<table class="table">
		            		<c:forEach var="file" items="${ noticeFile }">
		            			<tr>
		            				<td style="text-align : center;"><i class="glyphicon glyphicon-save-file"></i></td>
		            				<td style="text-align : center;"><a href="download?id=${file.id}">${ file.fileName }</a></td>
		            				<td style="text-align : center;"><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ file.fileTime }"></fmt:formatDate></td>
		            				<td style="text-align : center;"><fmt:formatNumber pattern="0.00" value="${ file.fileSize/1024/1024 }"/>MB</td>
		            				<sec:authorize access="authenticated">
			            				<sec:authentication property="user.id" var="userId"/>
									    <c:if test="${userId eq noticePost.userId }">
									    	<td style="text-align : center;"><a href="fileDelete?bd=${noticeBBS.id}&id=${noticePost.id}&fId=${file.id}" class="btn btn-danger" data-confirm-file-delete><i class="glyphicon glyphicon-trash"></i> 파일 삭제</a></td>
									    </c:if>
									</sec:authorize>
		            			</tr>
		            		</c:forEach>
		            	</table>
		            	<sec:authorize access="authenticated">
			            	<sec:authentication property="user.id" var="userId"/>
		            		<c:if test="${userId eq noticePost.userId }">
							    	<hr/>
							    	<a href="fileAllDelete?bd=${noticeBBS.id}&id=${noticePost.id}" class="btn btn-danger" data-confirm-fileAll-delete><i class="glyphicon glyphicon-trash"></i> 모든 파일 삭제</a>
							</c:if>
						</sec:authorize>
	            	</div>
	            </div>
            </c:if>
            <div class="row">
              <div class="col-md-12 reportEntity">내용문</div>
            </div>
            <div class="row">
              <div class="col-md-12 reportInput">
                <div id="context">${ noticePost.context }</div>
              </div>
            </div>
            <div class="complete" align="right">
              <a href="list.do?bd=${noticeBBS.id}"><button class="btn btn-info" type="button"><i class="glyphicon glyphicon-arrow-left"> 뒤로가기</i></button></a>
              <sec:authorize access="authenticated">    	
			    <sec:authentication property="user.id" var="userId"/>
			    <c:if test="${userId eq noticePost.userId }">
			    	&nbsp;&nbsp;
			    	<a href="edit.do?bd=${noticeBBS.id }&id=${noticePost.id}" class="btn btn-info" ><i class="glyphicon glyphicon-pencil"></i> 수정하기 / ${ noticeFile.size() > 0 ? "파일 추가" : "새로운 파일 추가" }</a>
			    	&nbsp;&nbsp;
			    	<a href="postDelete.do?bd=${noticeBBS.id }&id=${noticePost.id}" class="btn btn-info" data-confirm-post-delete><i class="glyphicon glyphicon-remove"></i> 삭제하기</a>
			    </c:if>
			  </sec:authorize>
            </div>
            <hr/>
            <sec:authorize access="not authenticated">
            	<div class="panel panel-info">
				  <div class="panel-heading">
				    <h3 class="panel-title">댓글을 달 권한이 없습니다.</h3>
				  </div>
				  <div class="panel-body">
				    <a href="${R}guest/login">로그인</a> 후 이용해주시길 바랍니다.
				  </div>
				</div>
            </sec:authorize>
            <sec:authorize access="authenticated">
            	<div class="panel panel-info">
				  <div class="panel-heading">
				    <h3 class="panel-title">댓글 추가하기</h3>
				  </div>
				  <div class="panel-body">
				    <form:form method="post" modelAttribute="newComment">
				    	<form:textarea path="context" class="form-control"/>
				    	<br/>
				    	<div class="pull-right">
				    		<button type="submit" class="btn btn-success">등록</button>
				    	</div>
				    </form:form>
				  </div>
				</div>
            </sec:authorize>
            <c:if test="${ noticeComment.size() ne 0 }">
            	<hr/>
            	<h4>Comment</h4>
            	<c:forEach var="comment" items="${ noticeComment }">
            		<div class="panel panel-success">
					  <div class="panel-heading">
					    <h3 class="panel-title">${ comment.userName }(${comment.userType})&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${comment.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
					  </div>
					  <div class="panel-body">
					    ${ comment.context }
					    <sec:authorize access="authenticated">    	
					    	<div class="pull-right">
						    	<sec:authentication property="user.id" var="userId"/>
						    	<c:if test="${userId eq comment.userId }">
						    		<br/><br/>
						    		<a href="commentDelete.do?bd=${noticeBBS.id }&id=${noticePost.id}&cmdId=${comment.id}" class="btn btn-danger" data-confirm-comment-delete><i class="glyphicon glyphicon-remove"></i>삭제</a>
						    	</c:if>
					    	</div>
					    </sec:authorize>
					  </div>
					</div>
            	</c:forEach>
            </c:if>
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
