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
        <li class="dropdown ">
          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <sec:authorize access="not authenticated">
	        	<li><a href="${R}guest/notice/list?id=1">공지사항</a></li>
	        	<li><a href="${R}guest/login">참여마당</a></li>
	      	</sec:authorize>
	        <sec:authorize access="authenticated">
	        	<li><a href="${R}user/notice/list?id=1">공지사항</a></li>
	        	<li><a href="${R}user/notice/list?id=2">참여마당</a></li>
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
              <li><a href="menti_apli.html">멘티 신청</a></li>
              <li class="active"><a href="mento_apli.html">멘토 신청</a></li>
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
          <h1 class="my-4"><strong>멘토링</strong></h1>
          <div class="list-group">
            <a href="menti_apli.html" class="list-group-item ">멘티 신청</a>
            <a href="mento_apli" class="list-group-item active">멘토 신청</a>
            <a href="mento_list.html" class="list-group-item">멘토/멘티 목록</a>
            
          </div>
        </div>
        <!-- /.col-lg-3 -->
        <div class="col-md-9">
      <!-- Introduction Row -->
          <h1 class="my-4"><strong>멘토 신청</strong></h1>
          <hr/>
          <sec:authorize access="hasAnyRole({'ROLE_MENTI', 'ROLE_STUDCHAIRMAN'})">
          <div class="row">
            <div class="col-md-12">
              <h2><b>현황 확인</b></h2>
              <hr/>
              <table class="table table-bordered">
                <thead class="table_first">
                  <tr>
                    <td>번호</td>
                    <td>멘토링 이름</td>
                    <td>과목</td>
                    <td>멘토 이름</td>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach var="mento" items="${mentos}">
                  	<tr>
                  		<td>${mento.id }</td>
                  		<td>${mento.teamName }</td>
                  		<td>${mento.subject }</td>
                  		<td>${mento.name }</td>
                  	</tr>
                  </c:forEach>
                </tbody>
              </table>
              <button class="btn btn-warning" type="button" data-toggle="collapse" data-target="#mentoApplicatilon"><i class="glyphicon glyphicon-plus"> 신청하기</i></button>
            </div>
          </div>
          </sec:authorize>
          <sec:authorize access="hasAnyRole({'ROLE_MENTI', 'ROLE_STUDCHAIRMAN'})">
          <!-- Team Members Row -->
          <div class="collapse" id="mentoApplicatilon">
            <hr/>
           
            <div class="row">
              <div class="col-md-12">
              <h2><b>멘토 신청</b></h2>
              <form:form method="post" modelAttribute="mento">
                <div class="application">
                    <div class="row">
                      <div class="col-md-2">
                        <label>이름</label>
                      </div>
                      <div class="col-md-8">
                        <sec:authentication property="user.userName"/>
                      </div>
                    </div>
                    <br/>
                    <div class="row">
                      <div class="col-md-2">
                        <label>멘토링 교과목(주제)</label>
                      </div>
                      <div class="col-md-8">
                      	<form:input path="subject" />
                        <input type="text" class="form-control" placeholder="멘토링 교과목(주제)" id="title" style="width : 300px;">
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-md-2">
                        <label>팀 이름</label>
                      </div>
                      <div class="col-md-8">
                        <input type="text" class="form-control" placeholder="적당한 팀 이름" id="teamName" style="width : 300px;">
                      </div>
                    </div>
                    <br/>
                    <br/>
                    <div class="row">
                      <label style="vertical-align: top;">주제 소개(팀 광고)</label>
                    </div>
                    <div class="row">
                      <div class="col-md-12">
                        <textarea rows="5" cols="100" class="form-control" placeholder="간단한 주제 소개" id="message"></textarea>
                      </div>
                    </div>
                    <br/>
                    <div class="row">
                      <div class="col-md-2">
                        <label>팀 광고물</label>
                      </div>
                      <div class="col-md-10">
                        <input type="file" class="form-control" id="teamAdvertise">
                      </div>
                    </div>
                    <br/>
                    <div class="row">
                      <div class="col-md-2">
                        <label>자격 증명</label>
                      </div>
                      <div class="col-md-8">
                        <input type="text" class="form-control" placeholder="과목 학점 혹은 자격 사항을 입력하세요." id="qualific" style="width : 300px;">
                      </div>
                    </div>
                    <br/>
                    <div class="row">
                      <div class="col-md-2">
                        <label>자격 증명 사진</label>
                      </div>
                      <div class="col-md-10">
                        <input type="file" class="form-control" id="qualificImage">
                      </div>
                    </div>
                    <br/>
                      <div class="row">
                        <div class="col-md-12">
                          <label>가능한 시간대</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          
                            <h3>월</h3>
                            <div class="row">
                              <div class="col-md-2 impossible <c:if test="${ timetable.mon1 eq true }">available</c:if>">
                                     9:00<br/>~<br/>10:30
                              </div>
	                          <div class="col-md-2 impossible <c:if test="${ timetable.mon2 eq true }">available</c:if>">
	                                10:30<br/>~<br/>12:00
	                          </div>
	                          <div class="col-md-1 impossible <c:if test="${ timetable.mon3 eq true }">available</c:if>">
	                                12:00<br/>~<br/>13:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.mon4 eq true }">available</c:if>">
                                    13:00<br/>~<br/>14:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.mon5 eq true }">available</c:if>">
                                    14:00<br/>~<br/>15:00
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.mon6 eq true }">available</c:if>">
                                     15:00<br/>~<br/>16:30
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.mon7 eq true }">available</c:if>">
                                     16:30<br/>~<br/>18:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.mon8 eq true }">available</c:if>">
                                     18:00<br/>~<br/>21:00
                              </div>
                            </div>
                            <br/>
                        </div>     
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          
                            <h3>화</h3>
                            <div class="row">
                              <div class="col-md-2 impossible <c:if test="${ timetable.tue1 eq true }">available</c:if>">
                                     9:00<br/>~<br/>10:30
                              </div>
	                          <div class="col-md-2 impossible <c:if test="${ timetable.tue2 eq true }">available</c:if>">
	                                10:30<br/>~<br/>12:00
	                          </div>
	                          <div class="col-md-1 impossible <c:if test="${ timetable.tue3 eq true }">available</c:if>">
	                                12:00<br/>~<br/>13:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.tue4 eq true }">available</c:if>">
                                    13:00<br/>~<br/>14:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.tue5 eq true }">available</c:if>">
                                    14:00<br/>~<br/>15:00
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.tue6 eq true }">available</c:if>">
                                     15:00<br/>~<br/>16:30
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.tue7 eq true }">available</c:if>">
                                     16:30<br/>~<br/>18:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.tue8 eq true }">available</c:if>">
                                     18:00<br/>~<br/>21:00
                              </div>
                            </div>
                            <br/>
                        </div>     
                      </div>
                        <div class="row">
                        <div class="col-md-12">
                          
                            <h3>수</h3>
                            <div class="row">
                              <div class="col-md-2 impossible <c:if test="${ timetable.wed1 eq true }">available</c:if>">
                                     9:00<br/>~<br/>10:30
                              </div>
	                          <div class="col-md-2 impossible <c:if test="${ timetable.wed2 eq true }">available</c:if>">
	                                10:30<br/>~<br/>12:00
	                          </div>
	                          <div class="col-md-1 impossible <c:if test="${ timetable.wed3 eq true }">available</c:if>">
	                                12:00<br/>~<br/>13:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.wed4 eq true }">available</c:if>">
                                    13:00<br/>~<br/>14:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.wed5 eq true }">available</c:if>">
                                    14:00<br/>~<br/>15:00
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.wed6 eq true }">available</c:if>">
                                     15:00<br/>~<br/>16:30
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.wed7 eq true }">available</c:if>">
                                     16:30<br/>~<br/>18:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.wed8 eq true }">available</c:if>">
                                     18:00<br/>~<br/>21:00
                              </div>
                            </div>
                            <br/>
                        </div>     
                      </div>                    
                      <div class="row">
                        <div class="col-md-12">
                          
                            <h3>목</h3>
                            <div class="row">
                              <div class="col-md-2 impossible <c:if test="${ timetable.thu1 eq true }">available</c:if>">
                                     9:00<br/>~<br/>10:30
                              </div>
	                          <div class="col-md-2 impossible <c:if test="${ timetable.thu2 eq true }">available</c:if>">
	                                10:30<br/>~<br/>12:00
	                          </div>
	                          <div class="col-md-1 impossible <c:if test="${ timetable.thu3 eq true }">available</c:if>">
	                                12:00<br/>~<br/>13:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.thu4 eq true }">available</c:if>">
                                    13:00<br/>~<br/>14:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.thu5 eq true }">available</c:if>">
                                    14:00<br/>~<br/>15:00
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.thu6 eq true }">available</c:if>">
                                     15:00<br/>~<br/>16:30
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.thu7 eq true }">available</c:if>">
                                     16:30<br/>~<br/>18:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.thu8 eq true }">available</c:if>">
                                     18:00<br/>~<br/>21:00
                              </div>
                            </div>
                            <br/>
                        </div>     
                      </div>
                      
                      <div class="row">
                        <div class="col-md-12">
                          
                            <h3>금</h3>
                            <div class="row">
                              <div class="col-md-2 impossible <c:if test="${ timetable.fri1 eq true }">available</c:if>">
                                     9:00<br/>~<br/>10:30
                              </div>
	                          <div class="col-md-2 impossible <c:if test="${ timetable.fri2 eq true }">available</c:if>">
	                                10:30<br/>~<br/>12:00
	                          </div>
	                          <div class="col-md-1 impossible <c:if test="${ timetable.fri3 eq true }">available</c:if>">
	                                12:00<br/>~<br/>13:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.fri4 eq true }">available</c:if>">
                                    13:00<br/>~<br/>14:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.fri5 eq true }">available</c:if>">
                                    14:00<br/>~<br/>15:00
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.fri6 eq true }">available</c:if>">
                                     15:00<br/>~<br/>16:30
                              </div>
                              <div class="col-md-2 impossible <c:if test="${ timetable.fri7 eq true }">available</c:if>">
                                     16:30<br/>~<br/>18:00
                              </div>
                              <div class="col-md-1 impossible <c:if test="${ timetable.fri8 eq true }">available</c:if>">
                                     18:00<br/>~<br/>21:00
                              </div>
                            </div>
                            <br/>
                        </div>     
                      </div>
                      
                      <hr/>
                    <div class="row">
                      <div class="col-md-12 information">
                        <p> ⊙ 시간표 조율은 수업이 없는 날만 체크하는 것이 아닙니다. 멘토가 가능한 시간들을 조율해서 체크해주시길 바랍니다.</p>
                        <p> ⊙ 자격 증명이 허위인 경우에는 멘토 참여에 지장이 있으니 사실적으로 보내주시길 바랍니다. </p>
                        <p> ⊙ 팀 광고물은 딱히 안 올리셔도 되지만 주제소개에 어떤 것을 강의할지에 대해서 구체적으로 적어주시길 바랍니다.</p>
                        <p> ⊙ 멘토링 주제가 적당하지 않는 경우에는 참여에 지장이 있습니다. 이는 동아리를 통해서 참여하시길 바랍니다.</p>
                        <p> ⊙ 시간표는 myPage에서 설정할 수 있습니다.</p>
                      </div>
                    </div>
                    <div style="margin-top: 40px">
                      <p><h3>멘토 신청하시려면 밑에 신청 버튼을 눌러 주세요.</h3></p>
                      <button type="submit" class="btn btn-primary">신청</button>
                      <button class="btn btn-primary" type="button" data-toggle="collapse" data-target="#mentoApplicatilon">취소</button>
                    </div>
                	</div>
                </form:form>
              </div>
            </div>
          </div>
        </div>
      </sec:authorize>
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

