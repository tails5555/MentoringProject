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
		 	background-size: 650px 450px;
		 	margin-left : auto;
		 	margin-right : auto;
		 	margin-top : 50px;
		 	margin-bottom : 50px;
		 	padding-top : 10px;
		 	padding-botton : 10px;
		 	background-image: url("/SKHUMentoring/img/login.png");
		}
	</style>
</head>
<body>
  <%@ include file="/WEB-INF/views/include/menu_for_guest.jsp" %>
  <div >
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>
  	<div class="login">
	<h1><center>Login</center></h1>
	<h5><center>로그인을 하셔야 사용하실 수 있는 서비스 입니다.</center></h5>
	<hr style="border: solid 1px" align="center" width="400px" />
	<form method="post" action="login_processing">
		<div align="center">
			<input type="text" name="loginId" placeholder="아이디 입력" style="width:350px; padding:3px; margin-bottom:3px" />
		</div>
		<div align="center">
			<input type="password" name="passwd" placeholder="비밀번호 입력" style="width:350px; padding:3px;margin-bottom:3px" />
		</div>
		<div align="center">
			<button type="submit" class="btn btn-primary" style="width: 350px; padding:3px" >
			<span class="glyphicon glyphicon-ok"></span>로그인</button>
		</div>
	</form>
	<hr style="border: solid 1px" align="center" width="400px" />
	<div align="center">
	    <a href="${R}guest/searchPassword.do?correct=true">비밀번호 찾기</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="create.do">회원가입</a>
	</div>
	<br/>
	<c:if test="${param.error !=null }">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="panel panel-warning">
				<div class="panel-heading">
		    		<h3 class="panel-title">로그인에 실패하였습니다.</h3>
		  		</div>
			  	<div class="panel-body">
			    	학번, 교직원 번호와 비밀번호를 다시 확인해주시기 바랍니다. 초기 비밀번호는 a+휴대폰 뒷자리 4개입니다.
			  	</div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
	</c:if>
	<c:if test="${ param.error == null }">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<div class="panel panel-info">
				<div class="panel-heading">
		    		<h3 class="panel-title">로그인 안내</h3>
		  		</div>
			  	<div class="panel-body">
			    	아이디는 여러분의 학번, 교번, 직원번호이고, 초기 비밀 번호는 a+휴대폰 뒷자리 4개입니다.
			  	</div>
			</div>
		</div>
		<div class="col-md-4"></div>
	</div>
	</c:if>
	<br/>
   </div>
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
