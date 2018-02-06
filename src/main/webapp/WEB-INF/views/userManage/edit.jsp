<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
  <script src="${R}res/common.js"></script>


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
        <!-- /.col-lg-3 -->
	<form:form method="post" modelAttribute="user">  
        <div class="col-md-9">
          <!-- Introduction Row -->
          <h1 class="my-4"><strong>회원 정보 확인</strong></h1>
          <br/>
		  <table class="table table-bordered">
            <tr>
              <c:set var="n" value="5"/>
              <c:if test="${ param.order eq '교수' or param.order eq '직원' }">
              	<c:set var="n" value="6"/>
              </c:if>
              <td rowspan="${n}" class="userValue">
              	<center><img class="img-thumbnail img-responsive" 
                    src="<c:choose><c:when test="${user.profileId ne -1}">
                    ${R}user/image/profile/${user.profileId}</c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>" width="200" height="200"></center>
              </td>
              <td class="userEntity">학번(교번, 직번)</td>
              <td class="userValue">${ user.number }</td>
            	<td class="userEntity">이름</td>
              <td class="userValue">${ user.userName }</td>
            </tr>
            <tr>
              <td class="userEntity">학과</td>
              <td class="userValue">${ user.departmentName }</td>
            	<td class="userEntity">이메일</td>
              <td class="userValue">${ user.email }</td>
            </tr>
            <tr>
              <td class="userEntity">주소</td>
              <td class="userValue">${ user.address}</td>
            	<td class="userEntity">핸드폰</td>
              <td class="userValue">${ user.phoneNumber}</td>
            </tr>
            <tr>
            <c:if test="${param.order eq '직원' or param.order eq '교수'}">
            	<tr>
	              <td class="userEntity">사무실 번호</td>
	              <td class="userValue">${ user.officeId}</td>
	            	<td class="userEntity">사무실 연락처</td>
	              <td class="userValue">${ user.officePhone}</td>
            	</tr>
            </c:if>
           <form:hidden path="userId" value="${user.userId}"/>
            
              <td class="userEntity" colspan="1">회원 유형</td>
              
              <td class="userValue" colspan="3">
                  <c:choose>
       <c:when test="${user.userType == '멘티'}">
             <select class="form-control" name="order">   
			 
			<option value="멘토" ${ param.order == "멘토" ? "selected" : "" }>멘토</option> 
			<option value="학생회장" ${ param.order == "학생회장" ? "selected" : "" }>학생회장</option>
			<option value="직원" ${ param.order == "직원" ? "selected" : "" }>직원</option> 
			<option value="교수" ${ param.order == "교수" ? "selected" : "" }>교수</option>
			</select>
       </c:when>
    
       <c:when test="${user.userType == '멘토'}">
                  <select class="form-control" name="order">   
			<option value="멘티" ${ param.order == "멘티" ? "selected" : "" }>멘티</option> 
	
			<option value="학생회장" ${ param.order == "학생회장" ? "selected" : "" }>학생회장</option>
			<option value="직원" ${ param.order == "직원" ? "selected" : "" }>직원</option> 
			<option value="교수" ${ param.order == "교수" ? "selected" : "" }>교수</option>
			</select>
       </c:when>
       
  <c:when test="${user.userType == '학생회장'}">
              <select class="form-control" name="order">   
			<option value="멘티" ${ param.order == "멘티" ? "selected" : "" }>멘티</option> 
			<option value="멘토" ${ param.order == "멘토" ? "selected" : "" }>멘토</option> 
			
			<option value="직원" ${ param.order == "직원" ? "selected" : "" }>직원</option> 
			<option value="교수" ${ param.order == "교수" ? "selected" : "" }>교수</option>
			</select>
       </c:when>

       <c:otherwise>
         <button type="button" class="btn btn-default">
            <i class="glyphicon glyphicon-user"></i>관리자는 변경할 수 없습니다.</button>
       </c:otherwise>
       
   </c:choose>         
             

              </td>
            </tr>
          </table>

          
          <a href="list.do?${ userPagination.queryString }"><button class="btn btn-info" type="button"><i class="glyphicon glyphicon-list"> 목록으로</i></button></a>
          <button class="btn btn-warning" type="submit" ><i class="glyphicon glyphicon-user"> 권한 설정하기</i></button>
          
          
      <c:choose>
       <c:when test="${user.userType == '멘티'}">
             <a href="delete.do?id=${ user.userId }" class="btn btn-danger" data-confirm-delete>
          <i class="glyphicon glyphicon-remove"></i>회원 삭제</a>
       </c:when>
       <c:when test="${user.userType == '멘토'}">
             <a href="delete.do?id=${ user.userId }" class="btn btn-danger" data-confirm-delete>
          <i class="glyphicon glyphicon-remove"></i>회원 삭제</a>
       </c:when>

       <c:otherwise>
        <button type="button" class="btn btn-default">
            <i class="glyphicon glyphicon-remove"></i>관리자는 삭제할 수 없습니다.</button>
       </c:otherwise>
   </c:choose>
      
          
        </div>
      </div>
  </div>
 </form:form>
  
  
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>




 </body>
</html>
