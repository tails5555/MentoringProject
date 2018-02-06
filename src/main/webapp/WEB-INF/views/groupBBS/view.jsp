<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
      .row {
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
        border : 1px solid #F2F5A9;
        background-color : #F5F6CE;
        font-weight : bold;
        text-align : center;
      }
      .reportInput{
        padding-left : 5px;
        padding-right : 5px;
        padding-top : 12px;
        padding-bottom : 12px;
        border : 1px solid #F2F5A9;
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
      div#context{ min-height : 500px}
   </style>
   <script type="text/javascript">
    $(function () {
      $('[data-toggle="popover"]').popover();
    });
   </script>
   <script>
   $(function() {
	   $("[data-confirm-comment-delete]").click(function() {
	     return confirm("댓글을 삭제합니다. 계속 하시겠습니까?");
	   })
	   $("[data-confirm-file-delete]").click(function() {
	     return confirm("파일을 삭제합니다. 계속 하시겠습니까?");
	   })
	   $("[data-confirm-fileAll-delete]").click(function() {
	     return confirm("파일을 모두 삭제합니다. 계속 하시겠습니까?");
	   })
	   $("[data-confirm-post-delete]").click(function() {
	     return confirm("현재 게시물을 삭제합니다. 계속 하시겠습니까?");
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
          <h1 class="my-4"><strong>멘토링</strong></h1>
          <div class="list-group">
            <a href="${R}user/menti_apli" class="list-group-item ">멘티 신청</a>
            <a href="${R}user/mento_apli" class="list-group-item">멘토 신청</a>
            <a href="${R}user/mento_list" class="list-group-item">멘토/멘티 목록</a>
            <a href="${R}user/groupBBS" class="list-group-item active">멘토링 게시판</a>
            <a href="${R}user/mentoringSurvey" class="list-group-item">설문조사</a>
          </div>
        </div>
        <div class="col-md-9">
          
          <!-- Team Members Row -->
          <div class="row">
            <h1 class="my-4"><strong>멘토링 게시판</strong> - 게시글 확인</h1>
          	<h3 class="my-4"><strong>☞ ${ mento.teamName }</strong> - ${ mento.mentoName } 멘토</h3>
            <hr/>
            <div class="row">
              <div class="col-md-2"><br/><img class="img-thumbnail img-responsive" 
                    src="<c:choose><c:when test="${post.profileId ne -1}">
                    ${R}user/image/profile/${post.profileId}</c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>" alt="Responsive image">
              </div>
              <div class="col-md-10">
	            <div class="row">
	            	<div class="col-md-2 reportEntity">제목</div>
	            	<div class="col-md-10 reportInput">${ post.title }</div>
	            </div>
              	<div class="row">
              		<div class="col-md-2 reportEntity">올린이</div>
		            <div class="col-md-4 reportInput">${ post.userName }</div>
		            <div class="col-md-2 reportEntity">올린 날짜</div>
		            <div class="col-md-4 reportInput"><fmt:formatDate value="${ post.writeDate}" pattern="yyyy-MM-dd HH:mm"/></div>
              	</div>
              	<div class="row">
	              <div class="col-md-2 reportEntity">연락</div>
	              <div class="col-md-4 reportInput">${ post.userEmail }</div>
	              <div class="col-md-2 reportEntity">조회수</div>
	              <div class="col-md-4 reportInput">${ post.views }</div>
	            </div>
              </div>
            </div>
            <br/>
            <c:if test="${files.size() ne 0}">
	            <div class="row">
	            	<div class="col-md-12 reportEntity">첨부 파일</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 reportInput">
		            	<table class="table">
		            		<c:forEach var="file" items="${ files }">
		            			<tr>
		            				<td style="text-align : center;"><i class="glyphicon glyphicon-save-file"></i></td>
		            				<td style="text-align : center;"><a href="download?id=${file.id}&${groupBBSPagination.queryString}">${ file.fileName }</a></td>
		            				<td style="text-align : center;"><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ file.fileTime }"></fmt:formatDate></td>
		            				<td style="text-align : center;"><fmt:formatNumber pattern="0.00" value="${ file.fileSize/1024/1024 }"/>MB</td>
		            				<sec:authorize access="authenticated">
			            				<sec:authentication property="user.id" var="userId"/>
									    <c:if test="${userId eq post.userId }">
									    	<td style="text-align : center;"><a href="fileDelete?id=${post.id}&fId=${file.id}&${groupBBSPagination.queryString}" class="btn btn-danger" data-confirm-file-delete><i class="glyphicon glyphicon-trash"></i> 파일 삭제</a></td>
									    </c:if>
									</sec:authorize>
		            			</tr>
		            		</c:forEach>
		            	</table>
		            	<sec:authorize access="authenticated">
			            	<sec:authentication property="user.id" var="userId"/>
		            		<c:if test="${userId eq post.userId }">
							    	<hr/>
							    	<a href="fileAllDelete?id=${post.id}&${groupBBSPagination.queryString}" class="btn btn-danger" data-confirm-fileAll-delete><i class="glyphicon glyphicon-trash"></i> 모든 파일 삭제</a>
							</c:if>
						</sec:authorize>
	            	</div>
	            </div>
            </c:if>
            <div class="row">
              <div class="col-md-12 reportEntity">내용문</div>
            </div>
            <div class="row">
              <div class="col-md-12 reportInput">
                <div id="context">${ post.context }</div>
              </div>
            </div>
            <div class="complete" align="right">
              <a href="list.do?${groupBBSPagination.queryString}"><button class="btn btn-info" type="button"><i class="glyphicon glyphicon-arrow-left"> 뒤로가기</i></button></a>
              <sec:authorize access="authenticated">    	
			    <sec:authentication property="user.id" var="userId"/>
			    <c:if test="${userId eq post.userId }">
			    	&nbsp;&nbsp;
			    	<a href="edit.do?id=${post.id}&${groupBBSPagination.queryString}" class="btn btn-info" ><i class="glyphicon glyphicon-pencil"></i> 수정하기 / ${ files.size() > 0 ? "파일 추가" : "새로운 파일 추가" }</a>
			    	&nbsp;&nbsp;
			    	<a href="postDelete.do?id=${post.id}&${groupBBSPagination.queryString}" class="btn btn-info" data-confirm-post-delete><i class="glyphicon glyphicon-remove"></i> 삭제하기</a>
			    </c:if>
			  </sec:authorize>
			  &nbsp;&nbsp;<a href="${R}user/groupBBS"><button type="button" class="btn btn-info"><i class="glyphicon glyphicon-user"></i> 멘토 목록으로</button></a>
            </div>
            <hr/>
            <sec:authorize access="authenticated">
            	<div class="row">
	            		<div class="col-md-2">
	            			<img class="img-thumbnail img-responsive" 
                    src="<c:choose><c:when test="${post.currentUserProfileId ne -1}">
                    ${R}user/image/profile/${post.currentUserProfileId}</c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>" alt="Responsive image" width="80%" height="80%">
	            		</div>
	            		<div class="col-md-10">
			            	<div class="panel panel-info">
							  <div class="panel-heading">
							    <h3 class="panel-title">댓글 추가하기</h3>
							  </div>
							  <div class="panel-body">
							    <form:form method="post" modelAttribute="newComment">
							    	<form:textarea path="context" class="form-control"/>
							    	<br/>
							    	<div class="pull-right">
							    		<button type="submit" class="btn btn-success">등록</button>
							    	</div>
							    </form:form>
							  </div>
							</div>
						</div>
					</div>
            </sec:authorize>
            <c:if test="${ comments.size() ne 0 }">
            	<hr/>
            	<h4>Comment</h4>
            	<c:forEach var="comment" items="${ comments }">
            		<div class="row">
	            		<div class="col-md-2">
	            			<img class="img-thumbnail img-responsive" 
                    src="<c:choose><c:when test="${comment.profileId ne -1}">
                    <sec:authorize access="authenticated">${R}user/image/profile/${comment.profileId}</sec:authorize></c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>" alt="Responsive image" width="80%" height="80%">
	            		</div>
	            		<div class="col-md-10">
		            		<div class="panel panel-warning">
							  <div class="panel-heading">
							    <h3 class="panel-title">${ comment.userName }(${comment.userType})&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${comment.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h3>
							  </div>
							  <div class="panel-body">
							    ${ comment.context }
							    <sec:authorize access="authenticated">    	
							    	<div class="pull-right">
								    	<sec:authentication property="user.id" var="userId"/>
								    	<c:if test="${userId eq comment.userId }">
								    		<br/><br/>
								    		<a href="commentDelete.do?id=${post.id}&cmdId=${comment.id}&${groupBBSPagination.queryString}" class="btn btn-danger" data-confirm-comment-delete><i class="glyphicon glyphicon-remove"></i>삭제</a>
								    	</c:if>
							    	</div>
							    </sec:authorize>
							  </div>
							</div>
						</div>
					</div>
            	</c:forEach>
            </c:if>
          </div>
      </div>
    </div>
  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
