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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>

      .row {
        margin-left : auto;
        margin-right : auto;
      }

      .container {
        margin-top: 30px;
        margin-left : auto;
        margin-right : auto;
      }
      .information{
        padding-top : 10px;
        padding-bottom : 5px;
        background-color : #E6E6E6;
        border : 1px solid #D8D8D8;
        border-radius : 5px;
        text-align : left;
      }
      .reportEntity{
        padding-left : 10px;
        padding-right : 10px;
        padding-top : 12px;
        padding-bottom : 12px;
        border : 1px solid #A4A4A4;
        background-color : #D8D8D8;
        font-weight : bold;
        text-align : center;
      }
       .reportEntity2{
        padding-left : 10px;
        padding-right : 10px;
        padding-top : 5px;
        padding-bottom : 5px;
        border : 1px solid #A4A4A4;
        background-color : #D8D8D8;
        font-weight : bold;
        text-align : center;
      }
      .reportInput{
        padding-left : 5px;
        padding-right : 5px;
        padding-top : 5px;
        padding-bottom : 4px;
        border : 1px solid #A4A4A4;
      }
      .reportInput2{
        padding-left : 5px;
        padding-right : 5px;
        padding-top : 10px;
        padding-bottom : 7px;
        border : 1px solid #A4A4A4;
      }
      .mentiList{
        padding-top : 12px;
        padding-bottom : 11px;
        border : 1px solid #A4A4A4;
      }
      .mentoPicture{
        border : 1px solid #A4A4A4;
        background-color : #D8D8D8;
        text-align : center;
        font-weight : bold;
        padding-top : 10px;
        padding-bottom : 10px;
      }
      .mentoPictureDisplay{
        border : 1px solid #A4A4A4;
        padding-left : 20px;
        padding-right : 20px;
        padding-top : 20px;
        padding-bottom : 20px;
      }
      .upload{
        border : 1px solid #A4A4A4;
        background-color : #D8D8D8;
        font-weight : bold;
        padding-top : 7px;
        padding-bottom : 7px;
      }
      .complete{
        margin-top : 20px;
      }
      .input_time{
        width : 60px;
      }
      .inside_percent{
        padding-left : 0px;
        padding-right : 0px;
        border : 1px solid #58FA58;
      }
      .true_percent{
        border : 1px solid #58FA58;
        background-color : #A9F5BC;
        text-align : right;
      }
      .time{
      	display : inline;
      }
	  .number_input{
	  	width : 40px;
	  }
   </style>
   <script type="text/javascript">
    $(function () {
      $('[data-toggle="popover"]').popover();
    });
    $('#myModal').on('shown.bs.modal', function () {
      $('#myInput').focus()
    });
   </script>
 </head>

 <body>
   <nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
      <div class="navbar-header">
        <a class="navbar-brand" href="${R}user/index"><img src="${R}img/title.png"/></a>
      </div>
      <ul class="nav navbar-nav">
        <li><a href="${R}user/index">
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
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="mento_timetable.html">멘티 시간표 확인</a></li>
              <li class="active"><a href="${R}user/report/write">보고서 작성</a></li>
              <li><a href="board_manage.html">멘토링 과제게시판 관리</a></li>
            </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown">
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
        <li><a href="${R}user/logout_processing"><i class="glyphicon glyphicon-user"> 로그아웃</i></a></li>
      </ul>
    </div>
   </nav>
   <div>
       <img src="${R}img/topimage.jpg" class="img-responsive"/>
   </div>
   <div class="container">

      <div class="row">
        <div class="col-md-3">
          <h1 class="my-4"><strong>멘토링 관리</strong></h1>
          <div class="list-group">
            <a href="mento_timetable.html" class="list-group-item">멘티 시간표 확인</a>
            <a href="${R}user/report/write" class="list-group-item active">보고서 작성</a>
            <a href="board_manage.html" class="list-group-item">멘토링 과제게시판 관리</a>
          </div>
        </div>
        <div class="col-md-9">
          <h1 class="my-4">보고서 확인</h1>
          <!-- Team Members Row -->
          <div class="row">
            <div class="col-md-12">
              <h3><b>${ report.teamName }</b></h3>
          <table class="table table-bordered">
            <tr>
              <td class="reportEntity">멘토 이름</td>
              <td class="reportValue">${ report.mentoName }</td>
              <td class="reportEntity">제출 일자</td>
              <td class="reportValue"><fmt:formatDate value="${report.presentDate}" pattern="yyyy-MM-dd HH:mm"/></td>
            </tr>
            <tr>
              <td class="reportEntity">팀 이름</td>
              <td class="reportValue">${ report.teamName }</td>
              <td class="reportEntity">진행 장소</td>
              <td class="reportValue">${ report.classPlace }</td>
            </tr>
            <tr>
              <td class="reportEntity">교과목</td>
              <td class="reportValue">${ report.mentoSubject}</td>
              <td class="reportEntity">수업 방식</td>
              <td class="reportValue">${ report.classType }</td>
            </tr>
            <tr>
              <td class="reportEntity">수업 일자</td>
              <td class="reportValue">${ report.classDate }</td>
              <td class="reportEntity">시간</td>
              <td class="reportValue"><fmt:formatDate value="${report.startTime}" pattern="HH:mm"/> ~ <fmt:formatDate value="${report.endTime}" pattern="HH:mm"/></td>
            </tr>
            <c:if test="${ report.absentPerson ne null }">
	            <tr>
	              <td class="reportEntity">멘토 결석 여부</td>
	              <td colspan="3" class="reportValue">${ report.absentPerson }</td>
	            </tr>
	            <tr>
	              <td colspan="4" class="reportEntity">결석 사유</td>
	            </tr>
	            <tr>
	            	<td colspan="4" class="reportValue">${ report.absentContext }</td>
	            </tr>
	        </c:if>
            <tr>
              <td class="reportEntity">수업 주제</td>
              <td colspan="3" class="reportValue">${ report.classSubject}</td>
            </tr>
            <tr>
              <td class="reportEntity">수업 목표</td>
              <td colspan="3" class="reportValue">${ report.classTarget }</td>
            </tr>
            <tr>
              <td colspan="4" class="reportEntity">수업 소감</td>
            </tr>
            <tr>
              <td colspan="4" class="reportValue">${ report.classImplass }</td>
            </tr>
            <tr>
              <td colspan="4" class="reportEntity">멘토 사진</td>
            </tr>
            <tr>
              <td colspan="4" class="reportValue"><center><img class="img-responsive" src="${R}user/image/mentoring/${report.id}"/></center></td>
            </tr>
          </table>
            </div>
            <a href="${R}user/report/write"><button class="btn btn-info"><i class="glyphicon glyphicon-folder-close"> 보고서 목록으로</i></button></a>
            <c:if test="${report.confirm eq true}"><a href="${R}user/report/download?id=${report.id}"><button class="btn btn-info"><i class="glyphicon glyphicon-floppy-disk"> 보고서 다운로드</i></button></a></c:if>
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-pencil"> 수정</i></button>
          </div>
          <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h2><b>보고서 수정</b></h2>
              </div>
              <div class="modal-body">
                <form:form method="post" modelAttribute="editReport" enctype="multipart/form-data">
                <div class="row">
                  <div class="col-md-2 reportEntity2">멘토 이름</div>
                  <div class="col-md-4 reportInput">${report.mentoName }</div>
                  <div class="col-md-2 reportEntity2">제출 일자</div>
                  <div class="col-md-4 reportInput"><fmt:formatDate value="${report.presentDate}" pattern="yyyy-MM-dd"/></div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity2">팀 이름</div>
                  <div class="col-md-4 reportInput">${report.teamName }</div>
                  <div class="col-md-2 reportEntity2">교과목</div>
                  <div class="col-md-4 reportInput">${report.mentoSubject }</div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">진행 장소</div>
                  <div class="col-md-4 reportInput"><form:input path="classPlace" class="form-control" placeholder="강의실 입력(축제는 장소)"/></div>
                  <div class="col-md-2 reportEntity">수업 방식</div>
                  <div class="col-md-4 reportInput">
                  	<form:input path="classType" class="form-control" placeholder="수업 방식을 입력해주세요."/>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">수업 일자</div>
                  <div class="col-md-4 reportInput">
                    <input type="date" name="classDate" class="form-control" value="${ editReport.classDate }"/>
                  </div>
                  <div class="col-md-1 reportEntity">시간</div>
                  <div class="col-md-5 reportInput2 time">
					<form:input path="start1" class="number_input" />&nbsp;:&nbsp;<form:input path="start2" class="number_input" />
                    <h7>&nbsp;&nbsp;~&nbsp;&nbsp;</h7>
                    <form:input path="end1" class="number_input" />&nbsp;:&nbsp;<form:input path="end2" class="number_input" />
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">결석 인원</div>
                  <div class="col-md-10 reportInput">
                    <form:input path="absentPerson" class="form-control" placeholder="결석 인원을 작성해 주세요. 없으면 비워도 됩니다."/>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-12 reportEntity">결석 사유</div>
                </div>
                <div class="row">
                  <div class="col-md-12 reportInput"><form:textarea path="absentContext" class="form-control" rows="7" placeholder="결석 사유를 입력해주세요. 멘티와 이유를 구분해서 써주세요. 없으면 생략해도 됩니다."/></div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">수업 주제</div>
                  <div class="col-md-10 reportInput"><form:input path="classSubject" class="form-control" placeholder="수업 주제 입력(축제, 컴퍼런스는 참석한 축제, 컴퍼런스 이름 작성.)"/></div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">수업 목표</div>
                  <div class="col-md-10 reportInput"><form:input path="classTarget" class="form-control" placeholder="수업 목표 입력(축제, 컴퍼런스는 비워두셔도 됩니다.)"/></div>
                </div>
                <div class="row">
                  <div class="col-md-12 reportEntity">멘토 소감</div>
                </div>
                <div class="row">
                  <div class="col-md-12 reportInput"><form:textarea path="classImplass" class="form-control" rows="7" placeholder="적어도 500자 이내로 입력(축제, 컴퍼런스도 해당됩니다.)"/></div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">사진 불러오기</div>
                  <div class="col-md-10 reportInput">
                    <input type="file" name="classPhoto" class="form-control" multiple/>
                  </div>
                </div>
                <hr/>
                <div class="row">
                  <div class="col-md-12 information">
                    <p> ⊙ 보고서의 제출 기한은 따로 없습니다. 다만 수업 끝나는데로 작성해주시면 감사하겠습니다. </p>
                    <p> ⊙ 시간은 멘토와 멘티들이 협상한 시간대에서 작성을 해주셔야 인정됩니다. </p>
                    <p> ⊙ 멘토링 참석 비율이 2/3 미만인 경우에는 인정이 되지 않으니 참고하시길 바랍니다. </p>
                    <p> ⊙ 축제, 컨퍼런스 참석 보고서에 대해서는 수업 방식에 축제/컴퍼런스 참석으로 선택하시고, 수업 주제에는 참석한 축제, 컴퍼런스 이름을 작성해주고, 목표는 비워두셔도 됩니다. 교과목은 그대로 작성해주시면 되고 진행 장소는 축제나 컴퍼런스를 진행한 장소를 작성해주시면 됩니다</p>
                    <p> ⊙ 사진은 jpg, png 등 쉽게 구분이 가능한 확장명으로 올려주시고, 학번_n번째_멘토링.jpg, 학번_n번째_축제.jpg 이름으로 올려주셔야 합니다. </p>
                    <p> ⊙ 수업 방식은 오리엔테이션, 강의/실습, 토론/팀워크, 프로젝트 진행 방식, 시험기간 중 질의응답, 축제/컨퍼런스 참석 6개 중 하나로 입력해주세요. </p>
                  </div>
                </div>
                </form:form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-info" data-dismiss="modal"><i class="glyphicon glyphicon-remove"> 취소</i></button>
                <button type="button" class="btn btn-info" data-dismiss="modal"><i class="glyphicon glyphicon-ok"> 완료</i></button>
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
        <img src="${R}img/skhuniv.jpg"/>
      </div>
      <div class="col-md-9">
        <p>08359 서울시 구로구 연동로 320 / 지하철 1, 7호선 온수역(성공회대입구역)</p>
        <p><i class="glyphicon glyphicon-earphone"></i> TEL : 02-2610-4114 &nbsp;&nbsp;|&nbsp;&nbsp; <i class="glyphicon glyphicon-print"></i> FAX : 02-2683-8858</p>
      </div>
    </div>
 </body>
</html>
