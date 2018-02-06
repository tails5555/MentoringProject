<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags" %>
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


      .container {
        margin-top: 30px;
        margin-left : auto;
        margin-right : auto;
      }
      .search{
        margin-top : 20px;
        margin-bottom : 10px;
        text-align : right;
      }
      .page{
      	text-align : center;
      }
      thead{
        background-color : #F5ECCE;
      }
      tbody tr:hover {
        background-color: #FBFBEF;
        cursor : pointer;
      }
   </style>
   <script type="text/javascript">
    $(function () {
      $('[data-toggle="popover"]').popover();
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
          <h1 class="my-4"><strong>멘토링</strong></h1>
          <div class="list-group">
            <a href="${R}user/menti_apli" class="list-group-item ">멘티 신청</a>
            <a href="${R}user/mento_apli" class="list-group-item">멘토 신청</a>
            <a href="${R}user/mento_list" class="list-group-item">멘토/멘티 목록</a>
            <a href="${R}user/groupBBS" class="list-group-item active">멘토링 게시판</a>
            <a href="${R}user/mentoringSurvey" class="list-group-item">설문조사</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-md-9">
          <h1 class="my-4"><strong>멘토링 게시판</strong></h1>
          <h3 class="my-4"><strong>☞ ${ mento.teamName }</strong> - ${ mento.mentoName } 멘토</h3>
          <hr/>
          <c:if test="${ opened eq true }">
          <div class="row search">
          <form:form method="get" modelAttribute="groupBBSPagination" class="form-inline">
          	<form:hidden path="gd"/>
          	<form:select path="sb" class="form-control" itemValue="value" itemLabel="label" items="${ searchBy }"/>
            <form:input path="st" class="form-control" placeholder="검색할 문자열" />
            
            <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"> 검색하기</i></button>
            <c:if test="${ groupBBSPagination.sb > 0}">
		      <a class="btn btn-default" href="list?gd=${mento.id}&pg=1">
		        <i class="glyphicon glyphicon-ban-circle"></i> 검색취소</a>
		    </c:if>      
          </form:form>
          </div>
          <div class="row">
            <div class="col-md-12">
              <table class="table">
                <thead>
                  <tr>
                    <th style="text-align: center" width="20px">번호</th>
                    <th style="text-align: center" width="200px">제목 </th>
                    <th style="text-align: center" width="80px">작성자</th>
                    <th style="text-align: center" width="80px">작성시간</th>
                    <th style="text-align: center" width="80px">조회</th>
                  </tr>
                </thead>

                <tbody>
                <c:choose>
                <c:when test="${ postList.size() ne 0 }">
	                <c:forEach var="post" items="${ postList }">
		              <tr data-url="view.do?id=${post.id}&${groupBBSPagination.queryString}">
		              	<td><center>${ post.id }</center></td>
		              	<td>${ post.title }  <span class="label label-warning">${post.commentCount }</span></td>
		              	<td><center>${ post.userName }</center></td>
		              	<td><center><fmt:formatDate value="${post.writeDate}" pattern="yyyy-MM-dd HH:mm"/></center></td>
		              	<td><center>${ post.views }</center></td>
		              </tr>
		            </c:forEach>
	            </c:when>
	            <c:otherwise>
	            	<tr>
	            		<td colspan="5"><center>조회된 게시글이 없습니다.</center></td>
	            	</tr>
	            </c:otherwise>
	            </c:choose>
                </tbody>
              </table>
            </div>
          </div>
          <div class="search" align="right">
          	 <a href="${R}user/groupBBS"><button type="button" class="btn btn-info"><i class="glyphicon glyphicon-user"></i> 멘토 목록으로</button></a>
	         <c:if test="${ write eq true }">
	         	<a href="create.do?${groupBBSPagination.queryString}"><button type="button" class="btn btn-info">
	            	<i class="glyphicon glyphicon-pencil"> 글쓰기</i></button></a>
	         </c:if>
          </div>
          <div class="page">
          	<page:pagination pageSize="${ groupBBSPagination.sz }" recordCount="${ groupBBSPagination.recordCount }" />
          </div>
          </c:if>
          <c:if test="${ opened eq false }">
          	<div class="panel panel-warning">
			  <div class="panel-heading">
	    		<h3 class="panel-title">멘토링 게시판 접근이 불가능합니다.</h3>
	  		  </div>
		      <div class="panel-body">
				 멘토가 멘토링 게시판 접근을 불가능하도록 설정하였습니다.
			  </div>
			</div>
			<hr/>
			  <a href="${R}user/groupBBS"><button type="button" class="btn btn-info"><i class="glyphicon glyphicon-user"></i> 멘토 목록으로</button></a>
          </c:if>
        </div>
      </div>

    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
