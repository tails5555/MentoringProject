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
              <li><a href="${R}user/menti_apli">멘티 신청</a></li>
              <li><a href="${R}user/mento_apli">멘토 신청</a></li>
              <li ><a href="${R}user/mento_list">멘토/멘티 목록</a></li>
              <li><a href="${R}user/groupBBS">멘토링 게시판</a></li>
              <li><a href="survey.html">설문조사</a></li>
            </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_MENTO', 'ROLE_STUDCHAIRMAN')">
        <li class="dropdown active">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              
              <li><a href="${R}user/mento_timetable?timetableView=">멘티 시간표 확인</a></li>
              <li class="active"><a href="${R}user/report/write">보고서 작성</a></li>
              <li><a href="board_manage.html">멘토링 과제게시판 관리</a></li>
            </ul>
        </li>
        </sec:authorize>
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
      	<li><a href="${R}user/Edit.do"><i class="glyphicon glyphicon-user"> 내정보</i></a></li>
        <li><a href="${R}user/logout_processing"><i class="glyphicon glyphicon-remove-sign"> 로그아웃</i></a></li>
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
            <a href="${R}user/mento_timetable?timetableView=" class="list-group-item">멘티 시간표 확인</a>
            <a href="${R}user/report/write" class="list-group-item active">보고서 작성</a>
            <a href="${R}user/board_manage" class="list-group-item">멘토링 과제게시판 관리</a>
          </div>
        </div>
        <div class="col-md-9">
          <h1 class="my-4"><strong>보고서 작성</strong></h1>
          <!-- Team Members Row -->
          <div class="row">
            <div class="col-md-12">
              <h2>보고서 리스트</h2>
              <hr/>
              <h3><b>${mento.teamName }</b></h3>
              <h5><b>시간 누적 확인</b></h5>
              <div class="row">
                <div class="col-md-12 inside_percent">
                  <div class="true_percent" style="width : ${time/24*100}%">
                    <p><fmt:formatNumber value="${time}" pattern="0.0"/></p>
                  </div>
                </div>
              </div>
              <div class="row" style="text-align : right;">
                	총 진행 시간 : <fmt:formatNumber value="${time}" pattern="0.0"/>/24 시간
              </div>
              <hr/>
              <table class="table">
                <thead>
                <tr>
                  <td><center>제출 기간</center></td>
                  <td><center>수업 일자</center></td>
                  <td><center>멘토링 주제</center></td>
                  <td><center>멘티 결석자</center></td>
                  <td><center>수업 시간</center></td>
                  <td><center>확인 여부</center></td>
                  <td><center>보고서 확인하기</center></td>
                </tr>
                </thead>
                <tbody>
                  <c:choose>
                	<c:when test="${ reports.size() ne 0 }">
		                <c:forEach var="report" items="${ reports }">
		                  <tr>
		                    <td><center><fmt:formatDate value="${report.presentDate}" pattern="yyyy-MM-dd HH:mm"/></center></td>
		                    <td><center><fmt:formatDate value="${report.classDate}" pattern="yyyy-MM-dd E"/></center></td>
		                    <td><center>${ report.classSubject }</center></td>
		                    <td><center>${ report.absentPerson }</center></td>
		                    <td <c:if test="${ report.confirm }">class="success"</c:if>><center><fmt:formatDate value="${report.startTime}" pattern="HH:mm"/>~<fmt:formatDate value="${report.endTime}" pattern="HH:mm"/><br/><u>${ (report.endTime.time - report.startTime.time) / 3600000 }시간</u></center></td>
		                    <c:choose> 
		                    	<c:when test="${ report.confirm eq true}">
		                    		<td><center><button type="button" class="btn btn-success" data-container="body" data-toggle="popover" data-placement="left" title="확인이 완료되었습니다." data-content="이 날에 한 멘토링은 인정되었습니다.">
		                        			<i class="glyphicon glyphicon-ok"></i> 확인 완료
		                      		</button></center></td>
		                    	</c:when>
		                    	<c:when test="${ report.confirm eq false && report.comment eq null }">
		                    		<td><center>보류 중</center></td>
		                    	</c:when>
		                    	<c:when test="${ report.confirm eq false && report.comment ne null }">
		                    		<td>
			                    		<center>
				                    		<button type="button" class="btn btn-danger" data-container="body" data-toggle="popover" data-placement="left" title="Re:${ report.confirmManagerName }" data-content="${report.comment}">
		                        				<i class="glyphicon glyphicon-alert"></i> 코멘트 확인
		                      				</button>
	                      				</center>
                      				</td>
		                    	</c:when>
		                    </c:choose>
		                    <td>
		                      <center><a href="${R}user/report/view?id=${report.id}"><button class="btn btn-info" type="button"><i class="glyphicon glyphicon-pencil"> 확인</i></button></a></center>
		                    </td>
		                  </tr>
		                 </c:forEach>
		             </c:when>
		             <c:otherwise>
			             <tr>
			             	<td colspan="7"><center>제출한 보고서 내역이 없습니다.</center></td>
			             </tr>
		             </c:otherwise>
		         </c:choose>
                </tbody>
              </table>
              <hr/>
              <div class="row">
                <div class="col-md-12 information">
                  <p> ⊙ 보고서에 문제가 있다면 커멘트를 참고해서 수정해주세요. </p>
                  <p> ⊙ 보류 중인 문서는 현재 관리자들이 확인을 하고 있는 중입니다. </p>
                  <p> ⊙ 보고서 다운로드는 확인이 완료된 후에 다운로드 받을 수 있습니다. </p>
                  <p> ⊙ 누적 시간은 보고서를 통해서 확인이 완료된 시간들에 대해서 인정을 합니다. </p>
                  <p> ⊙ 기본 이수 시간인 24시간을 초과하면 컨퍼런스 관련된 보고서 이외에 작성이 불가능합니다. 불이익 없으시길 바랍니다. </p>
                </div>
              </div>
              <br/>
            </div>
            <button type="button" class="btn btn-info" data-toggle="collapse" data-target="#reportAdd">
		       <i class="glyphicon glyphicon-plus"></i> 보고서등록
		    </button>
          </div>
          <hr/>
              <div id="reportAdd" class="collapse">
              <form:form method="post" modelAttribute="report" enctype="multipart/form-data">
                <h2><b>보고서 등록</b></h2>
                <div class="row">
                  <div class="col-md-2 reportEntity2">멘토 이름</div>
                  <div class="col-md-4 reportInput">${mento.name }</div>
                  <div class="col-md-2 reportEntity2">제출 일자</div>
                  <div class="col-md-4 reportInput"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity2">팀 이름</div>
                  <div class="col-md-4 reportInput">${mento.teamName }</div>
                  <div class="col-md-2 reportEntity2">교과목</div>
                  <div class="col-md-4 reportInput">${mento.subject }</div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">진행 장소</div>
                  <div class="col-md-4 reportInput"><form:input path="classPlace" class="form-control" placeholder="강의실 입력(축제는 장소)"/></div>
                  <div class="col-md-2 reportEntity">수업 방식</div>
                  <div class="col-md-4 reportInput">
                  <c:choose>
                  	<c:when test="${ time le 24 }">
                  		<form:select path="classType" class="form-control" itemValue="value" itemLabel="label" items="${ classType }" />
                  	</c:when>
                  	<c:otherwise>
                  		<form:hidden path="classType" value="6"/>
                  		<input type="text" value="컨퍼런스 참석" class="form-control" readonly="readonly"/>
                  	</c:otherwise>
                  </c:choose>
                  </div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">수업 일자</div>
                  <div class="col-md-4 reportInput">
                    <input type="date" name="classDate" class="form-control"/>
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
                  <div class="col-md-12 reportEntity">수업 진행 내용과 소감</div>
                </div>
                <div class="row">
                  <div class="col-md-12 reportInput"><form:textarea path="classImplass" class="form-control" rows="7" placeholder="적어도 500자 이내로 입력(축제, 컴퍼런스도 해당됩니다.)"/></div>
                </div>
                <div class="row">
                  <div class="col-md-2 reportEntity">사진 불러오기</div>
                  <div class="col-md-10 reportInput">
                    <input type="file" name="classPhoto" class="form-control"/>
                  </div>
                </div>
                <hr/>
                <div class="row">
                  <div class="col-md-12 information">
                    <p> ⊙ 보고서의 제출 기한은 따로 없습니다. 다만 수업 끝나는데로 작성해주시면 감사하겠습니다. </p>
                    <p> ⊙ 수업 진행 방식에 기타라고 체크하신 분은 수업 진행 내용과 소감 내부 첫 줄에 수업 방식을 제기해주시길 바랍니다. </p>
                    <p> ⊙ 시간은 멘토와 멘티들이 협상한 시간대에서 작성을 해주셔야 인정됩니다. </p>
                    <p> ⊙ 멘토링 참석 비율이 2/3 미만인 경우에는 인정이 되지 않으니 참고하시길 바랍니다. </p>
                    <p> ⊙ 축제, 컨퍼런스 참석 보고서에 대해서는 수업 방식에 축제/컴퍼런스 참석으로 선택하시고, 수업 주제에는 참석한 축제, 컴퍼런스 이름을 작성해주고, 목표는 비워두셔도 됩니다. 교과목은 그대로 작성해주시면 되고 진행 장소는 축제나 컴퍼런스를 진행한 장소를 작성해주시면 됩니다</p>
                    <p> ⊙ 사진은 jpg, png 등 쉽게 구분이 가능한 확장명으로 올려주시고, 학번_n번째_멘토링.jpg, 학번_n번째_축제.jpg 이름으로 올려주셔야 합니다. </p>
                  </div>
                </div>
                <div class="complete" align="right">
                  <button class="btn btn-info" type="submit"><i class="glyphicon glyphicon-ok"> 완료</i></button>
                  &nbsp;&nbsp;
                  <button class="btn btn-info" type="button" type="button" data-toggle="collapse" data-target="#reportAdd"><i class="glyphicon glyphicon-remove"> 취소</i></button>
                </div>
                </form:form>
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
