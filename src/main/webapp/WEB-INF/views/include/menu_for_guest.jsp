<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<body>
	<nav class="navbar navbar-default">
	    <div class="container-fluid">
	        <div class="navbar-header">
		      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-collapse">
		        <span class="sr-only">Toggle navigation</span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		        <span class="icon-bar"></span>
		      </button>
		      <a class="navbar-brand" href="${R}"><img src="${R}img/title.png"/></a>
	        </div>
		    <div class="collapse navbar-collapse" id="bs-collapse">   
		    	<ul class="nav navbar-nav">
			      	<li class="${ fn:contains(pageContext.request.servletPath, 'guest/index') ? 'active' : ''  }"><a href="${R}">
			          	<i class="glyphicon glyphicon-home"> 홈</i></a></li>
			        <li class="${ fn:contains(pageContext.request.servletPath, 'notice') ? 'dropdown active' : 'dropdown'  }">
			          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
			          <span class="caret"></span></a>
			            <ul class="dropdown-menu">
			              <li class="${ param.bd eq 1 ? 'active' : '' }"><a href="${R}guest/notice/list?bd=1">공지사항</a></li>
			              <li><a href="${R}guest/login">참여마당</a></li>
			            </ul>
			        </li>
			        <li class="${ fn:contains(pageContext.request.servletPath, 'intro/intro') ? 'active' : ''  }">
			          <a href="${R}guest/intro">멘토링 사업소개</a>
			        </li>
			        <li class="dropdown">
			          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
			          <span class="caret"></span></a>
			            <ul class="dropdown-menu">
			              <li><a href="${R}guest/login">멘티 신청</a></li>
			              <li><a href="${R}guest/login">멘토 신청</a></li>
			              <li ><a href="${R}guest/login">멘토/멘티 목록</a></li>
			              <li><a href="${R}guest/login">멘토링 게시판</a></li>
			              <li><a href="${R}guest/login">설문조사</a></li>
			            </ul>
			        </li>
		      </ul>
		      <ul class="nav navbar-nav navbar-right">
		        <li class="${ fn:contains(pageContext.request.servletPath, 'guest/login') or fn:contains(pageContext.request.servletPath, 'searchPassword') ? 'active' : ''  }"><a href="${R}guest/login"><i class="glyphicon glyphicon-user"> 로그인</i></a></li>
		        <li class="${ fn:contains(pageContext.request.servletPath, 'sign/sign') ? 'active' : ''  }"><a href="${R}guest/create.do"><i class="glyphicon glyphicon-pencil"> 회원가입</i></a></li>
		      </ul>
		   </div>
	   </div>
	</nav>
</body>