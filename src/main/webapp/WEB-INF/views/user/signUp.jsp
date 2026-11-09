<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Citizen Registration | Citizen Service Portal</title>
	<link rel="shortcut icon" href="${contextPath}/static/login/images/icon.png">  
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

	<style>
		* {
			font-family: 'Plus Jakarta Sans', sans-serif;
			box-sizing: border-box;
		}
		body {
			min-height: 100vh;
			background: linear-gradient(135deg, #0f172a 0%, #1e293b 50%, #1e3a8a 100%);
			background-attachment: fixed;
			color: #334155;
			display: flex;
			flex-direction: column;
			justify-content: space-between;
			position: relative;
		}
		.bg-pattern {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			background-image: radial-gradient(rgba(255, 255, 255, 0.08) 1px, transparent 0);
			background-size: 24px 24px;
			pointer-events: none;
		}
		.navbar-portal {
			background: rgba(15, 23, 42, 0.75);
			backdrop-filter: blur(12px);
			border-bottom: 1px solid rgba(255, 255, 255, 0.1);
			padding: 12px 0;
		}
		.portal-brand {
			display: flex;
			align-items: center;
			gap: 12px;
			color: #fff;
			text-decoration: none;
			font-weight: 700;
			font-size: 1.15rem;
		}
		.portal-brand img {
			height: 38px;
			background: #fff;
			border-radius: 8px;
			padding: 3px 6px;
		}
		.main-content {
			padding: 40px 0;
			z-index: 1;
		}
		.reg-card {
			background: #ffffff;
			border-radius: 20px;
			box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.35);
			padding: 40px;
			position: relative;
			overflow: hidden;
		}
		.reg-card::before {
			content: '';
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			height: 6px;
			background: linear-gradient(90deg, #1e3a8a, #3b82f6, #10b981);
		}
		.form-label {
			font-weight: 600;
			font-size: 0.875rem;
			color: #1e293b;
			margin-bottom: 6px;
		}
		.form-control {
			border: 1.5px solid #e2e8f0;
			border-radius: 10px;
			padding: 11px 14px;
			font-size: 0.95rem;
			transition: all 0.2s;
		}
		.form-control:focus {
			border-color: #2563eb;
			box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
		}
		.btn-portal-primary {
			background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%);
			border: none;
			color: #fff;
			font-weight: 700;
			padding: 14px;
			border-radius: 12px;
			font-size: 1rem;
			box-shadow: 0 4px 14px rgba(37, 99, 235, 0.35);
			transition: all 0.2s;
		}
		.btn-portal-primary:hover {
			background: linear-gradient(135deg, #1e40af 0%, #1d4ed8 100%);
			color: #fff;
			transform: translateY(-1px);
		}
		.footer-portal {
			border-top: 1px solid rgba(255, 255, 255, 0.1);
			color: #94a3b8;
			padding: 20px 0;
			font-size: 0.875rem;
			z-index: 1;
		}
	</style>
</head>
<body>
	<div class="bg-pattern"></div>

	<!-- Navigation Bar -->
	<nav class="navbar-portal">
		<div class="container d-flex justify-content-between align-items-center">
			<a href="${contextPath}/" class="portal-brand">
				<img src="${contextPath}/static/login/images/logo.png" alt="Emblem" onerror="this.style.display='none'" />
				<div>
					<div>Citizen Service Portal</div>
					<small style="font-size: 0.72rem; color: #94a3b8; font-weight: 400; display: block; line-height: 1;">Digital Citizen Registration</small>
				</div>
			</a>
			<div>
				<a href="${contextPath}/" class="btn btn-outline-light btn-sm px-3 rounded-pill">
					<i class="fa fa-arrow-left me-1"></i> Back to Sign In
				</a>
			</div>
		</div>
	</nav>

	<!-- Main Registration Form -->
	<div class="main-content">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-9">
					<div class="reg-card">
						<div class="d-flex align-items-center justify-content-between mb-3">
							<div>
								<span class="badge bg-primary-subtle text-primary border border-primary-subtle px-3 py-1 rounded-pill fw-semibold mb-2">
									<i class="fas fa-id-card me-1"></i> New Citizen Account
								</span>
								<h2 class="fw-bold mb-1" style="color: #0f172a;">Citizen Registration Form</h2>
								<p class="text-muted small mb-0">Fill out your personal details to create an official citizen portal profile.</p>
							</div>
							<div class="hidden-xs text-end">
								<i class="fas fa-user-check text-primary opacity-25" style="font-size: 3rem;"></i>
							</div>
						</div>
						<hr class="my-4" style="border-color: #f1f5f9;">

						<form action="${contextPath}/addSignUpUser.htm" id="userSignup" method="post" onsubmit="return validateSignUp(event);">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

							<div class="row g-3">
								<div class="col-md-6">
									<label class="form-label" for="name"><i class="fas fa-user text-muted me-1"></i> Full Name <span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="name" name="name" maxlength="100" placeholder="e.g. Ramesh Kumar" required>
								</div>
								<div class="col-md-6">
									<label class="form-label" for="userName"><i class="fas fa-at text-muted me-1"></i> Desired Username <span class="text-danger">*</span></label>
									<input type="text" class="form-control" id="userName" name="userName" maxlength="30" placeholder="e.g. ramesh123" required>
								</div>

								<div class="col-md-6">
									<label class="form-label" for="password"><i class="fas fa-key text-muted me-1"></i> Password <span class="text-danger">*</span></label>
									<input type="password" class="form-control" id="password" name="password" maxlength="50" placeholder="Create a secure password" required>
								</div>
								<div class="col-md-6">
									<label class="form-label" for="confirmPassword"><i class="fas fa-check-double text-muted me-1"></i> Confirm Password <span class="text-danger">*</span></label>
									<input type="password" class="form-control" id="confirmPassword" name="confirmPassword" maxlength="50" placeholder="Repeat your password" required>
								</div>

								<div class="col-md-6">
									<label class="form-label" for="mobileNumber"><i class="fas fa-phone text-muted me-1"></i> Mobile Number (10 Digits) <span class="text-danger">*</span></label>
									<input type="tel" class="form-control" id="mobileNumber" name="mobileNumber" maxlength="10" placeholder="e.g. 9876543210" pattern="[0-9]{10}" required>
								</div>
								<div class="col-md-6">
									<label class="form-label" for="emailId"><i class="fas fa-envelope text-muted me-1"></i> Email Address <span class="text-danger">*</span></label>
									<input type="email" class="form-control" id="emailId" name="emailId" maxlength="100" placeholder="e.g. citizen@example.com" required>
								</div>

								<div class="col-md-12">
									<label class="form-label" for="address"><i class="fas fa-map-marker-alt text-muted me-1"></i> Permanent Address <span class="text-danger">*</span></label>
									<textarea name="address" rows="2" id="address" class="form-control" maxlength="500" placeholder="Street, City, District, State, PIN" required></textarea>
								</div>

								<div class="col-md-12">
									<label class="form-label" for="remark"><i class="fas fa-comment-alt text-muted me-1"></i> Remark / Notes (Optional)</label>
									<input type="text" class="form-control" id="remark" name="remark" maxlength="100" value="Citizen Self Registration" placeholder="Optional notes">
								</div>
							</div>

							<div class="mt-4 pt-3 border-top d-flex flex-wrap align-items-center justify-content-between gap-3">
								<a href="${contextPath}/" class="text-decoration-none text-muted fw-semibold">
									<i class="fas fa-arrow-left me-1"></i> Already have an account? Sign In
								</a>
								<button type="submit" class="btn btn-portal-primary px-5">
									<i class="fas fa-user-plus me-2"></i> Register Account
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer-portal">
		<div class="container text-center">
			&copy; 2026 Citizen Service Portal &bull; Department of Digital Governance &bull; All Rights Reserved.
		</div>
	</footer>

	<script>
		function validateSignUp(e) {
			var name = document.getElementById('name').value.trim();
			var userName = document.getElementById('userName').value.trim();
			var pass = document.getElementById('password').value;
			var cpass = document.getElementById('confirmPassword').value;
			var mobile = document.getElementById('mobileNumber').value.trim();
			var email = document.getElementById('emailId').value.trim();
			var address = document.getElementById('address').value.trim();

			if (!name || !userName || !pass || !cpass || !mobile || !email || !address) {
				alert("Please fill in all mandatory fields marked with *.");
				e.preventDefault();
				return false;
			}
			if (pass !== cpass) {
				alert("Passwords do not match. Please re-enter.");
				document.getElementById('password').value = "";
				document.getElementById('confirmPassword').value = "";
				document.getElementById('password').focus();
				e.preventDefault();
				return false;
			}
			if (!/^\d{10}$/.test(mobile)) {
				alert("Please enter a valid 10-digit mobile number.");
				document.getElementById('mobileNumber').focus();
				e.preventDefault();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
