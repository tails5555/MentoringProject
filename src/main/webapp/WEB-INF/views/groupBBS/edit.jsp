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
    <link rel="stylesheet" href="${R}res/summernote/summernote.css">
    <script src="${R}res/summernote/summernote.js"></script>
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


      .container { margin-top: 30px;  }
      .application{ margin-top: 20px; }

      label{
        margin-right: 10px
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
      <!-- Introduction Row -->
          <h1 class="my-4"><strong>멘토링 게시판</strong> - 게시글 ${ newPost.id > 0 ? '수정' : '등록' }</h1>
          	<h3 class="my-4"><strong>☞ ${ mento.teamName }</strong> - ${ mento.mentoName } 멘토</h3>
            <hr/>

          <!-- Team Members Row -->
          <div class="row">
            <div class="col-md-12">
                <div class="application">
                	<form:form method="post" modelAttribute="newPost" enctype="multipart/form-data">
                	  <form:hidden path="id" />
                      <div class="control-group">
                        <div class="form-group floating-label-form-group controls">
                          <label>이름 </label>
                          <sec:authentication property="user.userName"/>
                        </div>
                      </div>
                      <div class="control-group">
                        <div class="form-group floating-label-form-group controls">
                          <label>제목 </label>
                          <form:input path="title" class="form-control form-inline"/>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-md-12">
                          <div id="summernote">${ newPost.context }</div>
                          <input type="hidden" name="context">
                        </div>
                      </div>
                      <div class="control-group">
                        <div class="form-group floating-label-form-group controls">
                          <label><c:if test="${ newPost.id > 0 }">추가할 </c:if>첨부파일 </label>
                          <input type="file" name="fileUpload" class="form-control" multiple/>
                        </div>
                        <br/>
                        <c:if test="${ newPost.id > 0 }">
                        	<p>현재까지 이 게시물에 올린 파일의 수는 ${ files.size() }개 올렸습니다.</p>
                        </c:if>
                      </div>
                    </form:form>
                      <hr/>
                      <div class="search" align="right">
                        <button type="submit" onclick="save()" class="btn btn-default"><i class="glyphicon glyphicon-pencil"> 작성</i></button>
                        <c:if test="${ newPost.id > 0 }">
                        	<a href="view?id=${newPost.id}&${groupBBSPagination.queryString}"><button type="button" class="btn btn-default"><i class="glyphicon glyphicon-modal-window"> 이전으로</i></button></a>
                        </c:if>
                        <c:if test="${ newPost.id eq 0 }">
                        	<a href="list?${groupBBSPagination.queryString}"><button type="button" class="btn btn-default"><i class="glyphicon glyphicon-menu-hamburger"> 게시판 목록으로</i></button></a>
                        </c:if>
                      </div>
                      <script>
                        $('#summernote').summernote({height : 400});
                        function save(){
                          var s=$('#summernote').summernote('code');
                          $('input[name=context]').val(s);
                          $('form').submit();
                        }
                      </script>
                </div>
                
              </div>
            </div>
          </div>
        </div>
       </div>
    <!-- /.container -->
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>
