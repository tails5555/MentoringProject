<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
      .mentoProfile{
        padding-top : 30px;
        padding-bottom : 20px;
        padding-left : 10px;
        padding-right : 10px;
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



        .container > .switch {

          display: block;

          margin: 12px auto;


          }

          .switch {
            margin-left: 40px;
            margin-bottom: 20px;

            position: relative;

            display: inline-block;

            vertical-align: top;

            width: 70px;

            height: 40px;

            padding: 3px;

            background-color: white;

            border-radius: 30px;

            box-shadow: inset 0 -1px white, inset 0 1px 1px rgba(0, 0, 0, 0.05);

            cursor: pointer;

            background-image: -webkit-linear-gradient(top, #eeeeee, white 25px);

            background-image: -moz-linear-gradient(top, #eeeeee, white 25px);

            background-image: -o-linear-gradient(top, #eeeeee, white 25px);

            background-image: linear-gradient(to bottom, #eeeeee, white 25px);

          }

          .switch-input {

            position: absolute;

            top: 0;

            left: 0;

            opacity: 0;

          }

          .switch-label {

            position: relative;

            display: block;

            height: inherit;

            font-size: 14px;

            text-transform: uppercase;

            background: #eceeef;

            border-radius: inherit;

            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.12), inset 0 0 2px rgba(0, 0, 0, 0.15);

            -webkit-transition: 0.15s ease-out;

            -moz-transition: 0.15s ease-out;

            -o-transition: 0.15s ease-out;

            transition: 0.15s ease-out;

            -webkit-transition-property: opacity background;

            -moz-transition-property: opacity background;

            -o-transition-property: opacity background;

            transition-property: opacity background;

          }

          .switch-label:before, .switch-label:after {

            position: absolute;

            top: 50%;

            margin-top: -.5em;

            line-height: 1;

            -webkit-transition: inherit;

            -moz-transition: inherit;

            -o-transition: inherit;

            transition: inherit;

          }

          .switch-label:before {

            content: attr(data-off);

            right: 11px;

            color: #aaa;

            text-shadow: 0 1px rgba(255, 255, 255, 0.5);

          }

          .switch-label:after {

            content: attr(data-on);

            left: 11px;

            color: white;

            text-shadow: 0 1px rgba(0, 0, 0, 0.2);

            opacity: 0;

          }
          .switch-input:checked ~ .switch-label {

            background: #47a8d8;

            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.15), inset 0 0 3px rgba(0, 0, 0, 0.2);

          }

          .switch-input:checked ~ .switch-label:before {

            opacity: 0;

          }

          .switch-input:checked ~ .switch-label:after {

            opacity: 1;

          }
        .title{
          font-size: 20px;
        }
       .section{
        text-align: center;
        margin-top: 50px


       }

       .during{
        text-align: center;
       }
   </style>
   <script src="text/javascript">
     $('#myTab a').click(function (e) {
      e.preventDefault()
      $(this).tab('show')
    })

   </script>
   <script>
   $(function() {
	   $("[data-confirm-apply]").click(function() {
	     return confirm("멘토링을 승인합니다. 계속 하시겠습니까?");
	   })
	   $("[data-confirm-cancel]").click(function() {
	     return confirm("신청한 멘토의 기록이 사라집니다. 계속 하시겠습니까?");
	   })
	})

   </script>
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
              <li ><a href="menti_apli.html">멘티 신청</a></li>
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
        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li class="active"><a href="${R}user/mento_open">멘토링 개설/폐쇄</a></li>
              <li><a href="report_confirm.html">보고서 확인</a></li>
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
           <a href="${R}user/mento_open" class="list-group-item active ">멘토링 개설/폐쇄</a>
            <a href="report_confirm.html" class="list-group-item ">보고서 확인</a>
            <a href="${R}user/survey" class="list-group-item ">설문조사 관리</a>
            <a href="${R}user/schedule" class="list-group-item  ">멘토, 멘티 신청기간 여부</a>
            <a href="${R}user/list" class="list-group-item ">회원 목록 관리</a>
            <a href="${R}user/intro/titleList" class="list-group-item ">사업 안내문 수정</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->
        <div class="col-md-9">
          
       <h1 class="my-4"><strong>멘토링 개설/폐쇄</strong></h1>
          <hr/>
          <div role="tabpanel">
            <ul class="nav nav-tabs" role="tablist">
            <c:forEach var="mento" items="${mentos}" varStatus="status">
              <li role="presentation" <c:if test="${status.index eq 0 }">class="active"</c:if>><a href="#mentoring${mento.id}" role="tab" data-toggle="tab">${mento.teamName}</a></li>
            </c:forEach>  
            </ul>
            <div class="tab-content mentoProfile">
              <c:forEach var="mento" items="${mentos}" varStatus="status">
              <div role="tabpanel" class="tab-pane fade in <c:if test="${status.index eq 0 }">active</c:if>" id="mentoring${mento.id}">
                <div class="row">
                  <div class="col-md-4 col-sm-6 text-center mb-4">
                    <img class="rounded-circle img-fluid d-block mx-auto" src="http://placehold.it/200x200" alt="">
                    <h3>${mento.name}
                      <small>소프트웨어 공학과</small>
                    </h3>
                    <p>${mento.advertiseContext }</p>
                  </div>
                  <div class="col-md-8">
                    <table class="table-bordered" width="100%">
                      <tr>
                        <td class="entity">멘토링 주제</td>
                        <td colspan="3" class="context">${mento.subject }</td>
                      </tr>
                      <tr>
                        <td class="entity">전화번호</td>
                        <td colspan="3" class="context">${mento.phoneNumber }</td>
                      </tr>
                      <tr>
                        <td class="entity">이메일</td>
                        <td colspan="3" class="context">${mento.email }</td>
                      </tr>
                      <tr>
                        <td class="entity">멘토링 자격 증명</td>
                        <td colspan="3" class="context">${mento.qualificContext }</td>
                      </tr>
                      <c:if test="${mento.advFileName ne null }">
                      <tr>
                      	<td colspan="4" class="entity">
                      		팀 광고 파일
                      	</td>
                      </tr>
                      <tr>
                      	<td colspan="4" class="context">
                      		<i class="glyphicon glyphicon-floppy-disk"></i> <a href="${R}user/mento_open/advDownload?id=${mento.advId }">${mento.advFileName }</a>
                      	</td>
                      </tr>
                      </c:if>
                      <c:if test="${mento.quaFileName ne null }">
                      <tr>
                      	<td colspan="4" class="entity">
                      		자격 증명 파일
                      	</td>
                      </tr>
                      <tr>
                      	<td colspan="4" class="context">
                      		<i class="glyphicon glyphicon-floppy-disk"></i> <a href="${R}user/mento_open/quaDownload?id=${mento.quaId }">${mento.quaFileName }</a>
                      	</td>
                      </tr>
                      </c:if>
                      <tr>
                        <td colspan="4" class="entity">
                        	  멘티 목록
                        </td>
                      </tr>

                      <tr>
                        <td class="entity">학번</td>
                        <td class="entity">이름</td>
                        <td class="entity">이메일</td>
                        <td class="entity">멘티 승인</td>
                      </tr>
                      <tr>
                        <td class="context">201732000</td>
                        <td class="context">멘티1</td>
                        <td class="context">email@email.com</td>

                        <td><label for="r1" style="margin-left: 20px">승인</label>
                        <input id="r1" type="radio" name="menti1" value="1" checked />

                        <label for="r2" style="margin-left: 10px">거부</label>
                        <input id="r2" type="radio" name="menti1" value="2" />
                        </td>
                      </tr>
                      <tr>
                        <td class="context">201732000</td>
                        <td class="context">멘티2</td>
                        <td class="context">email@email.com</td>
                         <td><label for="r1" style="margin-left: 20px">승인</label>
                        <input id="r1" type="radio" name="menti2" value="1" checked />

                        <label for="r2" style="margin-left: 10px">거부</label>
                        <input id="r2" type="radio" name="menti2" value="2" />
                      </td>


                      </tr>
                      <tr>
                        <td class="context">201732000</td>
                        <td class="context">멘티3</td>
                        <td class="context">email@email.com</td>
                        <td><label for="r1" style="margin-left: 20px">승인</label>
                        <input id="r1" type="radio" name="menti3" value="1" checked />

                        <label for="r2" style="margin-left: 10px">거부</label>
                        <input id="r2" type="radio" name="menti3" value="2" />
                      </td>
                    </tr>
                    <tr>
                        <td class="context">201732000</td>
                        <td class="context">멘티4</td>
                        <td class="context">email@email.com</td>
                        <td><label for="r1" style="margin-left: 20px">승인</label>
                        <input id="r1" type="radio" name="menti4" value="1" checked />

                        <label for="r2" style="margin-left: 10px">거부</label>
                        <input id="r2" type="radio" name="menti4" value="2" />
                      </td>
                    </tr>
                    </table>
                  </div>
                </div>
                <br/>
            	<div  align="right" style="margin-right: 10px">
				<c:choose>
				    <c:when test="${mento.mentoGroupId eq -1 }">
				        <a href="${R}user/mento_open/insert?id=${mento.id}"><button type="button" class="btn btn-primary" data-confirm-apply><i class="glyphicon glyphicon-ok">개설</i></button></a>
				    </c:when>
				    <c:otherwise>
				       	<button type="button" class="btn btn-success"><i class="glyphicon glyphicon-ok">이미 승인된 멘토입니다.</i></button>
				    </c:otherwise>
				</c:choose>
	                <a href="${R}user/mento_open/delete?id=${mento.id}"><button type="button" class="btn btn-danger" data-confirm-cancel><i class="glyphicon glyphicon-remove">폐쇄</i></button></a>
              	</div>
              	</div>
				</c:forEach>
	          </div>
	          
	      </div>
          
		

       
          <!-- Introduction Row -->
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