<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header class="page-header">
	<h2>Check Application Status Form</h2> 
	<div class="right-wrapper pull-right">
		<ol class="breadcrumbs">
			<li><a href="${contextPath}/dashBoard.htm"> <i class="fa fa-home"></i> 
			</a></li> 
			<li><span>Dashboard</span></li>
			<li><span>Check Application Status</span></li>
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
				<h2 class="panel-title">Birth Application Status</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/checkApplicationStatus.htm" id="checkAS" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<input type="hidden" name="userId" value="${user.userId}" />  
					<div class="row">					
						<div class="col-md-3">
								<div class="text-center">
									<c:choose>
										<c:when test="${birthStatus ne null}">
											<p>YOUR BIRTH CERTIFICATE APPLICATION IS ${birthStatus}.</p>
										</c:when>
										<c:otherwise>
											<p>YOU HAVE NOT APPLIED FOR BIRTH CERTIFICATE.</p>
										</c:otherwise>
									</c:choose>
									
								</div>
							</div>
					   </div>	
					   
					   
					<c:if test="${birthStatus eq 'APPROVED'}">  
					<div class="row">					
						<div class="col-md-12">
								<div class="text-center">
									<center><p>HERE IS YOUR APPLIED BIRTH CERTIFICATE.</p></center>
								</div>
							</div>
					   </div>	
					   <div class="col-md-12">
  						<div class="text-center">
							<!-- <input type="download" name="download" value="Download Here" id="downloadbtn" class="btn btn-success" >&nbsp;&nbsp; -->
							<a href="${contextPath}/printBCertificate.htm" type="button" class="btn btn-warning">See Here</a>  
  						</div> 
					</div> 
					</c:if>
					
				
				</form>
				</div>
		</section>	
    </div>
</div>			

<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">Death Application Status</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/checkApplicationStatus.htm" id="checkAS" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<input type="hidden" name="userId" value="${user.userId}" />  
					<div class="row">					
						<div class="col-md-3">
								<div class="text-center">
									<c:choose>
										<c:when test="${deathStatus ne null}">
											<p>YOUR DEATH CERTIFICATE APPLICATION IS ${deathStatus}.</p>
										</c:when>
										<c:otherwise>
											<p>YOU HAVE NOT APPLIED FOR DEATH CERTIFICATE.</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
					   </div>	
					   
					   
					<c:if test="${deathStatus eq 'APPROVED'}">  
					<div class="row">					
						<div class="col-md-12">
								<div class="text-center">
									<center><p>HERE IS YOUR APPLIED DEATH CERTIFICATE.</p></center>
								</div>
							</div>
					   </div>	
					   <div class="col-md-12">
  						<div class="text-center">
							<!-- <input type="download" name="download" value="Download Here" id="downloadbtn" class="btn btn-success" >&nbsp;&nbsp;  -->
							<a href="${contextPath}/printDCertificate.htm" type="button" class="btn btn-warning">See Here</a>   
  						</div> 
					</div> 
					</c:if>
					
				
				</form>
				</div>
		</section>	
    </div>
</div>			

<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">Marriage Application Status</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/checkApplicationStatus.htm" id="checkAS" method="post"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />   
					<input type="hidden" name="userId" value="${user.userId}" />  
					<div class="row">					
						<div class="col-md-3">
								<div class="text-center">
									<c:choose>
										<c:when test="${marriageStatus ne null}">
											<p>YOUR MARRIAGE CERTIFICATE APPLICATION IS ${marriageStatus}.</p>
										</c:when>
										<c:otherwise>
											<p>YOU HAVE NOT APPLIED FOR MARRIAGE CERTIFICATE.</p>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
					   </div>	
					   
					<c:if test="${marriageStatus eq 'APPROVED'}">  
					<div class="row">					
						<div class="col-md-12">
								<div class="text-center">
									<center><p>HERE IS YOUR APPLIED MARRIAGE CERTIFICATE.</p></center>
								</div>
							</div>
					   </div>	
					   <div class="col-md-12">
  						<div class="text-center">
							<!-- <input type="download" name="download" value="Download Here" id="downloadbtn" class="btn btn-success" >&nbsp;&nbsp; -->
							<a href="${contextPath}/printMCertificate.htm" type="button" class="btn btn-warning">See Here</a>  
  						</div> 
					</div> 
					</c:if>
					
				
				</form>
				</div>
		</section>	
    </div>
</div>									