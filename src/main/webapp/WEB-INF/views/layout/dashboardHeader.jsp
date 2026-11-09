<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
	
			<header class="header">
				<div class="logo-container">
					<a href="${contextPath}/dashBoard.htm" class="logo" style="text-decoration:none;"> 
						<img src="${contextPath}/static/login/images/logo.png" height="35" alt="Citizen Service Portal" />
						<span style="font-weight: 700; color: #1e3a8a; font-size: 16px; margin-left: 8px; vertical-align: middle;">CITIZEN SERVICE PORTAL</span>
					</a>
					<div class="visible-xs toggle-sidebar-left" data-toggle-class="sidebar-left-opened" data-target="html" data-fire-event="sidebar-left-opened">
						<i class="fa fa-bars" aria-label="Toggle sidebar"></i>
					</div>
				</div> 
				<div class="header-right"> 
					<span class="separator"></span>
						<button type="button" id="fullScreen_panel" title="Toggle Fullscreen"><i class="fa fa-arrows-alt" aria-hidden="true"></i></button>
					<span class="separator"></span>		
					<div id="userbox" class="userbox">
						<a href="#" data-toggle="dropdown">
							<figure class="profile-picture">
								<img src="${contextPath}/resources/admin_pannel/images/avtar.png" alt="Logged User" class="img-circle"/>
							</figure>
							<div class="profile-info">
								<span class="name">${not empty userName ? userName : 'Citizen User'}</span>  
								<span class="role"><span class="badge" style="background:#2563eb; color:#fff; font-size:10px; padding:2px 8px;">${not empty roleName ? roleName : 'User'}</span></span> 
							</div> 
							<i class="fa custom-caret"></i>
						</a>			
						<div class="dropdown-menu">
							<ul class="list-unstyled">
								<li class="divider"></li>
								<li>
									<a role="menuitem" tabindex="-1" href="${contextPath}/editProfile.htm"><i class="fa fa-user-circle-o"></i> Edit Profile</a> 
								</li> 
								<li>
									<a role="menuitem" tabindex="-1" href="${contextPath}/changePassword.htm"><i class="fa fa-key"></i> Change Password</a> 
								</li> 
								<li>
									<a role="menuitem" tabindex="-1" href="javascript:logout()"><i class="fa fa-power-off" style="color:#ef4444;"></i> Sign Out</a>
								</li> 
							</ul>
						</div>
					</div>
				</div> 
			</header> 
			<form action="${contextPath}/logout" id="logout" method="post">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />	
			</form>   
			<script>
				function logout(){
					if (confirm("Are you sure you want to sign out?")) {
						$("#logout").submit();
					}
				}  
				(function() {
					var today = new Date().toLocaleDateString('en-US', { weekday: 'short', year: 'numeric', month: 'short', day: 'numeric' });
					['currentDate1', 'currentDate2', 'currentDate3'].forEach(function(id) {
						var el = document.getElementById(id);
						if (el) el.innerHTML = today;
					});
				})();
		    </script> 
		    <script src="${contextPath}/static/js/applicationDetails.js"></script>
