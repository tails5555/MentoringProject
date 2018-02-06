<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:url var="R" value="/" />


<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
 $(function(){
  $('#password1').keyup(function(){
   $('font[name=check]').text('');
  }); //#user_pass.keyup

  $('#password2').keyup(function(){
   if($('#password1').val()!=$('#password2').val()){
    $('font[name=check]').text('');
    $('font[name=check]').html("암호틀림");
   }else{
    $('font[name=check]').text('');
    $('font[name=check]').html("암호맞음");
   }
  }); //#chpass.keyup
 });
</script>

<script type="text/javascript">
 window.onload=function(){
	 
  document.getElementById('my-form').onsubmit=function(){

	  if($('#password1').val()!=$('#password2').val()){
		  alert('다시입력');
		     return false; 
   }
   
  }
 }
</script>

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
  <link rel="stylesheet" href="${R}res/common.css">
 <style>    
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
       .control-group{
       		margin-top: 30px;
       }
  </style>
</head>

 <body>
     <%@ include file="/WEB-INF/views/include/menu_for_guest.jsp" %>
  <div>
        <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>
  <div class="container">
    <form:form method="post" modelAttribute="user" class="form-inline" id="my-form" enctype="multipart/form-data">
      <!-- Introduction Row -->
      <h1 class="my-4"><strong>회원 가입</strong></h1>

      <hr/>

      <div class="application">


          <form name="sentMessage" id="contactForm" novalidate>
          
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>이름: </label>
                <form:input path="userName" type="text" class="form-control" placeholder="이름" id="name" required="required" />
                <p class="help-block text-danger"></p>
              </div>
            </div>

            <div class="control-group">
              <div class="form-group floating-label-form-group controls ">
                <label>학번: </label>
                <form:input path="studentNumber" type="text" class="form-control" placeholder="학번" id="studentNumber" required="required" />
                <p class="help-block text-danger"></p>
              </div>
            </div>


            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>비밀번호:  </label>
                <form:input path="password" type="password" class="form-control" placeholder="비밀번호" id="password1" required="required" />
                <p class="help-block text-danger"></p>
              </div>
            </div>

    		<div class="control-group ">
              <div class="form-group floating-label-form-group controls ">
                <label>비밀번호 확인:  </label>
                <form:input path="password2" type="password" class="form-control" placeholder="비밀번호" id="password2" required="required" />
                <font name="check" size="2" color="red"></font> 

                <p class="help-block text-danger"></p>
              </div>
            </div>

            <div class="form-group" style="margin-top: 20px" >
   			 <label>학과</label>
   			      <form:select path="departmentId" class="form-control w200"
                   itemValue="deptId" itemLabel="name" items="${ departments }" />

  			</div>
            <br/>
            <br/>
            
            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>이메일:  </label>
                <form:input path="email" type="email" class="form-control" placeholder="이메일" id="email" required="required" />
                <p class="help-block text-danger"></p>
              </div>
            </div>


            <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label>주소:  </label>
                <form:input path="address" type="text" class="form-control" placeholder="주소" id="address" required="required" />
                <p class="help-block text-danger"></p>
              </div>
            </div>

            <div>
			<label>핸드폰:  </label>
            <form:input path="phone1" type="text" id="phone1" size="5" required="required"/>
            -
            <form:input path="phone2" type="text" id="phone2" size="5" required="required"/>
            -
            <form:input path="phone3" type="text" id="phone3" size="5" required="required"/>
            <span class="help-block text-danger"></span>
			</div>

             <div class="control-group">
              <div class="form-group floating-label-form-group controls">
                <label style="vertical-align: top;">사진등록:  </label>
                <input type="file" name="uploadFile"/>
              </div>
            </div>

            <br/>

       <hr>






      <div style="margin-top: 40px">
        <p><h3>회원가입을 신청하시려면 밑에 신청 버튼을 눌러 주세요.</h3></p>
      <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-ok"> 신청</i></button>
      <a href="${R}guest/index"><button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-remove"> 취소</i></button></a>
      </div>

        </div>
        </form:form>
      </div>
   <%@ include file="/WEB-INF/views/include/footer.jsp" %>
</body>
</html>
