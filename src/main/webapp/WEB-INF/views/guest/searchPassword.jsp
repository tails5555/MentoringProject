<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

		
			.search{
			background-image: url("/SKHUMentoring/img/search_password.png");
			background-repeat: no-repeat;
		 	background-position: center;
		 	background-size: 600px 430px;
		 	margin-top: 20px;
			margin-bottom:10px;
		}
	</style>
	<c:if test="${ param.correct eq false }">
	<script>
		alert('학번(교번, 직원 번호)와 이메일에 대한 정보가 없습니다. 다시 입력해주세요.');
	</script>
	</c:if>
</head>
<body>
  <%@ include file="/WEB-INF/views/include/menu_for_guest.jsp" %>
  <div >
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>

  	<div class="search">
  	<br>
	<h1><center>비밀번호 초기화 서비스</center></h1>
	<h5><center>이메일을 통해 초기화된 비밀번호를 보내드립니다.</center></h5>

	<hr style="border: solid 1px" align="center" width="400" />

	  <form:form method="post" modelAttribute="user">  
		<div align="center" margin-bottom:10px;>
			<form:input type="text" path="number" placeholder="아이디 입력(교번/학번)" style="width:350px; padding:5px; margin-bottom:5px" />
		</div>
		<div align="center">
			<form:input type="email" path="email" placeholder="이메일 입력" style="width:350px; padding:5px;margin-bottom:5px" />
		</div>
		<div align="center">
			<button type="submit" class="btn btn-info" style="width: 171px; padding:5px; margin-right : 5px;" ><i class="glyphicon glyphicon-envelope"></i> 이메일 보내기</button>
			<a href="${R}guest/login"><button type="button" class="btn btn-info" style="width: 172px; padding:5px;" ><i class="glyphicon glyphicon-flag"></i> 로그인 화면으로</button></a>
		</div>
			

	<hr style="border: solid 1px" align="center" width="400" />
	<div align="center">
    	<p>-신규계정( 신/편입생 ) 초기 비밀번호는 a+휴대폰 뒷자리4개  ex> a5906</p>
        <p>-아이디( 교번/학번 ) , 이메일을 입력한 후 등록되어 있는 정보와 일치하면 <br>초기화된 비밀번호를 포함한 메일 발송</p>
		<p>-비밀번호는 "a+휴대폰 뒷자리 4개 " 로 초기화 됩니다.
		<br>
		<br>
	</div>
   </div>
   
	</form:form>

   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
