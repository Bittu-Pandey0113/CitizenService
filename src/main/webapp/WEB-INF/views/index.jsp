<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 
<c:set var="contextPath" value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Citizen Service Portal | Official Government Services</title>
	<link rel="shortcut icon" href="${contextPath}/static/login/images/icon.png">  
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/css/bootstrap.min.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" />
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">

	<style>
		:root {
			--primary-color: #1e3a8a;
			--primary-hover: #1e40af;
			--accent-color: #f59e0b;
			--bg-dark: #0f172a;
			--card-bg: rgba(255, 255, 255, 0.95);
		}
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
			overflow-x: hidden;
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
		.portal-brand:hover {
			color: #e2e8f0;
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
		.hero-badge {
			display: inline-flex;
			align-items: center;
			gap: 8px;
			background: rgba(37, 99, 235, 0.2);
			border: 1px solid rgba(96, 165, 250, 0.3);
			color: #93c5fd;
			padding: 6px 14px;
			border-radius: 50px;
			font-size: 0.85rem;
			font-weight: 600;
			margin-bottom: 20px;
		}
		.hero-title {
			color: #fff;
			font-weight: 800;
			font-size: 2.75rem;
			line-height: 1.15;
			margin-bottom: 16px;
			letter-spacing: -0.02em;
		}
		.hero-subtitle {
			color: #cbd5e1;
			font-size: 1.1rem;
			line-height: 1.6;
			margin-bottom: 30px;
		}
		.feature-card {
			background: rgba(255, 255, 255, 0.06);
			border: 1px solid rgba(255, 255, 255, 0.1);
			border-radius: 12px;
			padding: 16px;
			color: #e2e8f0;
			margin-bottom: 12px;
			transition: all 0.2s ease;
		}
		.feature-card:hover {
			background: rgba(255, 255, 255, 0.1);
			transform: translateY(-2px);
		}
		.feature-icon {
			width: 40px;
			height: 40px;
			border-radius: 10px;
			display: flex;
			align-items: center;
			justify-content: center;
			font-size: 1.2rem;
			background: rgba(37, 99, 235, 0.25);
			color: #60a5fa;
			margin-bottom: 10px;
		}
		.auth-card {
			background: #ffffff;
			border-radius: 20px;
			box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.35);
			padding: 36px 32px;
			position: relative;
			overflow: hidden;
		}
		.auth-card::before {
			content: '';
			position: absolute;
			top: 0;
			left: 0;
			right: 0;
			height: 6px;
			background: linear-gradient(90deg, #1e3a8a, #3b82f6, #f59e0b);
		}
		.auth-title {
			font-weight: 800;
			color: #0f172a;
			font-size: 1.6rem;
			margin-bottom: 6px;
		}
		.auth-sub {
			color: #64748b;
			font-size: 0.95rem;
			margin-bottom: 24px;
		}
		.form-floating > .form-control {
			border: 1.5px solid #e2e8f0;
			border-radius: 10px;
			height: 56px;
			padding-left: 45px;
			font-size: 0.95rem;
			transition: all 0.2s;
		}
		.form-floating > .form-control:focus {
			border-color: #2563eb;
			box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
		}
		.form-floating > label {
			padding-left: 45px;
			color: #64748b;
		}
		.input-icon {
			position: absolute;
			top: 18px;
			left: 16px;
			color: #94a3b8;
			font-size: 1.1rem;
			z-index: 4;
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
			width: 100%;
		}
		.btn-portal-primary:hover {
			background: linear-gradient(135deg, #1e40af 0%, #1d4ed8 100%);
			transform: translateY(-1px);
			box-shadow: 0 6px 20px rgba(37, 99, 235, 0.45);
			color: #fff;
		}
		.demo-pill {
			background: #f1f5f9;
			border: 1px solid #cbd5e1;
			border-radius: 8px;
			padding: 6px 12px;
			font-size: 0.8rem;
			color: #334155;
			cursor: pointer;
			transition: all 0.15s;
			display: inline-flex;
			align-items: center;
			gap: 6px;
			font-weight: 600;
		}
		.demo-pill:hover {
			background: #e2e8f0;
			border-color: #94a3b8;
		}
		.demo-pill-admin {
			border-color: #bfdbfe;
			background: #eff6ff;
			color: #1d4ed8;
		}
		.demo-pill-admin:hover {
			background: #dbeafe;
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
					<small style="font-size: 0.72rem; color: #94a3b8; font-weight: 400; display: block; line-height: 1;">Government of Digital Public Services</small>
				</div>
			</a>
			<div>
				<a href="${contextPath}/signUp.htm" class="btn btn-outline-light btn-sm px-3 rounded-pill">
					<i class="fa fa-user-plus me-1"></i> New Citizen Registration
				</a>
			</div>
		</div>
	</nav>

	<!-- Main Body Section -->
	<div class="main-content">
		<div class="container">
			<div class="row align-items-center g-5">
				<!-- Left Column: Portal Overview -->
				<div class="col-lg-7">
					<div class="hero-badge">
						<i class="fas fa-shield-alt text-warning"></i> Official Citizen Document Issuance Portal
					</div>
					<h1 class="hero-title">
						Fast, Transparent &amp; Secure Citizen Services
					</h1>
					<p class="hero-subtitle">
						Apply, verify, and receive certified government documents online. Instant status tracking and secure verification for every citizen.
					</p>

					<div class="row g-3">
						<div class="col-md-4">
							<div class="feature-card">
								<div class="feature-icon"><i class="fas fa-baby"></i></div>
								<h6 class="fw-bold mb-1 text-white">Birth Certificate</h6>
								<small class="text-white-50">Online application &amp; certified digital issuance</small>
							</div>
						</div>
						<div class="col-md-4">
							<div class="feature-card">
								<div class="feature-icon"><i class="fas fa-file-invoice"></i></div>
								<h6 class="fw-bold mb-1 text-white">Death Certificate</h6>
								<small class="text-white-50">Authorized registration &amp; relative verification</small>
							</div>
						</div>
						<div class="col-md-4">
							<div class="feature-card">
								<div class="feature-icon"><i class="fas fa-ring"></i></div>
								<h6 class="fw-bold mb-1 text-white">Marriage Certificate</h6>
								<small class="text-white-50">Digital certificate registration &amp; validation</small>
							</div>
						</div>
					</div>
				</div>

				<!-- Right Column: Authentication Card -->
				<div class="col-lg-5">
					<div class="auth-card">
						<div class="d-flex align-items-center justify-content-between mb-2">
							<h2 class="auth-title mb-0">Sign In</h2>
							<span class="badge bg-primary-subtle text-primary border border-primary-subtle px-3 py-2 rounded-pill fw-semibold">
								<i class="fas fa-lock me-1"></i> Secured
							</span>
						</div>
						<p class="auth-sub">Enter your portal credentials to access your dashboard</p>

						<!-- Status Alerts -->
						<c:if test="${not empty loginFail or param.error ne null}">
							<div class="alert alert-danger alert-dismissible fade show d-flex align-items-center py-2 px-3 mb-3" role="alert">
								<i class="fas fa-exclamation-triangle me-2 fs-5"></i>
								<div style="font-size: 0.9rem;">
									<strong>Invalid Credentials!</strong> Please check your username and password or select a demo account below.
								</div>
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</c:if>

						<c:if test="${not empty logout or param.logout ne null}">
							<div class="alert alert-success alert-dismissible fade show d-flex align-items-center py-2 px-3 mb-3" role="alert">
								<i class="fas fa-check-circle me-2 fs-5"></i>
								<div style="font-size: 0.9rem;">
									You have been securely signed out.
								</div>
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</c:if>

						<c:if test="${not empty successPwdChangeMsg}">
							<div class="alert alert-success alert-dismissible fade show py-2 px-3 mb-3" role="alert">
								<i class="fas fa-check-circle me-2"></i> ${successPwdChangeMsg}
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</c:if>

						<c:if test="${not empty failurePwdChangeMsg}">
							<div class="alert alert-danger alert-dismissible fade show py-2 px-3 mb-3" role="alert">
								<i class="fas fa-exclamation-circle me-2"></i> ${failurePwdChangeMsg}
								<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
							</div>
						</c:if>

						<!-- Form -->
						<form action="${contextPath}/login" id="userLogin" method="post" onsubmit="return validateLogin(event)">
							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

							<div class="position-relative mb-3">
								<i class="fas fa-user input-icon"></i>
								<div class="form-floating">
									<input type="text" class="form-control" name="loginUserName" id="loginUserName" placeholder="Username" required autocomplete="username">
									<label for="loginUserName">Username or Citizen ID</label>
								</div>
							</div>

							<div class="position-relative mb-3">
								<i class="fas fa-lock input-icon"></i>
								<div class="form-floating">
									<input type="password" class="form-control" name="loginPassword" id="loginPassword" placeholder="Password" required autocomplete="current-password">
									<label for="loginPassword">Password</label>
								</div>
							</div>

							<div class="d-flex justify-content-between align-items-center mb-4" style="font-size: 0.875rem;">
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="showPwd" onclick="togglePassword()">
									<label class="form-check-label text-muted" for="showPwd">Show password</label>
								</div>
								<a href="${contextPath}/forgotPassword.htm" class="text-decoration-none text-primary fw-semibold">Forgot Password?</a>
							</div>

							<button type="submit" class="btn btn-portal-primary mb-3" id="loginBtn">
								<i class="fas fa-sign-in-alt me-2"></i> Sign In to Portal
							</button>

							<!-- 1-Click Demo Accounts -->
							<div class="mt-4 pt-3 border-top">
								<div class="d-flex align-items-center justify-content-between mb-2">
									<small class="text-muted fw-bold text-uppercase" style="font-size: 0.75rem; letter-spacing: 0.05em;">
										<i class="fas fa-key me-1 text-primary"></i> 1-Click Demo Login
									</small>
									<small class="text-muted" style="font-size: 0.72rem;">Click to auto-fill</small>
								</div>
								<div class="d-flex flex-wrap gap-2">
									<span class="demo-pill demo-pill-admin" onclick="fillCredentials('admin', 'admin')">
										<i class="fas fa-user-shield"></i> Admin: <strong>admin</strong>
									</span>
									<span class="demo-pill" onclick="fillCredentials('bittu123', 'admin')">
										<i class="fas fa-user"></i> Citizen: <strong>bittu123</strong>
									</span>
									<span class="demo-pill" onclick="fillCredentials('shu789', 'admin')">
										<i class="fas fa-id-badge"></i> Officer: <strong>shu789</strong>
									</span>
								</div>
							</div>

							<div class="text-center mt-4">
								<span class="text-muted small">New to the portal?</span>
								<a href="${contextPath}/signUp.htm" class="fw-bold text-primary text-decoration-none small ms-1">
									Create an Account <i class="fas fa-arrow-right ms-1"></i>
								</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Footer -->
	<footer class="footer-portal">
		<div class="container d-flex flex-wrap justify-content-between align-items-center gap-2">
			<div>
				&copy; 2026 Citizen Service Portal &bull; Department of Digital Governance &bull; All Rights Reserved.
			</div>
			<div>
				<span class="badge bg-success-subtle text-success border border-success-subtle px-2 py-1 rounded-pill">
					<i class="fas fa-circle text-success me-1" style="font-size: 0.5rem;"></i> System Operational 24/7
				</span>
			</div>
		</div>
	</footer>

	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
	<script>
		function fillCredentials(user, pwd) {
			document.getElementById('loginUserName').value = user;
			document.getElementById('loginPassword').value = pwd;
			var btn = document.getElementById('loginBtn');
			btn.classList.add('pulse');
			setTimeout(function() { btn.classList.remove('pulse'); }, 500);
		}

		function togglePassword() {
			var field = document.getElementById('loginPassword');
			field.type = field.type === 'password' ? 'text' : 'password';
		}

		function validateLogin(e) {
			var user = document.getElementById('loginUserName').value.trim();
			var pass = document.getElementById('loginPassword').value.trim();
			if (!user) {
				alert("Please enter your username.");
				document.getElementById('loginUserName').focus();
				e.preventDefault();
				return false;
			}
			if (!pass) {
				alert("Please enter your password.");
				document.getElementById('loginPassword').focus();
				e.preventDefault();
				return false;
			}
			return true;
		}
	</script>
</body>
</html>
