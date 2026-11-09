<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
    <header class="page-header">
	<h2>FeedBack From</h2> 
	<div class="right-wrapper pull-right">
		<ol class="breadcrumbs">
			<li><a href="${contextPath}/dashBoard.htm"> <i class="fa fa-home"></i> 
			</a></li> 
			<li><span>Dashboard</span></li>
			<li><span>Give FeedBack</span></li>
		</ol>
	</div>
</header>
<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">Give FeedBack</h2> 
					</header>
						<div class="panel-body">
				<form action="${contextPath}/feedBack.htm"  method="post"  id="giveFeedBack"> 
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
					<input type="hidden" name="roleId" value="${role.roleId}" />  
<!--  <pre> -->
   <h3><b>Mention Your Suggestion Inside The Box:</b></h3>  <br><textarea rows="15" cols="105" name="q" required></textarea>
    <div class="col-md-12">
						<div class="text-center">
							<input type="submit" name="submit" value="Add FeedBack" id="submitbtn" class="btn btn-success" >&nbsp;&nbsp; 
							<%-- <a href="${contextPath}/dashBoard.htm" type="button" class="btn btn-warning">Back</a>  --%>
						</div> 
					  </div>
   
                 <!--  <input type="submit" value="Add FeedBack"> -->
  <!-- </pre> -->
  </form>
		
