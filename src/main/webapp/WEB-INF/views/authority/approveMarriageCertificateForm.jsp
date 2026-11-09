<%@ taglib uri="jakarta.tags.core" prefix="c" %>  
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>  
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 

				<header class="page-header">
					<h2>Marriage Certificate Application View</h2>
					<div class="right-wrapper pull-right">
						<ol class="breadcrumbs">
							<li>
								<a href="${contextPath}/dashBoard.htm"> 
									<i class="fa fa-home"></i>
								</a>
							</li>
							<li><span>Dashboard</span></li>
							<li><span>Marriage Certificate Application View</span></li>
						</ol>
					</div>
				</header>
				<!-- start: page -->
				<!-- <pre> --><div class="row">
					<div class="col-md-12">
						<section class="panel">
							<header class="panel-heading">
								<div class="panel-actions">
									<a href="#" class="fa fa-caret-down"></a>
								</div> 
								<h2 class="panel-title">Marriage Certificate Application List</h2>
							</header>
							<div class="panel-body">
								<div class="row">
									<div class="col-md-12">
										<table class="DataTable table table-striped table-bordered table-hover" id="dynamicTable"> 
											<thead>
												<tr>
													<th>Serial Number</th> 
													<th>Groom Name</th>
													<th>Groom Id Proof</th> 
													<!-- <th>Groom Photo</th>  -->
													<th>Groom Mobile No</th> 
													<th>Groom Witness Name</th> 
													<!-- <th>Groom WitnessId</th>  -->
													<th>Bride Name</th> 
													<th>Bride Id Proof</th>
													<!-- <th>Bride Photo</th>  -->
													<th>Bride Witness Name</th> 
													<!-- <th>Bride Witness Id</th> -->
													<th>Marriage Date</th>
													<th>Marriage Type</th>
													<th>Groom Signature</th> 
													<th>Bride Signature</th> 
													<th>Status</th>
													<th>Action</th>												
												</tr>
											</thead>
											<tbody id="tbd">
										 	<c:forEach items="${marriageCertificateLIst}" var="user" varStatus="serialNumber">  		 								
												<tr>
													<td>${serialNumber.count}</td>  
													<td>${user.groomName}</td>
													<td>${user.groomIdProof}</td> 
													<%-- <td>${user.groomPhoto}</td>	 --%>
													<td>${user.groomMobile}</td>	
													<td>${user.groomWitnessName}</td>  
													<%-- <td>${user.groomWitnessId}</td> --%>
													<td>${user.brideName}</td> 
													<td>${user.brideIdProof}</td>	
													<%-- <td>${user.bridePhoto}</td> --%>
													<td>${user.brideWitnessName}</td>
													<%-- <td>${user.brideWitnessId}</td>	 --%>
													<td>${user.marriageDate}</td>														
													<td>${user.marriageType}</td>	
													<td>${user.groomSign}</td>	
													<td>${user.brideSign}</td>
												    <td>${user.status}</td>
																								
													<td>
														
															<button class="btn btn-success btn-md" value="Approve" onclick="approveUser('${user.marriageCertificateApplicationId}')" >  
																
															</button>
															
														
													</td> 
												</tr>
										</c:forEach> 
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</section>
					</div>
				</div>
				<!-- </pre> -->
		<form action="${contextPath}/approveUserMarriageCertificate.htm" method="GET" id="approveUserMarriageCertificate">
			<input type="hidden" name="applicationid" id="applicationid" /> 
		</form>
		
		
			<script> 
			function approveUser(appId){
				$("#applicationid").val(appId);
				bootbox.confirm("Do you want to approve this Marriage Certificate?",
				function(result) {
					if (result == true) {
					   $("#approveUserMarriageCertificate").submit();
					} 
				});
			}	
			
		</script>
	