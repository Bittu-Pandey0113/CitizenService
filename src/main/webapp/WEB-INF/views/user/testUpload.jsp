<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<c:if test="${not empty successMessage}">
	<script>
		bootbox.alert("${successMessage}");  
	</script>
</c:if>
<c:if test="${not empty failureMessage}">
	<script>
		bootbox.alert("${failureMessage}"); 
	</script> 
</c:if> 

<header class="page-header">
	<h2>Testing File upload</h2> 
	<div class="right-wrapper pull-right">
		<ol class="breadcrumbs">
			<li><a href="${contextPath}/dashBoard.htm"> <i class="fa fa-home"></i> 
			</a></li> 
			<li><span>Dashboard</span></li>
			<li><span>Upload File</span></li>
		</ol>
	</div>
</header>
<!-- start: page -->
<div class="row">
	<div class="col-md-12">
		<section class="panel">
			<header class="panel-heading">
				<div class="panel-actions">
					<a href="#" class="fa fa-caret-down"></a>
				</div> 
				<h2 class="panel-title">File Upload</h2> 
			</header>
			<div class="panel-body">
				<form action="${contextPath}/testUpload.htm"  method="post"  id="fileUploadTest" enctype="multipart/form-data"> 
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
					<input type="hidden" name="roleId" value="${role.roleId}" />  
					<div class="row">					
						<div class="col-md-3">
							<div class="form-group">
								<label class="col-md-12" for="schemeName">Select File</label>
								<div class="col-md-12">
									<input type="file" class="form-control" id="newFile" maxlength="100" name="newFile" value="${role.roleType}"> 
								</div>
							</div>
						</div>
						
						<div class="col-md-12">
							<div class="text-center">
									<input type="submit" name="upload" value="Upload" id="upload" class="btn btn-success">&nbsp;&nbsp; 
								
							</div> 
						</div>
					</div>
				</form>
				
			</div>
		</section>
	</div>
</div>
					
<script>
	
</script>
