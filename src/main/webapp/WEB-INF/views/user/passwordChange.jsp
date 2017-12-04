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
  <script>
	 $(function(){
	  $('#number2').keyup(function(){
	   if($('#number1').val()!=$('#number2').val()){
	    $('font[name=check]').text('');
	    $('font[name=check]').html("새로운 비밀번호가 일치하지 않습니다. 다시 확인 바랍니다.");
	   }else{
	    $('font[name=check]').text('');
	    $('font[name=check]').html("새로운 비밀번호 확인이 완료되었습니다.");
	   }
	  }); //#chpass.keyup
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


        .container { margin-top: 30px; }
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


	.search{
			box-shadow : 0px 0px 60px #81F79F inset;
			border-radius : 20px;
			border : 1px solid #81F79F;
		 	margin-top: 20px;
			margin-bottom:10px;
		}
   </style>
   <script>
   $(function() {
	   $("[data-confirm-profile-delete]").click(function() {
	     return confirm("프로필 사진을 초기화합니다. 계속 하시겠습니까?");
	   })
	})

   </script>
   <c:if test="${ param.correct eq false }">
	<script>
		alert('현재 비밀번호가 일치하지 않습니다. 다시 변경해주세요.');
	</script>
	</c:if>
	<c:if test="${ param.newConfirm eq false }">
	<script>
		alert('새로운 비밀번호와의 비교가 올바르지 않습니다. 다시 입력해주세요.');
	</script>
	</c:if>
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
              <li><a href="${R}user/mentoringSurvey">설문조사</a></li>
            </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_MENTO', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              
              <li><a href="${R}user/mento_timetable?timetableView=공강">멘티 시간표 확인</a></li>
              <li><a href="${R}user/report/write">보고서 작성</a></li>
              <li><a href="${R}user/board_manage">멘토링 과제게시판 관리</a></li>
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
      <!-- Introduction Row -->
      <h1 class="my-4"><strong>My Page</strong> - 비밀번호 변경</h1>
      <hr/>
      <!-- Team Members Row -->
      <div class="row">
        <div class="col-md-12">
          	<div class="search">
          	<form:form method="post" modelAttribute="user">  
  			<br>
			<h1><center>비밀번호 변경</center></h1>
			<hr style="border: solid 1px" align="center" width="400" />
				<form:hidden path="id"/>
				<form:hidden path="password"/>
				<div align="center" style="margin-bottom:4px;">
					<form:input type="password" path="originPassword" placeholder="현재 비밀번호" style="width:350px; padding:5px; margin-bottom:5px" />
				</div>
				<div align="center" style="margin-bottom:4px;">
					<form:input type="password" id="number1" path="number" placeholder="새로운 비밀번호" style="width:350px; padding:5px; margin-bottom:5px" />
				</div>
				<div align="center">
					<form:input type="password" id="number2" path="number2" placeholder="새로운 비밀번호 확인" style="width:350px; padding:5px;margin-bottom:5px" />
				</div>
				<div align="center">
					<button type="submit" class="btn btn-success" style="width: 350px; padding:5px;margin-bottom:5px" >비밀번호 변경</button>
				</div>
				<div align="center">
					<a href="${R}user/Edit.do"><button type="button" class="btn btn-success" style="width: 350px; padding:5px" ><i class="glyphicon glyphicon-user"></i> myPage로</button></a>
				</div>
				<center><font name="check" size="2" color="red"></font></center>
				<hr style="border: solid 1px" align="center" width="400" />
				<div align="center">
			    	<p>-신규계정( 신/편입생 ) 초기 비밀번호는 a+휴대폰 뒷자리4개  ex> a5906</p>
			        <p>-비밀번호 일치시 비밀번호 변경</p>
					<p>-비밀번호 초기화는 로그인 페이지에서 이용 가능
					<br><br><br><br>
					<br>
					
				</div>
			</form:form>
			</div>
		</div>
	  </div>
	

	
   </div>
        
 
   <div class="row">
		 <hr/>
    <div class="col-md-3" align="center" >
      <img src="${R}img/skhuniv.jpg"/>
    </div>

    <div class="col-md-9">
      <p>08359 서울시 구로구 연동로 320 / 지하철 1, 7호선 온수역(성공회대입구역)</p>
      <p><i class="glyphicon glyphicon-earphone"></i> TEL : 02-2610-4114 &nbsp&nbsp|&nbsp&nbsp <i class="glyphicon glyphicon-print"></i> FAX : 02-2683-8858</p>
    </div>
  </div>
</body>
</html>
