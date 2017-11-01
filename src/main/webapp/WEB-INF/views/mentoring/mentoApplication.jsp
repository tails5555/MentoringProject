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
          <a class="dropdown-toggle" data-toggle="dropdown">참여마당
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li ><a href="notice.html">공지사항</a></li>
              <li><a href="question.html">건의사항</a></li>
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
	      <li><sec:authentication property="user.userName" />님 환영합니다.</li>
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
            <a href="mento_apli.html" class="list-group-item active">멘토 신청</a>
            <a href="mento_list.html" class="list-group-item">멘토/멘티 목록</a>
            <a href="mento_board.html" class="list-group-item">멘토링 게시판</a>
            <a href="survey.html" class="list-group-item">설문조사</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->
        
        <div class="col-md-9">
      <!-- Introduction Row -->
          <h1 class="my-4"><strong>멘토 신청</strong></h1>
          <hr/>
          <sec:authorize access="hasRole('ROLE_MENTO')">
          <div class="row">
            <div class="col-md-12">
            
              <h2><b>현황 확인</b></h2>
              <hr/>
              <table class="table table-bordered">
                <thead class="table_first">
                  <tr>
                    <td>신청 시각</td>
                    <td>멘토링 이름</td>
                    <td>신청 현황</td>
                    <td>신청 결과</td>
                    <td>신청서 확인</td>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>2017/9/4 10:00AM</td>
                    <td>신나는 자바 프로그래밍</td>
                    <td>4/5</td>
                    <td>승인 대기</td>
                    <td><button class="btn btn-warning"><i class="glyphicon glyphicon-pencil"> 확인</button></td>
                  </tr>
                  <tr class="success">
                    <td>2017/9/4 11:00AM</td>
                    <td>자료구조가 빛나는 밤에</td>
                    <td>6/5</td>
                    <td>멘토 선정</td>
                    <td></td>
                  </tr>
                  <tr class="warning">
                    <td>2017/9/4 11:00AM</td>
                    <td>A+로 멈추고 싶던 C처럼</td>
                    <td>6/5</td>
                    <td>탈락</td>
                    <td></td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          </sec:authorize>
          <sec:authorize access="hasRole('ROLE_MENTI')">
          <!-- Team Members Row -->
            <div class="row">
              <div class="col-md-12">
              <h2><b>멘토 신청</b></h2>
              <form class="form-inline">
                <div class="application">
                  <form name="sentMessage" id="contactForm" novalidate>
                    <div class="row">
                      <div class="col-md-2">
                        <label>이름</label>
                      </div>
                      <div class="col-md-8">
                        <sec:authentication property="user.userName" />
                      </div>
                    </div>
                    <br/>
                    <div class="row">
                      <div class="col-md-2">
                        <label>멘토링 교과목(주제)</label>
                      </div>
                      <div class="col-md-8">
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
                    <div class="row">
                      <div class="col-md-3">
                        <label>간단한 자기 소개</label>
                      </div>
                      <div class="col-md-7">
                        <input type="text" class="form-control" placeholder="100자 이내로 작성해주세요." id="introduce" style="width : 400px;">
                      </div>
                    </div>
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
                    <form class="form-inline">
                      <div class="row">
                        <div class="col-md-12">
                          <label>가능한 시간대(멘토링이 가능한 시간대를 표시해주세요.)</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <form class="form-inline" name="monday_available">
                            <h3>월</h3>
                            <div class="row">
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> 9:00~10:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> 10:30~12:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> ~13:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> ~14:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> ~15:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> 15:00~16:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> 16:30~18:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="monCheck" /> 18:00~
                                  </label>
                                </div>
                              </div>
                            </div>
                          </form>
                          <br/>
                          <button id='monEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                          <button id='monClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                          <script>
                          $("#monEmpty").click(function() {
                            $("input[name=monCheck]:checkbox").prop("checked", true);
                            $("input[name=monCheck]:checkbox").parent().parent().parent().addClass("available");
                          });
                          $("#monClass").click(function() {
                            $("input[name=monCheck]:checkbox").prop("checked", false);
                            $("input[name=monCheck]:checkbox").parent().parent().parent().removeClass("available");
                          });
                          </script>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <form class="form-inline" name="tuesday_available">
                            <h3>화</h3>
                            <div class="row">
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> 9:00~10:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox" >
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> 10:30~12:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> ~13:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> ~14:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> ~15:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> 15:00~16:30
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-2 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> 16:30~18:00
                                  </label>
                                </div>
                              </div>
                              <div class="col-md-1 impossible">
                                <div class="checkbox">
                                  <label>
                                    <input type="checkbox" name="tueCheck" /> 18:00~
                                  </label>
                                </div>
                              </div>
                            </div>
                          </form>
                          <br/>
                          <button id='tueEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                          <button id='tueClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                          <script>
                          $("#tueEmpty").click(function() {
                            $("input[name=tueCheck]:checkbox").prop("checked", true);
                            $("input[name=tueCheck]:checkbox").parent().parent().parent().addClass("available");
                          });
                          $("#tueClass").click(function() {
                            $("input[name=tueCheck]:checkbox").prop("checked", false);
                            $("input[name=tueCheck]:checkbox").parent().parent().parent().removeClass("available");
                          });
                          </script>
                        </div>
                      </div>
                        <div class="row">
                          <div class="col-md-12">
                            <form class="form-inline" name="wednesday_available">
                              <br/>
                              <h3>수</h3>
                              <div class="row">
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> 9:00~10:30
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox" >
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> 10:30~12:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> ~13:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> ~14:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> ~15:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> 15:00~16:30
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> 16:30~18:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="wedCheck" /> 18:00~
                                    </label>
                                  </div>
                                </div>
                              </div>
                            </form>
                            <br/>
                            <button id='wedEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                            <button id='wedClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                            <script>
                            $("#wedEmpty").click(function() {
                              $("input[name=wedCheck]:checkbox").prop("checked", true);
                              $("input[name=wedCheck]:checkbox").parent().parent().parent().addClass("available");
                            });
                            $("#wedClass").click(function() {
                              $("input[name=wedCheck]:checkbox").prop("checked", false);
                              $("input[name=wedCheck]:checkbox").parent().parent().parent().removeClass("available");
                            });
                            </script>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <form class="form-inline" name="thursday_available">
                              <br/>
                              <h3>목</h3>
                              <div class="row">
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> 9:00~10:30
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox" >
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> 10:30~12:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> ~13:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> ~14:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> ~15:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> 15:00~16:30
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> 16:30~18:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="thuCheck" /> 18:00~
                                    </label>
                                  </div>
                                </div>
                              </div>
                            </form>
                            <br/>
                            <button id='thuEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                            <button id='thuClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                            <script>
                            $("#thuEmpty").click(function() {
                              $("input[name=thuCheck]:checkbox").prop("checked", true);
                              $("input[name=thuCheck]:checkbox").parent().parent().parent().addClass("available");
                            });
                            $("#thuClass").click(function() {
                              $("input[name=thuCheck]:checkbox").prop("checked", false);
                              $("input[name=thuCheck]:checkbox").parent().parent().parent().removeClass("available");
                            });
                            </script>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-md-12">
                            <form class="form-inline" name="friday_available">
                              <br/>
                              <h3>금</h3>
                              <div class="row">
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="friCheck" /> 9:00~10:30
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox" >
                                    <label>
                                      <input type="checkbox" name="friCheck" /> 10:30~12:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="friCheck" /> ~13:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="friCheck" /> ~14:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="friCheck" /> ~15:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="friCheck" /> 15:00~16:30
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-2 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="friCheck" /> 16:30~18:00
                                    </label>
                                  </div>
                                </div>
                                <div class="col-md-1 impossible">
                                  <div class="checkbox">
                                    <label>
                                      <input type="checkbox" name="friCheck" /> 18:00~
                                    </label>
                                  </div>
                                </div>
                              </div>
                            </form>
                            <br/>
                            <button id='friEmpty' type='button' class="btn btn-success"><i class="glyphicon glyphicon-plane"> 공강</i></button>
                            <button id='friClass' type='button' class="btn btn-success"><i class="glyphicon glyphicon-refresh"> 해제</i></button>
                            <script>
                            $("#friEmpty").click(function() {
                              $("input[name=friCheck]:checkbox").prop("checked", true);
                              $("input[name=friCheck]:checkbox").parent().parent().parent().addClass("available");
                            });
                            $("#friClass").click(function() {
                              $("input[name=friCheck]:checkbox").prop("checked", false);
                              $("input[name=friCheck]:checkbox").parent().parent().parent().removeClass("available");
                            });
                            </script>
                          </div>
                        </div>
                      </form>
                    <script>
                    $(document).ready(function() {
                      $("input:checkbox").on('click', function() {
                        if ( $(this).prop('checked') ) {
                          $(this).parent().parent().parent().addClass("available"); }
                        else { $(this).parent().parent().parent().removeClass("available"); }
                        });
                      });
                    </script>
                    <hr/>
                    <div class="row">
                      <div class="col-md-12 information">
                        <p> ⊙ 시간표 조율은 수업이 없는 날만 체크하는 것이 아닙니다. 멘토가 가능한 시간들을 조율해서 체크해주시길 바랍니다.</p>
                        <p> ⊙ 자격 증명이 허위인 경우에는 멘토 참여에 지장이 있으니 사실적으로 보내주시길 바랍니다. </p>
                        <p> ⊙ 팀 광고물은 딱히 안 올리셔도 되지만 주제소개에 어떤 것을 강의할지에 대해서 구체적으로 적어주시길 바랍니다.</p>
                        <p> ⊙ 멘토링 주제가 적당하지 않는 경우에는 참여에 지장이 있습니다. 이는 동아리를 통해서 참여하시길 바랍니다.</p>
                      </div>
                    </div>
                    <div style="margin-top: 40px">
                      <p><h3>멘토 신청하시려면 밑에 신청 버튼을 눌러 주세요.</h3></p>
                      <button type="submit" class="btn btn-primary">신청</button>
                      <a href="${R}user/index"><button class="btn btn-primary" type="button">취소</button></a>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </sec:authorize>
        </div>
        
        <sec:authorize access="hasRole('ROLE_PROFESSOR')">
	    <div class="col-md-9">
	    	<h1>관리자는 관리자 메뉴에서 설정해주시길 바랍니다.</h1>
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
