<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<c:url var="R" value="/" />
<!DOCTYPE html>
<html>
 <head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="${R}res/common.js"></script>
  	<link rel="stylesheet" href="${R}res/common.css">
	

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
	<%@ include file="/WEB-INF/views/include/menu_for_user.jsp" %>
   <div>
        <img src="${R}img/topimage.jpg" class="img-responsive"/>
    </div>

    <div class="container">
      <div class="row">
         <div class="col-md-3">
          <h1 class="my-4"><strong>사이트 관리</strong></h1>
          <div class="list-group">

         <a href="${R}user/mento_open" class="list-group-item ">멘토링 개설/폐쇄</a>    
            <a href="${R}user/report/confirm" class="list-group-item ">보고서 확인</a>
            <a href="${R}user/survey" class="list-group-item ">설문조사 관리</a>
            <a href="${R}user/schedule" class="list-group-item  ">멘토, 멘티 신청기간 여부</a>
            <a href="${R}user/list" class="list-group-item active">회원 목록 관리</a>
            <a href="${R}user/intro/titleList" class="list-group-item ">사업 안내문 수정</a>
          </div>
        </div>
        <div class="col-md-9">
          <h1 class="my-4"><strong>회원 목록 관리</strong></h1>
          <br/>
          
            <div class="row search">
          <form:form method="get" modelAttribute="userPagination" class="form-inline">
          	<form:select path="sb" class="form-control" itemValue="value" itemLabel="label" items="${ searchBy }"/>
            <form:select path="ob" class="form-control" itemValue="value" itemLabel="label" items="${ orderBy }" />
            <form:input path="st" class="form-control" placeholder="검색할 문자열" />
            <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"> 검색하기</i></button>
            <c:if test="${ userPagination.sb > 0 || userPagination.ob > 0 }">
		      <a class="btn btn-default" href="list.do?pg=1">
		        <i class="glyphicon glyphicon-ban-circle"></i> 검색취소</a>
		    </c:if>   
          </form:form>
          

          <p></p>
		  <table class="table table-bordered">
          <thead class="userEntity">
            <tr>
  			  <th><center>id</center></th>
              <th><center>학번(교번, 직번)</center></th>
              <th><center>이름</center></th>
              <th><center>대표학과[소속학과]</center></th>
              <th><center>사용자유형</center></th>
            </tr>
          </thead>
        <tbody>
        
  
         <c:forEach var="user" items="${ user }">
        <tr data-url="edit.do?id=${ user.userId }&order=${user.userType}&${userPagination.queryString}">
          <td><center>${ user.userId }</center></td>
          <td><center>${ user.number }</center></td>         
          <td><center>${ user.userName }</center></td>
          <td><center>${ user.departmentName }</center></td>
          <td><center>${ user.userType }</center></td>
        </tr>
      </c:forEach>
      
    </tbody>

          </table>
          <div align="center">
            <div class="page">
          	<page:pagination pageSize="${ userPagination.sz }" recordCount="${ userPagination.recordCount }" />
          </div>
            
            
            <button type="button" class="btn btn-primary" style="width: 350px; padding:5px" data-toggle="modal" data-target="#myModal">신입생 목록 등록하기</button>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
              <div class="modal-dialog">
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">신입생 회원 목록 추가</h4>
                  </div>
                  <div class="modal-body">
                    <h5>신입생 회원 목록들만 추가가 가능합니다.</h5>
                    <h5>비밀번호는 a+휴대폰 뒷번호 4자리로 설정됩니다.</h5>
                    <h5>CSV 파일을 통해서 삽입이 가능합니다.</h5>
                  </div>
                  <div class="control-group">
                    <div class="form-group floating-label-form-group controls">
                      <form method="post" enctype="multipart/form-data" action="${R}user/list/primaryUpload">
					  	<input type="file" name="csvFile" multiple/><br/>
					  	<button type="submit" class="btn btn-primary">등록하기</button>
					  	<button type="button" class="btn btn-warning" data-dismiss="modal">취소</button>
					  </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>


        </div>
      </div>
  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>





 </body>
</html>
