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

      .container {
        margin-top: 30px;
        margin-left : auto;
        margin-right : auto;
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
      .optionTitle{
        padding-top : 10px;
        padding-bottom : 0px;
        background-color : #E6E6E6;
        border : 1px solid #D8D8D8;
        border-radius : 5px;
        text-align : left;
        font-weight : bold
      }
      .option{
        margin-top : 10px;
        margin-bottom : 10px;
        padding-left : 10px;
        background-color : #F2F2F2;
        border : 1px solid #D8D8D8;
        border-radius : 5px;
      }
      .panel-group{
        margin-top : 10px;
      }
   </style>
   <script>
   $(function() {
	   $("[data-confirm-apply]").click(function() {
	     return confirm("멘토링 항목 설정을 변경합니다. 계속 하시겠습니까?");
	   })
	})

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
            <a href="${R}user/mento_timetable?timetableView=공강" class="list-group-item">멘티 시간표 확인</a>
            <a href="${R}user/report/write" class="list-group-item">보고서 작성</a>
            <a href="${R}user/board_manage" class="list-group-item active">멘토링 과제게시판 관리</a>
          </div>
        </div>
        <div class="col-md-9">
          <h1 class="my-4"><strong>멘토링 과제게시판 관리</strong></h1>
          <hr/>
          <div class="row">
            <div class="col-md-12 optionTitle">
              <p>멘토링 게시판 공개 여부</p>
            </div>
          </div>
          <form:form method="post" modelAttribute="manageOption">
          <form:hidden path="groupId"/>
          <div class="row">
            <div class="panel-group col-md-7" id="opened" role="tablist" aria-multiselectable="true">
              <div class="panel panel-info">
                <div class="panel-heading" role="tab" id="headingOne">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#opened" href="#openOne" aria-expanded="true" aria-controls="collapseOne">
                      전체 공개
                    </a>
                  </h4>
                </div>
                <c:set var="option1" value=""/>
                <c:if test="${ manageOption.bbsOpened eq 'bbsO' }">
                	<c:set var="option1" value="in"/>
                </c:if>
                <div id="openOne" class="panel-collapse collapse ${ option1 }" role="tabpanel" aria-labelledby="headingOne">
                  <div class="panel-body">
                    전체 공개를 선택하시면 이 사이트를 접속한 모든 멘토, 멘티들이 현재 멘토가 올린 과제 방식들을 참고할 수 있습니다. 또한 전체 공개를 하면 차후에 멘토링을 하게 되는 멘토들에게도 도움이 될 수 있습니다.
                  </div>
                </div>
              </div>
              <div class="panel panel-info">
                <div class="panel-heading" role="tab" id="headingTwo">
                  <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#opened" href="#openTwo" aria-expanded="false" aria-controls="collapseTwo">
                      비공개
                    </a>
                  </h4>
                </div>
                <c:set var="option2" value=""/>
                <c:if test="${ manageOption.bbsOpened eq 'bbsX' }">
                	<c:set var="option2" value="in"/>
                </c:if>
                <div id="openTwo" class="panel-collapse collapse ${ option2 }" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="panel-body">
                    비공개를 선택하시면 이 사이트를 접속한 다른 멘토, 멘티들은 올린 비밀번호를 입력하지 않으면 접근이 불가능합니다.
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5 option">
              <div class="radio">
                <form:radiobuttons path="bbsOpened" style="margin-left : 5px;" items="${ bbsOpened }" itemValue="value" itemLabel="label"/>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12 optionTitle">
              <p>멘티 정보 공개</p>
            </div>
          </div>
          <div class="row">
            <div class="panel-group col-md-7" id="mentiInfo" role="tablist" aria-multiselectable="true">
              <div class="panel panel-info">
                <div class="panel-heading" role="tab" id="headingOne">
                  <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#mentiInfo" aria-expanded="true" href="#mentiOne" aria-controls="collapseOne">
                      비공개
                    </a>
                  </h4>
                </div>
                <c:set var="option3" value=""/>
                <c:if test="${ manageOption.infoOpened eq 'infoX' }">
                	<c:set var="option3" value="in"/>
                </c:if>
                <div id="mentiOne" class="panel-collapse collapse ${ option3 }" role="tabpanel" aria-labelledby="headingOne">
                  <div class="panel-body"> 
                    멘티의 개인 사생활을 보호하기 위하여 개인 정보를 비공개합니다. 대신 이름은 홍*동 식으로 저장됩니다.(권장)
                  </div>
                </div>
              </div>
              <div class="panel panel-info">
                <div class="panel-heading" role="tab" id="headingTwo">
                  <h4 class="panel-title">
                    <a class="collapsed" data-toggle="collapse" data-parent="#mentiInfo" href="#mentiTwo" aria-expanded="false" aria-controls="collapseTwo">
                      공개
                    </a>
                  </h4>
                </div>
                <c:set var="option4" value=""/>
                <c:if test="${ manageOption.infoOpened eq 'infoO' }">
                	<c:set var="option4" value="in"/>
                </c:if>
                <div id="mentiTwo" class="panel-collapse collapse ${ option4 }" role="tabpanel" aria-labelledby="headingTwo">
                  <div class="panel-body">
                    공개를 선택하시면 멘토의 이름과 이메일까지만 공개를 합니다. 휴대폰 번호는 멘토만 볼 수 있습니다.
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-5 option">
              <div class="radio">
                <form:radiobuttons path="infoOpened" style="margin-left : 5px;" items="${ infoOpened }" itemValue="value" itemLabel="label" />
              </div>
            </div>
            
          </div>
          <hr/>
          <div class="row" align="right">
            <button class="btn btn-info" type="submit" data-confirm-apply><i class="glyphicon glyphicon-ok"> 설정</i></button>
          </div>
         </form:form>
          

        </div>
      </div>
    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
