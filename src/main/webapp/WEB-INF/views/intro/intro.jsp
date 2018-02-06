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
    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!-- Custom styles for this template -->
    <link href="css/clean-blog.min.css" rel="stylesheet">
    <style>
      div.row{
        margin-left : auto;
        margin-right : auto;
      }

      .container { margin-top: 30px;  }

      a:hover, a:visited, a:link, a:active {
        text-decoration: none;
      }

      .controls {
        margin-bottom: 10px;
      }

      .collapse-group {
        padding: 10px;
        border: 1px solid darkgrey;
        margin-bottom: 10px;
      }

      .panel-title .trigger:before {
        content: '\e082';
        font-family: 'Glyphicons Halflings';
        vertical-align: text-bottom;
      }

      .panel-title .trigger.collapsed:before {
        content: '\e081';
      }
      .calendar{
        border : 1px solid #81F7F3;
        border-radius : 15px;
        background-color : #E0F8F7;
      }
      .calendarImage{
        border-radius : 15px;
        margin-left : 20px;
        margin-right : 20px;
        margin-top : 20px;
        margin-bottom : 20px;
      }
      .table{
        width : 95%;
        text-align : center;
        margin-left : 20px;
        margin-right : 20px;
        margin-top : 20px;
        margin-bottom : 20px;
      }
   </style>
 </head>

 <body>
  <sec:authorize access="not authenticated">
  	<%@ include file="/WEB-INF/views/include/menu_for_guest.jsp" %>
  </sec:authorize>
  <sec:authorize access="authenticated">
  	<%@ include file="/WEB-INF/views/include/menu_for_user.jsp" %>
  </sec:authorize>
  <div>
      <img src="${R}img/topimage.jpg" class="img-responsive"/>
  </div>
  <div class="container">

      <div class="row">
        <div class="col-md-12">
          <h1 class="my-4" style="font-size: 40px; font-weight:700; font-style: italic;"><strong>멘토링 사업소개</strong></h1>
          <div class="collapse-group">
            <div class="controls">
              <button class="btn btn-primary open-button" type="button">
                <i class="glyphicon glyphicon-fullscreen"> 모두펼치기</i>
              </button>
              <button class="btn btn-primary close-button" type="button">
                <i class="glyphicon glyphicon-resize-small"> 모두접기</i>
              </button>
            </div>
			<c:forEach var="title" items="${titles}">
	            <div class="panel panel-info">
	              <div class="panel-heading" role="tab" id="headingOne">
	                <h4 class="panel-title">
	                  <a role="button" data-toggle="collapse" href="#list${title.id}" aria-expanded="true" class="trigger collapsed">
	                    <strong>${title.title}</strong>
	                  </a>
	                </h4>
	              </div>
	              <div id="list${title.id}" class="panel-collapse collapse" role="tabpanel">
	                <div class="panel-body">
	                  <ul>
	                  	<c:forEach var="detail" items="${title.details}">
	                    	<li> ${detail.detail}</li>
	                    </c:forEach>
	                  </ul>
	                </div>
	              </div>
	            </div>
			</c:forEach>
          </div>
        </div>
      </div>
      <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
	      	<a href="${R}user/intro/titleList"><button class="btn btn-primary"><i class="glyphicon glyphicon-list-alt"></i> 소개문 편집하러 가기</button></a>
	  </sec:authorize>
      <hr/>
      <div class="row">
        <div class="col-md-12">
          <h1 class="my-4" style="font-size: 40px; font-weight:700; font-style: italic;"><strong>일정 안내</strong></h1>
        </div>
      </div>
      <div class="row calendar">
        <div class="col-md-4">
          <img src="${R}img\onenote01.png" class="img-responsive calendarImage" />
        </div>
        <div class="col-md-8">
          <table class="table" align="center">
          	<c:forEach var="schedule" items="${schedules}">
	          	<tr>
	              <td>${ schedule.startDate }</td>
	              <td>~</td>
	              <td>${ schedule.endDate }</td>
	              <td>${ schedule.context }</td>
	            </tr>
          	</c:forEach>
            <tr>
              <td colspan="4" align="left">
                <ul>
                  <li>기본적으로 12회 멘토링을 하는데 누적 24시간 이수해야 합니다.</li>
                  <li>여건이 안 된다면 횟수는 제한 없이 24시간 이수해도 상관 없습니다.</li>
                  <li>멘토링 인원은 5명이 기본이지만, 최소 3명부터 최대 10명까지 가능합니다.</li>
                  <li>멘토링 이수 시간이 24시간 초과되면 우수 멘토링 대상에서 제외되오니 일정 조정을 최대한 맞추시길 바라겠습니다.</li>
                </ul>
              </td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <script>
     $(".open-button").on("click", function() {
       $(this).closest('.collapse-group').find('.collapse').collapse('show');
     });

     $(".close-button").on("click", function() {
       $(this).closest('.collapse-group').find('.collapse').collapse('hide');
     });
    </script>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
