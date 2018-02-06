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
        background-color : #A9F5BC;
      }
      tbody tr:hover {
        background-color: #CEF6D8;
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
   <sec:authorize access="not authenticated">
  	<%@ include file="/WEB-INF/views/include/menu_for_guest.jsp" %>
   </sec:authorize>
   <sec:authorize access="authenticated">
  	<%@ include file="/WEB-INF/views/include/menu_for_user.jsp" %>
   </sec:authorize>
   <div>
       <img src="${R}img/topimage.jpg" class="img-responsive"/>
   </div>
  <div class="container">

      <div class="row">

        <div class="col-md-3">
          <h1 class="my-4"><strong>알립니다</strong></h1>
          <div class="list-group">
            <sec:authorize access="not authenticated">
            	<a href="${R}guest/notice/list?bd=1&pg=1" class="list-group-item <c:if test="${param.bd eq 1}">active</c:if>">공지사항</a>
            </sec:authorize>
          	<sec:authorize access="authenticated">
            	<a href="${R}user/notice/list?bd=1&pg=1" class="list-group-item <c:if test="${param.bd eq 1}">active</c:if>">공지사항</a>
            </sec:authorize>
            <a href="${R}user/notice/list?bd=2&pg=1" class="list-group-item <c:if test="${param.bd eq 2}">active</c:if>">참여마당</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-md-9">
          <h1 class="my-4"><strong>${ noticeBBS.bbsName }</strong></h1>
          <hr/>
          <div class="row search">
          <form:form method="get" modelAttribute="pagination" class="form-inline">
          	<form:hidden path="bd"/>
          	<form:select path="sb" class="form-control" itemValue="value" itemLabel="label" items="${ searchBy }"/>
            <form:input path="st" class="form-control" placeholder="검색할 문자열" />
            
            <button type="submit" class="btn btn-primary"><i class="glyphicon glyphicon-search"> 검색하기</i></button>
            <c:if test="${ pagination.sb > 0}">
		      <a class="btn btn-default" href="list?bd=${noticeBBS.id}&pg=1">
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
                <c:forEach var="post" items="${ postList }">
	              <tr data-url="view.do?id=${post.id}&${pagination.queryString}">
	              	<td><center>${ post.id }</center></td>
	              	<td>${ post.title }  <span class="label label-success">${post.commentCount }</span></td>
	              	<td><center>${ post.userName }</center></td>
	              	<td><center><fmt:formatDate value="${post.writeDate}" pattern="yyyy-MM-dd HH:mm"/></center></td>
	              	<td><center>${ post.views }</center></td>
	              </tr>
	            </c:forEach> 
                </tbody>
              </table>
            </div>
          </div>
          
          <div class="search" align="right">
          	<sec:authorize access="not authenticated">
		      <button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-placement="top" data-content="로그인 후 이용해주세요.">
              	<i class="glyphicon glyphicon-pencil"> 글쓰기</i></button>
		    </sec:authorize>
            <sec:authorize access="authenticated">
              <c:if test="${ noticeBBS.writeable eq false }">
              	<sec:authorize access="hasAnyRole({'ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN'})">
	              	<a href="create.do?${pagination.queryString}"><button type="button" class="btn btn-info">
	              		<i class="glyphicon glyphicon-pencil"> 글쓰기</i></button></a>
              	</sec:authorize>
              	<sec:authorize access="hasAnyRole({'ROLE_MENTO', 'ROLE_MENTI'})">
	              	<button type="button" class="btn btn-info" data-container="body" data-toggle="popover" data-placement="top" data-content="글쓰기 권한이 없습니다.">
	              		<i class="glyphicon glyphicon-pencil"> 글쓰기</i></button>
              	</sec:authorize>
              </c:if>
              <c:if test="${ noticeBBS.writeable eq true }">
	              <a href="create.do?${pagination.queryString}"><button type="button" class="btn btn-info">
	              	<i class="glyphicon glyphicon-pencil"> 글쓰기</i></button></a>
              </c:if>
		    </sec:authorize>
          </div>
          <div class="page">
          	<page:pagination pageSize="${ pagination.sz }" recordCount="${ pagination.recordCount }" />
          </div>
        </div>
      </div>

    </div>
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
