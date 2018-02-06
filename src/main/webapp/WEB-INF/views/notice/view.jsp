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
        border : 1px solid #A9F5BC;
        background-color : #CEF6D8;
        font-weight : bold;
        text-align : center;
      }
      .reportInput{
        padding-left : 5px;
        padding-right : 5px;
        padding-top : 12px;
        padding-bottom : 12px;
        border : 1px solid #A9F5BC;
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
            	<a href="${R}guest/notice/list?bd=1" class="list-group-item <c:if test="${param.bd eq 1}">active</c:if>">공지사항</a>
            </sec:authorize>
          	<sec:authorize access="authenticated">
            	<a href="${R}user/notice/list?bd=1" class="list-group-item <c:if test="${param.bd eq 1}">active</c:if>">공지사항</a>
            </sec:authorize>
            <a href="${R}user/notice/list?bd=2" class="list-group-item <c:if test="${param.bd eq 2}">active</c:if>">참여마당</a>
          </div>
        </div>
        <div class="col-md-9">
          
          <!-- Team Members Row -->
          <div class="row">
            <h1 class="my-4"><strong>${noticeBBS.bbsName}</strong></h1><h3><b>게시물 확인</b></h3>
            
            <div class="row">
              <div class="col-md-2"><br/><img class="img-thumbnail img-responsive" 
                    src="<c:choose><c:when test="${noticePost.profileId ne -1}">
                    <sec:authorize access="not authenticated">${R}guest/image/profile/${noticePost.profileId}</sec:authorize>
                    <sec:authorize access="authenticated">${R}user/image/profile/${noticePost.profileId}</sec:authorize></c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>" alt="Responsive image">
              </div>
              <div class="col-md-10">
	            <div class="row">
	            	<div class="col-md-2 reportEntity">제목</div>
	            	<div class="col-md-10 reportInput">${ noticePost.title }</div>
	            </div>
              	<div class="row">
              		<div class="col-md-2 reportEntity">올린이</div>
		            <div class="col-md-4 reportInput">${ noticePost.userName }</div>
		            <div class="col-md-2 reportEntity">올린 날짜</div>
		            <div class="col-md-4 reportInput"><fmt:formatDate value="${noticePost.writeDate}" pattern="yyyy-MM-dd HH:mm"/></div>
              	</div>
              	<div class="row">
	              <div class="col-md-2 reportEntity">연락</div>
	              <div class="col-md-4 reportInput">${ noticePost.userEmail }</div>
	              <div class="col-md-2 reportEntity">조회수</div>
	              <div class="col-md-4 reportInput">${ noticePost.views }</div>
	            </div>
              </div>
            </div>
            <br/>
            <c:if test="${noticeFile.size() ne 0}">
	            <div class="row">
	            	<div class="col-md-12 reportEntity">첨부 파일</div>
	            </div>
	            <div class="row">
	            	<div class="col-md-12 reportInput">
		            	<table class="table">
		            		<c:forEach var="file" items="${ noticeFile }">
		            			<tr>
		            				<td style="text-align : center;"><i class="glyphicon glyphicon-save-file"></i></td>
		            				<td style="text-align : center;"><a href="download?id=${file.id}&${pagination.queryString}">${ file.fileName }</a></td>
		            				<td style="text-align : center;"><fmt:formatDate pattern="yy-MM-dd HH:mm" value="${ file.fileTime }"></fmt:formatDate></td>
		            				<td style="text-align : center;"><fmt:formatNumber pattern="0.00" value="${ file.fileSize/1024/1024 }"/>MB</td>
		            				<sec:authorize access="authenticated">
			            				<sec:authentication property="user.id" var="userId"/>
									    <c:if test="${userId eq noticePost.userId }">
									    	<td style="text-align : center;"><a href="fileDelete?id=${noticePost.id}&fId=${file.id}&${pagination.queryString}" class="btn btn-danger" data-confirm-file-delete><i class="glyphicon glyphicon-trash"></i> 파일 삭제</a></td>
									    </c:if>
									</sec:authorize>
		            			</tr>
		            		</c:forEach>
		            	</table>
		            	<sec:authorize access="authenticated">
			            	<sec:authentication property="user.id" var="userId"/>
		            		<c:if test="${userId eq noticePost.userId }">
							    	<hr/>
							    	<a href="fileAllDelete?id=${noticePost.id}&${pagination.queryString}" class="btn btn-danger" data-confirm-fileAll-delete><i class="glyphicon glyphicon-trash"></i> 모든 파일 삭제</a>
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
                <div id="context">${ noticePost.context }</div>
              </div>
            </div>
            <div class="complete" align="right">
              <a href="list.do?${pagination.queryString}"><button class="btn btn-info" type="button"><i class="glyphicon glyphicon-arrow-left"> 뒤로가기</i></button></a>
              <sec:authorize access="authenticated">    	
			    <sec:authentication property="user.id" var="userId"/>
			    <c:if test="${userId eq noticePost.userId }">
			    	&nbsp;&nbsp;
			    	<a href="edit.do?id=${noticePost.id}&${pagination.queryString}" class="btn btn-info" ><i class="glyphicon glyphicon-pencil"></i> 수정하기 / ${ noticeFile.size() > 0 ? "파일 추가" : "새로운 파일 추가" }</a>
			    	&nbsp;&nbsp;
			    	<a href="postDelete.do?id=${noticePost.id}&${pagination.queryString}" class="btn btn-info" data-confirm-post-delete><i class="glyphicon glyphicon-remove"></i> 삭제하기</a>
			    </c:if>
			  </sec:authorize>
            </div>
            <hr/>
            <sec:authorize access="not authenticated">
            	<div class="panel panel-info">
				  <div class="panel-heading">
				    <h3 class="panel-title">댓글을 달 권한이 없습니다.</h3>
				  </div>
				  <div class="panel-body">
				    <a href="${R}guest/login">로그인</a> 후 이용해주시길 바랍니다.
				  </div>
				</div>
            </sec:authorize>
            <sec:authorize access="authenticated">
            <h4>댓글 등록하기</h4>
            <hr/>
            <form:form method="post" modelAttribute="newComment">
            	<div class="media">
					  <div class="media-left">
					      <img class="media-object img-thumbnail" width="64" height="64" src="<c:choose><c:when test="${noticePost.currentUserProfileId ne -1}">
                    		<sec:authorize access="not authenticated">${R}guest/image/profile/${noticePost.currentUserProfileId}</sec:authorize>
                    		<sec:authorize access="authenticated">${R}user/image/profile/${noticePost.currentUserProfileId}</sec:authorize></c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>" />
					  </div>
					  <div class="media-body">
					    	<form:textarea path="context" class="form-control"/>
					    	<br/>
					  </div>
					  <sec:authorize access="authenticated">    	
					    	<div class="media-right">
					    		<button type="submit" class="btn btn-success">등록</button>
					    	</div>
					  </sec:authorize>
				</div>
			</form:form>
            </sec:authorize>
            <c:if test="${ noticeComment.size() ne 0 }">
            	<hr/>
            	<h4>Comments</h4>
            	<hr/>
            	<c:forEach var="comment" items="${ noticeComment }">
            		<div class="media">
					  <div class="media-left">
					      <img class="media-object img-thumbnail" width="64" height="64" src="<c:choose><c:when test="${comment.profileId ne -1}">
                    		<sec:authorize access="not authenticated">${R}guest/image/profile/${comment.profileId}</sec:authorize>
                    		<sec:authorize access="authenticated">${R}user/image/profile/${comment.profileId}</sec:authorize></c:when><c:otherwise>${R}img/mento_photo.jpg</c:otherwise></c:choose>">
					  </div>
					  <div class="media-body">
					    <h4 class="media-heading">${ comment.userName }(${comment.userType})</h4>
					    <h5><fmt:formatDate value="${comment.uploadTime}" pattern="yyyy-MM-dd HH:mm:ss"/></h5>
					    ${ comment.context }
					  </div>
					  <sec:authorize access="authenticated">    	
					    	<div class="media-right">
						    	<sec:authentication property="user.id" var="userId"/>
						    	<c:if test="${userId eq comment.userId }">
						    		<br/><br/>
						    		<a href="commentDelete.do?id=${noticePost.id}&cmdId=${comment.id}&${pagination.queryString}" class="btn btn-danger" data-confirm-comment-delete><i class="glyphicon glyphicon-remove"></i>삭제</a>
						    	</c:if>
					    	</div>
					  </sec:authorize>
					</div>
					<hr/>
            	</c:forEach>
            </c:if>
          </div>
      </div>
    </div>
  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
