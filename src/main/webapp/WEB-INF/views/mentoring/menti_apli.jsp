<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<c:url var="R" value="/" />

<!DOCTYPE html>
<html>
 <head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="${R}res/inputModel.css">
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


        .container { margin-top: 30px;  }
        .application{ margin-top: 20px; }

        label{
          margin-right: 10px
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
        .table_first{
          background-color : #F5ECCE;
        }
   </style>
   <script>
   $(function() {
	   $("[data-confirm-menti]").click(function() {
	     return confirm("멘티를 신청합니다. 계속 하시겠습니까?");
	   })
	})
	$(function() {
	   $("[data-confirm-cancel]").click(function() {
	     return confirm("멘티를 취소합니다. 계속 하시겠습니까?");
	   })
	})
	$(function() {
	   $("[data-confirm-all-cancel]").click(function() {
	     return confirm("멘티 신청 기록을 취소합니다. 계속 하시겠습니까?");
	   })
	})
   </script>
   <script type="text/javascript">
 	var auto_refresh=setInterval(
 			function(){
 				$('#dataArea').load('/SKHUMentoring/user/mentoringPopup?type=0').fadeIn('slow');
 			}, 5000
 	);
 	$.noConflict();
 	jQuery(document).ready(function(){
         
         
 		jQuery.ajax({
             
            type : "GET",
            url : "/SKHUMentoring/user/mentoringPopup?type=0",
            dataType : "text",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
            	jQuery("#dataArea").html(data) ;
            }
             
        });
         
 
    });
    
	</script>
	<script src="${R}res/common.js"></script>
 </head>

 <body>
<nav id="menu" class="navbar navbar-default navbar-fixed-top">
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
        <li>
          <a href="${R}user/intro">멘토링 사업소개</a>
        </li>
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <sec:authorize access="not authenticated">
		        <li><a href="login">멘티 신청</a></li>
		      </sec:authorize>
		      <sec:authorize access="authenticated">
		        <li class="active"><a href="${R}user/menti_apli">멘티 신청</a></li>
		      </sec:authorize>
              <sec:authorize access="not authenticated">
		        <li><a href="login">멘토 신청</a></li>
		      </sec:authorize>
		      <sec:authorize access="authenticated">
		        <li><a href="${R}user/mento_apli">멘토 신청</a></li>
		      </sec:authorize>
              <li ><a href="${R}user/mento_list">멘토/멘티 목록</a></li>
              <li><a href="${R}user/groupBBS">멘토링 게시판</a></li>
              <li><a href="${R}user/mentoringSurvey">설문조사</a></li>
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
	              <li><a href="${R}user/board_manage">멘토링 과제게시판 관리</a></li>
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
        <div class="col-md-3">
          <h1 class="my-4"><strong>멘토링</strong></h1>
          <div class="list-group">
            <a href="${R}user/menti_apli" class="list-group-item active">멘티 신청</a>
            <a href="${R}user/mento_list" class="list-group-item">멘토 신청</a>
            <a href="${R}user/mento_list" class="list-group-item">멘토/멘티 목록</a>
            
          </div>
        </div>
        <!-- /.col-lg-3 -->
        <div class="col-md-9">
      <!-- Introduction Row -->
          <h1 class="my-4"><strong>멘티 신청</strong></h1>
          <hr/>
          <sec:authorize access="hasAnyRole({'ROLE_PROFESSOR', 'ROLE_EMPLOYEE'})">
			<div class="panel panel-warning">
			  <div class="panel-heading">
	    		<h3 class="panel-title">교수와 직원은 접근이 불가능합니다.</h3>
	  		  </div>
		      <div class="panel-body">
				 교수와 직원은 사이트 관리에서 신청한 멘토들의 목록들에 대해서 설정할 수 있습니다.
			  </div>
			</div>
          </sec:authorize>
          <sec:authorize access="hasAnyRole({'ROLE_MENTO', 'ROLE_MENTI', 'ROLE_STUDCHAIRMAN'})">
          <div id="dataArea">
	      </div>
	      <br/>
	      <span class="badge">범례 별 알림</span>
	      <a href="${R}user/mentoringPopup?type=1" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-info"><i class="glyphicon glyphicon-plus"></i> 멘토 신청</span></a>
  		  <a href="${R}user/mentoringPopup?type=2" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-success"><i class="glyphicon glyphicon-ok"></i> 멘토 선정</span></a>
  		  <a href="${R}user/mentoringPopup?type=3" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-warning"><i class="glyphicon glyphicon-user"></i> 멘티 신청</span></a>
  		  <a href="${R}user/mentoringPopup?type=4" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-danger"><i class="glyphicon glyphicon-remove"></i> 멘토링 탈락</span></a>
  		  <a href="${R}user/mentoringPopup?type=5" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-danger"><i class="glyphicon glyphicon-thumbs-down"></i> 멘티 취소</span></a>
  		  <a href="${R}user/mentoringPopup?type=6" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-warning"><i class="glyphicon glyphicon-question-sign"></i> 멘티 전체 삭제</span></a>
  		  <a href="${R}user/mentoringPopup?type=7" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-danger"><i class="glyphicon glyphicon-certificate"></i> 멘티 선정 탈락</span></a>
          <hr/>
          <div class="row">
            <div class="col-md-12">
              <h2><b>멘토 목록</b></h2>
              <hr/>
              <table class="table table-bordered">
                <thead class="table_first">
                  <tr>
                    <td>멘토링 이름</td>
                    <td>과목</td>
                    <td>멘토 이름</td>
                    <td>신청 현황</td>
                    <td>신청 </td>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="mentoringGroup" items="${mentos}">
                  	<tr <c:if test="${mentoringGroup.count gt 5}">class="danger"</c:if>>
                  		<td><a href="mento_list?id=${ mentoringGroup.mentoId }">${mentoringGroup.teamName }</a></td>
                  		<td>${mentoringGroup.subject }</td>
                  		<td>${mentoringGroup.name }</td>
                  		<td>${mentoringGroup.count }/5</td>

                  		<td>
                  		
                  		<c:choose>
                  			<c:when test="${ mentoringGroup.mentoConfirm eq true }">이미 멘토입니다.</c:when>
                  			<c:when test="${ mentoringGroup.included eq false }"><a href="menti_application?id=${mentoringGroup.id}"><button class="btn btn-warning" type="button" data-confirm-menti>신청하기</button></a></c:when>
                  			<c:otherwise><a href="menti_each_remove?id=${mentoringGroup.id }" data-confirm-cancel><button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-remove"></i>신청 취소</button></a></c:otherwise>

                  		</c:choose></td>
                  	</tr>
                  </c:forEach>
                </tbody>
              </table>
              <hr/>
              <a href="menti_remove" data-confirm-all-cancel><button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-certificate"></i> 전체 취소</button></a>
            </div>
          </div>
      </sec:authorize>
      </div>
    </div>
   </div>
    
    <!-- /.container -->
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

