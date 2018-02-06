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
    
    <script type="text/javascript">

	$(document).ready(function() {
		
		 $('checkbox[name="time"]').each(function() {
		     if(this.value == "true"){ //값 비교
		            this.checked = true; //checked 처리
		      }
		 });

		 
		 $("timetableView").val(${student.name}).attr("selected", "selected");

	
	
	});

	


</script>


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

        label{
          margin-right: 1px

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
   <%@ include file="/WEB-INF/views/include/menu_for_user.jsp" %>
   <div>
       <img src="${R}img/topimage.jpg" class="img-responsive"/>
   </div>
   <div class="container">

      <div class="row">
        <div class="col-md-3">
          <h1 class="my-4"><strong>멘토링 관리</strong></h1>
          <div class="list-group">
            <a href="${R}user/mento_timetable?timetableView=공강" class="list-group-item active">멘티 시간표 확인</a>
            <a href="${R}user/report/write" class="list-group-item">보고서 작성</a>
            <a href="${R}user/board_manage" class="list-group-item">멘토링 과제게시판 관리</a>
          </div>
        </div>
        <div class="col-md-9">
          <h1 class="my-4"><strong>멘티 시간표 확인</strong></h1>
          <div class="row">
            <div class="col-md-6">
            </div>
            <div class="col-md-6">
              <form>
              	<div class="row">
              		<div class="col-md-7">
              			<select class="form-control" name="timetableView">
              			<optgroup label="공강">
		                  <option value="공강" ${param.timetableView=="공강" ? "selected" : "" } >멘토링 그룹 공강</option>
		                </optgroup>
		  				<optgroup label="멘토">
		                  <option value="${mento.name}" ${param.timetableView eq mento.name ? "selected" : "" } >${mento.name}</option>
		                </optgroup>
		                <optgroup label="멘티">
		                   <c:forEach var="mt" items="${mt}">
		                      <option value="${mt.name}" ${param.timetableView eq mt.name ? "selected" : "" } >${mt.name}</option>
							  </c:forEach>
		                </optgroup>
		              </select>
              		</div>
              		<div class="col-md-5">
              			<button class="btn btn-success" type="submit" role="button"><i class="glyphicon glyphicon-zoom-in"> 확인하기</i></button>
              		</div>
              	</div>
              </form>
            </div>
          </div>
          <!-- Team Members Row -->
          <div class="row">
            <div class="col-md-12">
              <h3 class="my-4"><b>
              <c:choose>
              	<c:when test="${ param.timetableView eq '공강' }">멘토링이 가능한 시간표</c:when>
              	<c:otherwise>${student.name}님의 가능한 시간표</c:otherwise>
              </c:choose>
              </b></h3>
              <hr/>
              
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
                   </div>
                 </div>
                 <br/>
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
                   </div>
                 </div>
                 <br/>
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
                   </div>
                 </div>
                 <br/>
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
                   </div>
                 </div>
                 <br/>
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
                   </div>
                 </div>
                 <br/>
                </div>
              </div>
            <hr/>
            <div class="row">
              <div class="col-md-12 information">
                <p> ⊙ 채색된 시간표가 현재 멘토, 멘티들이 가능한 시간대입니다. </p>
                <p> ⊙ 시간표는 멘토와 멘티들이 모두 가능한 시간으로 통합해서 진행하시면 됩니다. </p>
                <p> ⊙ 시간표 조율이 힘드신 멘토는 학생회장 혹은 학과장 교수에게 연락바랍니다. </p>
                <p> ⊙ 한 멘토링 수업의 제한 시간은 2시간으로 이 점 참고하시길 바랍니다. </p>
                <p> ⊙ 멘토링 그룹 공강은 멘티와 멘토 모두 비어있는 시간대만 채색되어 있습니다. </p>
              </div>
            </div>
          </div>
      </div>
   </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
