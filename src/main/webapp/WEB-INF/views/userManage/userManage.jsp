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

		td{ padding:5px;}
    .userEntity{
      padding-left : 5px;
      padding-right : 5px;
      padding-top : 5px;
      padding-bottom : 5px;
      border : 1px solid #A4A4A4;
      background-color : #D8D8D8;
      font-weight : bold;
      text-align : center;
    }
    .userValue{
      padding-left : 5px;
      padding-right : 5px;
      padding-top : 5px;
      padding-bottom : 5px;
    }
    tbody tr:hover {
      background-color: #EFFBFB;
      cursor : pointer;
    }
   </style>
 </head>

 <body>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="index.html"><img src="img\title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="index.html">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">참여마당
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="notice.html">공지사항</a></li>
              <li><a href="question.html">건의사항</a></li>
            </ul>
        </li>
        <li>
          <a href="intro.html">멘토링 사업소개</a>
        </li>
         <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="menti_apli.html">멘티 신청</a></li>
              <li><a href="mento_apli.html">멘토 신청</a></li>
              <li><a href="mento_list.html">멘토/멘티 목록</a></li>
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
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="mento_open.html">멘토링 개설/폐쇄</a></li>
              <li ><a href="report_confirm.html">보고서 확인</a></li>
              <li><a href="survey_manage.html">설문조사 관리</a></li>
              <li><a href="candidate_boolean.html">멘토, 멘티 신청기간 여부</a></li>
              <li class="active"><a href="student_manage.html">회원 목록 관리</a></li>
              <li><a href="intro_update.html">사업 안내문 수정</a></li>
            </ul>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="login.html"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
        <li><a href="sign.html"><i class="glyphicon glyphicon-pencil"> 회원가입</i></a></li>
      </ul>
    </div>
  </nav>
   <div>
        <img src="img/topimage.jpg" class="img-responsive"/>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md-3">
          <h1 class="my-4"><strong>사이트 관리</strong></h1>
          <div class="list-group">
            <a href="mento_open.html" class="list-group-item ">멘토링 개설/폐쇄</a>
            <a href="report_confirm.html" class="list-group-item">보고서 확인</a>
            <a href="survey_manage.html" class="list-group-item ">설문조사 관리</a>
            <a href="candidate_boolean.html" class="list-group-item ">멘토, 멘티 신청기간 여부</a>
            <a href="student_manage.html" class="list-group-item active">회원 목록 관리</a>
            <a href="intro_update.html" class="list-group-item ">사업 안내문 수정</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-md-9">

          <!-- Introduction Row -->
          <h1 class="my-4"><strong>회원 목록 관리</strong></h1>
          <br/>
           <div class="row search">
              <form class="form-inline" align="right">
                <select class="form-control">
                  <option>id</option>
                  <option>학번</option>
                  <option>학과</option>
                  <option>학년</option>
                </select>
                <input type="text" class="form-control" id="searchKeyword" placeholder="검색어를 입력하세요."/>
                <button type="button" class="btn btn-primary"><i class="glyphicon glyphicon-search"> 검색하기</i></button>
              </form>
          </div>
          <p></p>
		  <table class="table table-bordered">
          <thead class="userEntity">
            <tr>
  			      <th>id</th>
              <th>학번(교번, 직번)</th>
              <th>이름</th>
              <th>학과</th>
              <th>사용자유형</th>
            </tr>
          </thead>
          <tbody>
            <tr>
            	<td>1</td>
              <td>201332001</td>
              <td><a href="student_manage_info.html">강인성</a></td>
              <td>소프트웨어공학과</td>
              <td>학생(멘토)</td>
            </tr>
            <tr>
            	<td>2</td>
              <td>201332028</td>
              <td>장승훈</td>
              <td>소프트웨어공학과</td>
              <td>학생(멘토)</td>
            </tr>
            <tr>
            	<td>3</td>
              <td>201332031</td>
              <td>전현우</td>
              <td>소프트웨어공학과</td>
              <td>학생(멘토)</td>
            </tr>
            <tr>
            	<td>4</td>
              <td>201332029</td>
              <td>장재형</td>
              <td>소프트웨어공학과</td>
              <td>학생(멘토)</td>
            </tr>
            <tr>
            	<td>5</td>
              <td>2010329</td>
              <td>김회장</td>
              <td>소프트웨어공학과</td>
              <td>학생(회장)</td>
            </tr>
            <tr>
            	<td>6</td>
              <td>2011321</td>
              <td>이교수</td>
              <td>소프트웨어공학과</td>
              <td>교수</td>
            </tr>
            <tr>
            	<td>7</td>
              <td>2012345</td>
              <td>고직원</td>
              <td>이공계열 담당</td>
              <td>직원</td>
            </tr>
            <tr>
            	<td>8</td>
              <td>2013346</td>
              <td>김직원</td>
              <td>인문계열 담당</td>
              <td>직원</td>
            </tr>
            <tr>
            	<td>9</td>
              <td>201501111</td>
              <td>도끼</td>
              <td>랩공학과</td>
              <td>학생(멘티)</td>
            </tr>
            <tr>
            	<td>10</td>
              <td>201462394</td>
              <td>빈지노</td>
              <td>힙합공학과</td>
              <td>학생(멘티)</td>
            </tr>
          </tbody>
          </table>
          <div align="center">
            <nav aria-label="Page navigation">
              <ul class="pagination">
                <li>
                  <a href="#" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                  </a>
                </li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">6</a></li>
                <li><a href="#">7</a></li>
                <li><a href="#">8</a></li>
                <li><a href="#">9</a></li>
                <li><a href="#">10</a></li>
                <li>
                  <a href="#" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                  </a>
                </li>
              </ul>
            </nav>
            <button type="button" class="btn btn-primary" style="width: 350px; padding:5px" data-toggle="modal" data-target="#myModal">관리자 비밀번호 설정</button>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">관리자 비밀번호 설정</h4>
                  </div>
                  <div class="modal-body">
                    <h5>비밀번호는 매달 10일이 되면 메인 관리자가 변경을 해주셔야 합니다.</h5>
                    <h5>현재 비밀번호는 q1w2e3r4입니다.</h5>
                  </div>
                  <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                      <label>비밀번호:  </label>
                      <input type="password" class="form-control" placeholder="비밀번호" id="password" >
                      <p class="help-block text-danger"></p>
                    </div>
                  </div>
          		    <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                      <label>비밀번호 확인:  </label>
                      <input type="password" class="form-control" placeholder="비밀번호" id="password2" >
                      <p class="help-block text-danger"></p>
                    </div>
                  </div>
                  <div class="modal-footer">
                    <button type="button" class="btn btn-success" data-dismiss="modal">설정</button>
                    <button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
                  </div>
                </div>
              </div>
            </div>
          </div>


        </div>
      </div>
  </div>
  <hr/>
  <div class="row">
    <div class="col-md-3" align="center">
      <img src="img/skhuniv.jpg"/>
    </div>
    <div class="col-md-9">
      <p>08359 서울시 구로구 연동로 320 / 지하철 1, 7호선 온수역(성공회대입구역)</p>
      <p><i class="glyphicon glyphicon-earphone"></i> TEL : 02-2610-4114 &nbsp&nbsp|&nbsp&nbsp <i class="glyphicon glyphicon-print"></i> FAX : 02-2683-8858</p>
    </div>
  </div>





 </body>
</html>
