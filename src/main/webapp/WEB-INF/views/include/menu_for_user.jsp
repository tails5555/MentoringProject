<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
      <div class="navbar-header">
      	<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-collapse">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	    </button>
        <a class="navbar-brand" href="${R}user/index"><img src="${R}img/title.png"/></a>
      </div>
      <div class="collapse navbar-collapse" id="bs-collapse">
      <ul class="nav navbar-nav">
        <li class="${ fn:contains(pageContext.request.servletPath, 'user/index') ? 'active' : ''  }"><a href="${R}user/index">
          <i class="glyphicon glyphicon-home"> 홈</i></a></li>
        <li class="${ fn:contains(pageContext.request.servletPath, 'notice') ? 'dropdown active' : 'dropdown' }">
          <a class="dropdown-toggle" data-toggle="dropdown">알립니다
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li class="${ param.bd eq 1 ? 'active' : '' }"><a href="${R}user/notice/list?bd=1">공지사항</a></li>
              <li class="${ param.bd eq 2 ? 'active' : '' }"><a href="${R}user/notice/list?bd=2">참여마당</a></li>
            </ul>
        </li>
        <li class="${ fn:contains(pageContext.request.servletPath, 'intro/intro') ? 'active' : '' }">
          <a href="${R}user/intro">멘토링 사업소개</a>
        </li>
        <li class="${ fn:contains(pageContext.request.servletPath, 'menti_apli') or fn:contains(pageContext.request.servletPath, 'mento_apli') or fn:contains(pageContext.request.servletPath, 'groupBBS') or fn:contains(pageContext.request.servletPath, 'mento_list') or fn:contains(pageContext.request.servletPath, 'mentoringSurvey') ? 'dropdown active' : 'dropdown' }">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li class="${ fn:contains(pageContext.request.servletPath, 'mentoring/menti_apli') ? 'active' : '' }"><a href="${R}user/menti_apli">멘티 신청</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'mentoring/mento_apli') ? 'active' : '' }"><a href="${R}user/mento_apli">멘토 신청</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'mentoring/mento_list') ? 'active' : '' }"><a href="${R}user/mento_list">멘토/멘티 목록</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'groupBBS') ? 'active' : '' }"><a href="${R}user/groupBBS">멘토링 게시판</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'survey/mentoringSurvey') ? 'active' : '' }"><a href="${R}user/mentoringSurvey">설문조사</a></li>
            </ul>
        </li>
        <sec:authorize access="hasAnyRole('ROLE_MENTO', 'ROLE_STUDCHAIRMAN')">
        <li class="${ fn:contains(pageContext.request.servletPath, 'mento_timetable') or fn:contains(pageContext.request.servletPath, 'report/reportList') or fn:contains(pageContext.request.servletPath, 'report/view') or fn:contains(pageContext.request.servletPath, 'board_manage') ? 'dropdown active' : 'dropdown'}">
          <a class="dropdown-toggle" data-toggle="dropdown">멘토링 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li class="${ fn:contains(pageContext.request.servletPath, 'mento_timetable') ? 'active' : '' }"><a href="${R}user/mento_timetable?timetableView=공강">멘티 시간표 확인</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'report/reportList') or fn:contains(pageContext.request.servletPath, 'report/view') ? 'active' : '' }"><a href="${R}user/report/write">보고서 작성</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'board_manage') ? 'active' : '' }"><a href="${R}user/board_manage">멘토링 과제게시판 관리</a></li>
            </ul>
        </li>
        </sec:authorize>
        <sec:authorize access="hasAnyRole('ROLE_PROFESSOR', 'ROLE_EMPLOYEE', 'ROLE_STUDCHAIRMAN')">
        <li class="${ fn:contains(pageContext.request.servletPath, 'mento_open') or fn:contains(pageContext.request.servletPath, 'mentoList') or fn:contains(pageContext.request.servletPath, 'reportInfo') or fn:contains(pageContext.request.servletPath, 'propose') or fn:contains(pageContext.request.servletPath, 'candidate_boolean') or fn:contains(pageContext.request.servletPath, 'userManage') or fn:contains(pageContext.request.servletPath, 'survey/manage') or fn:contains(pageContext.request.servletPath, 'intro/list') or fn:contains(pageContext.request.servletPath, 'intro/detail') ? 'dropdown active' : 'dropdown' }">
          <a class="dropdown-toggle" data-toggle="dropdown">사이트 관리
          <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li class="${ fn:contains(pageContext.request.servletPath, 'mento_open') ? 'active' : '' }"><a href="${R}user/mento_open">멘토링 개설/폐쇄</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'reportInfo') or fn:contains(pageContext.request.servletPath, 'propose') or fn:contains(pageContext.request.servletPath, 'mentoList') ? 'active' : '' }"><a href="${R}user/report/confirm">보고서 확인</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'survey/manage') ? 'active' : '' }"><a href="${R}user/survey">설문조사 관리</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'candidate_boolean') ? 'active' : '' }"><a href="${R}user/schedule">멘토, 멘티 신청기간 여부</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'userManage') ? 'active' : '' }"><a href="${R}user/list">회원 목록 관리</a></li>
              <li class="${ fn:contains(pageContext.request.servletPath, 'intro/list') or fn:contains(pageContext.request.servletPath, 'intro/detail') ? 'active' : '' }"><a href="${R}user/intro/titleList">사업 안내문 수정</a></li>
            </ul>
        </li>
        </sec:authorize>
      </ul>
      <ul class="nav navbar-nav navbar-right">
      	<li style="text-align : right;"><sec:authentication property="user.userName"/><br/><b><sec:authentication property="user.userType"/></b>님 환영합니다.</li>
      	<li class="${ fn:contains(pageContext.request.servletPath, 'passwordChange') or fn:contains(pageContext.request.servletPath, 'myPage') ? 'active' : ''}"><a href="${R}user/Edit.do"><i class="glyphicon glyphicon-user"> 내정보</i></a></li>
        <li><a href="${R}user/logout_processing"><i class="glyphicon glyphicon-remove-sign"> 로그아웃</i></a></li>
      </ul>
    </div>
  </div>
</nav>