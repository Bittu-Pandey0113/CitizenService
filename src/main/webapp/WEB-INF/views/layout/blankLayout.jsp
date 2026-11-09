<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

<!doctype html>
<html>
	<head>
		
		<meta charset="UTF-8">
		<title>Citizen Service Portal</title>
		<link rel="shortcut icon" href="${contextPath}/static/login/images/icon.png"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/font-awesome/css/font-awesome.css" />
		<link rel="stylesheet" href="${contextPath}/resources/admin_pannel/vendor/bootstrap/css/bootstrap.css" />
		<link href="${contextPath}/resources/admin_pannel/vendor/jquery_datepicker/jquery.datepick.css" rel="stylesheet">
		<link rel="stylesheet" href="${contextPath}/resources/apply_scheme_assets/apply_scheme.css" />
		<link rel="stylesheet" href="${contextPath}/resources/apply_scheme_assets/printform.css" />
		<script src="${contextPath}/resources/admin_pannel/vendor/jquery/jquery.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/bootstrap/js/bootstrap.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/jquery_datepicker/jquery.plugin.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/jquery_datepicker/jquery.datepick.js"></script>
		<script src="${contextPath}/resources/admin_pannel/vendor/bootbox/bootbox.min.js"></script>
	</head>
<body>
	    <c:if test="${not empty layoutHeader}"><jsp:include page="${layoutHeader}" /></c:if>
	    <div class="content_body">
			<div id="SkipToContent"></div>
			<div class="container">
	        	<jsp:include page="${layoutBody}" />
	        </div>
	    </div>
	    <c:if test="${not empty layoutFooter}"><jsp:include page="${layoutFooter}" /></c:if>
	    <script src="resources/apply_scheme_assets/easyview.js"></script>
	    <script>
			$(function(){
				$('#font-setting-buttons').easyView({
					increaseSelector: '.increase-me',
					decreaseSelector: '.decrease-me',
					normalSelector: '.reset-me',
					contrastSelector: '.change-me'
				});
			});
		</script>
	    <script src="${contextPath}/resources/apply_scheme_assets/apply_scheme.js"></script>
	    <script src="${contextPath}/static/js/applicationDetails.js"></script>  
	</body>
</html> 
