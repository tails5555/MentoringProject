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


      p.animate{
        font-size : 20px;
        color : #FFFFFF;
        font-style:italic;
        font-weight: bold;
        animation-duration : 2s;
        animation-name : slidein;
      }
      @keyframes slidein {
        from {
          margin-left: 100%;
          width: 300%
        }

        to {
          margin-left: 0%;
          width: 100%;
        }
      }
      div.row{
        margin-left : auto;
        margin-right : auto;
      }
      .col-md-5{
        border-radius : 15px;
        background-color : #E0F8E6;
        margin-top : 10px;
        margin-right : 60px;
        margin-left : 60px;
      }
      .col-md-2{
        border-radius : 15px;
        background-color : #A9F5F2;
        margin-top : 10px;
        margin-bottom : 10px;
        margin-right : 30px;
        margin-left : 30px;
        padding-top : 10px;
        padding-bottom : 10px;
      }

        .footer { border: 1px padding: 30px 10px; }
      .footer{ position: absolute; bottom: 0; text-align: center; width: 100% }
        .footer img { margin-right: 20px;  }
        .footer div:nth-child(2) { font: normal 9pt 굴림; color: #666;  }
        .footer div:nth-child(3) { font: normal 9pt arial; color: #aaa; }


        .container { margin-top: 30px;  }
   </style>
	<script type="text/javascript" language="javascript">
 	var auto_refresh=setInterval(
 			function(){
 				$('#dataArea').load('popup?type=0').fadeIn('slow');
 			}, 5000
 	);
 	
    $(document).ready(function(){
         
         
        $.ajax({
             
            type : "GET",
            url : "popup?type=0",
            dataType : "text",
            error : function(){
                alert('통신실패!!');
            },
            success : function(data){
                $("#dataArea").html(data) ;
            }
             
        });
         
 
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
          <h1 class="my-4"><strong>사이트 관리</strong></h1>
          <div class="list-group">
            <a href="${R}user/mento_open" class="list-group-item ">멘토링 개설/폐쇄</a>
            <a href="${R}user/report/confirm" class="list-group-item active">보고서 확인</a>
            <a href="${R}user/survey" class="list-group-item ">설문조사 관리</a>
            <a href="${R}user/schedule" class="list-group-item">멘토, 멘티 신청기간 여부</a>
            <a href="${R}user/list" class="list-group-item ">회원 목록 관리</a>
            <a href="${R}user/intro/titleList" class="list-group-item">사업 안내문 수정</a>
          </div>
        </div>
        <!-- /.col-lg-3 -->

        <div class="col-md-9">
	      <h1 class="my-4"><strong>보고서 확인</strong></h1>
	      <hr/>
	      <p style="padding-left: 20px">멘토의 사진을 클릭하시면 해당 멘토의 보고서들을 볼 수 있습니다.</p>
	      <div id="dataArea">
	      </div>
	      <br/>
	      <span class="badge">범례 별 알림</span>
	      <a href="${R}user/report/popup?type=1" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-info"><i class="glyphicon glyphicon-plus"></i> 추가</span></a>
  		  <a href="${R}user/report/popup?type=2" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-warning"><i class="glyphicon glyphicon-pencil"></i> 수정</span></a>
  		  <a href="${R}user/report/popup?type=3" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-success"><i class="glyphicon glyphicon-ok"></i> 확인 완료</span></a>
  		  <a href="${R}user/report/popup?type=4" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-danger"><i class="glyphicon glyphicon-bullhorn"></i> 커멘트 안내</span></a>
  		  <a href="${R}user/report/popup?type=5" onClick="window.open(this.href,'','width=600, height=400, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false;"><span class="label label-danger"><i class="glyphicon glyphicon-erase"></i> 보고서 삭제</span></a>
	      <hr/>
          <!-- Introduction Row -->
          <!-- Team Members Row -->
          <div class="row">
            <div class="col-md-12">
              <h2 class="my-4"><i>Mento</i></h2>
            </div>
			<c:forEach var="mento" items="${ mentos }" varStatus="status">
				<c:if test="${status.index %3 eq 0 }"><div class="row"></c:if>
	            <div class="col-md-4 text-center mb-4">
	              <a href="${R}user/report/confirmReportList?mento=${mento.id}"><img class="rounded-circle img-fluid d-block mx-auto" 
	              	src="<c:choose>
	              			<c:when test="${mento.profileId ne -1}">${R}user/image/profile/${mento.profileId}</c:when>
	              			<c:otherwise>${R}img/mento_photo.jpg</c:otherwise>
	              		</c:choose>" alt="" width="200" height="200"></a>
	              <h3>${ mento.name }
	                <small>${ mento.departmentName }</small>
	              </h3>
	              <p><b>${ mento.teamName }</b></p>
	              <p>${ mento.advertiseContext }</p>
	            </div>
            <c:if test="${status.index % 3 eq 2 || status.index+1 eq mentos.size() }"></div><br/></c:if>
			</c:forEach>
          </div>
        </div>
      </div>
  </div>
  <%@ include file="/WEB-INF/views/include/footer.jsp" %>
 </body>
</html>