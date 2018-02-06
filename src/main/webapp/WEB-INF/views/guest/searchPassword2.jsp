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
		alert('인증번호가 올바르지 않습니다. 다시 입력해주세요.');
	</script>
	</c:if>
</head>
<body>
  <%@ include file="/WEB-INF/views/include/menu_for_guest.jsp" %>
  <div >
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>
	<form:form method="post" modelAttribute="user">
  	<div class="search">
  	<br>
	<h1><center>인증번호 입력</center></h1>
	<h5><center>인증번호 확인시 비밀번호 초기화.</center></h5>

	<hr style="border: solid 1px" align="center" width="400" />

	    
			<div align="center" margin-bottom:10px;>
		<form:input type="text" path="number" placeholder="아이디 입력(교번/학번) " style="width:350px; padding:5px; margin-bottom:5px" />
		</div>
		<div align="center">
			<form:input type="password" path="number2" placeholder="인증번호" style="width:350px; padding:5px;margin-bottom:5px" />
		</div>
	
		<div align="center">
			<button type="submit" class="btn btn-primary" style="width: 350px; padding:5px" >비밀번호 초기화</button>
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
