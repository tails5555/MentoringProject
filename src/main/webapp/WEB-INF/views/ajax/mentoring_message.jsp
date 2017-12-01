<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    	.scroll{
    		overflow : scroll; 
    		height : 150px; 
    		padding : 5px;
    	}
    </style>
 </head>
 <body>
 	<div class="row">
 		<div class="col-md-12">
 			<h3><i class="glyphicon glyphicon-refresh"></i> 최근 정보</h3>
 			<c:set value="${ mentoringPopups.get(0) }" var="first"/>
 			<ul class="list-group">
	 			<c:set value="" var="type"/>
	 			<c:if test="${first.popupType eq 1 }"><c:set value="list-group-item-info" var="type"/></c:if>
			    <c:if test="${first.popupType eq 2 }"><c:set value="list-group-item-success" var="type"/></c:if>
				<c:if test="${first.popupType eq 3 }"><c:set value="list-group-item-warning" var="type"/></c:if>
				<c:if test="${first.popupType eq 4 }"><c:set value="list-group-item-danger" var="type"/></c:if>
				<c:if test="${first.popupType eq 5 }"><c:set value="list-group-item-danger" var="type"/></c:if>
				<c:if test="${first.popupType eq 6 }"><c:set value="list-group-item-warning" var="type"/></c:if>
				<li class="list-group-item ${ type }">
				<span class="badge">
				  	<c:if test="${first.popupType eq 1 }"><i class="glyphicon glyphicon-plus"></i></c:if>
				  	<c:if test="${first.popupType eq 2 }"><i class="glyphicon glyphicon-ok"></i></c:if>
				  	<c:if test="${first.popupType eq 3 }"><i class="glyphicon glyphicon-user"></i></c:if>
				  	<c:if test="${first.popupType eq 4 }"><i class="glyphicon glyphicon-remove"></i></c:if>
				  	<c:if test="${first.popupType eq 5 }"><i class="glyphicon glyphicon-thumbs-down"></i></c:if>
				  	<c:if test="${first.popupType eq 6 }"><i class="glyphicon glyphicon-question-sign"></i></c:if>
				  </span>
				  ${ first.context }
				</li>
			</ul>
			<hr/>
  			<h3><i class="glyphicon glyphicon-zoom-in"></i> 자세히 보기</h3>
  			<div class="scroll">
	 			<ul class="list-group">
	 			<c:forEach var="popup" items="${ mentoringPopups }">
	 				<c:set value="" var="type"/>
	 				<c:if test="${popup.popupType eq 1 }"><c:set value="list-group-item-info" var="type"/></c:if>
			    	<c:if test="${popup.popupType eq 2 }"><c:set value="list-group-item-success" var="type"/></c:if>
					<c:if test="${popup.popupType eq 3 }"><c:set value="list-group-item-warning" var="type"/></c:if>
					<c:if test="${popup.popupType eq 4 }"><c:set value="list-group-item-danger" var="type"/></c:if>
					<c:if test="${popup.popupType eq 5 }"><c:set value="list-group-item-danger" var="type"/></c:if>
					<c:if test="${popup.popupType eq 6 }"><c:set value="list-group-item-warning" var="type"/></c:if>
				  <li class="list-group-item ${ type }">
				  	<span class="badge">
				  		<c:if test="${popup.popupType eq 1 }"><i class="glyphicon glyphicon-plus"></i></c:if>
				  		<c:if test="${popup.popupType eq 2 }"><i class="glyphicon glyphicon-ok"></i></c:if>
				  		<c:if test="${popup.popupType eq 3 }"><i class="glyphicon glyphicon-user"></i></c:if>
				  		<c:if test="${popup.popupType eq 4 }"><i class="glyphicon glyphicon-remove"></i></c:if>
				  		<c:if test="${popup.popupType eq 5 }"><i class="glyphicon glyphicon-thumbs-down"></i></c:if>
				  		<c:if test="${popup.popupType eq 6 }"><i class="glyphicon glyphicon-question-sign"></i></c:if>
				  	</span>
				  	${ popup.context }
				  </li>
				</c:forEach>
				</ul>
			</div>
 		</div>
 	</div>
 </body>