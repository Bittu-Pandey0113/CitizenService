<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header class="page-header">
	<h2>Portal Dashboard</h2>
	<div class="right-wrapper pull-right">
		<ol class="breadcrumbs">
			<li><a href="${contextPath}/dashBoard.htm"><i class="fa fa-home"></i></a></li>
			<li><span>Dashboard</span></li>
		</ol>
	</div>
</header>

<c:if test="${not empty changePasswordSuccessMessage}">
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-check-circle"></i> ${changePasswordSuccessMessage}
	</div>
</c:if>
<c:if test="${not empty changePasswordFailureMessage}">
	<div class="alert alert-danger alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-exclamation-circle"></i> ${changePasswordFailureMessage}
	</div>
</c:if>

<c:if test="${not empty editProfileSuccessMessage}">
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-check-circle"></i> ${editProfileSuccessMessage}
	</div>
</c:if>
<c:if test="${not empty editProfileFailureMessage}">
	<div class="alert alert-danger alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		<i class="fa fa-exclamation-circle"></i> ${editProfileFailureMessage}
	</div>
</c:if>

<!-- Hero Welcome Section -->
<div class="row">
	<div class="col-md-12">
		<div class="panel" style="background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%); color: #ffffff; border-radius: 12px; padding: 24px 30px; box-shadow: 0 10px 25px -5px rgba(30, 58, 138, 0.3); margin-bottom: 25px;">
			<div class="row">
				<div class="col-sm-8">
					<span class="badge" style="background: rgba(255,255,255,0.2); color: #fff; font-size: 11px; padding: 5px 12px; border-radius: 50px; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 10px; display: inline-block;">
						<i class="fa fa-shield"></i> Verified Citizen Portal Session
					</span>
					<h2 style="color: #ffffff; font-weight: 800; margin: 4px 0 10px 0; font-size: 26px;">
						Welcome back, ${not empty userName ? userName : 'Citizen'}!
					</h2>
					<p style="color: #bfdbfe; font-size: 14px; margin-bottom: 0; line-height: 1.5;">
						Role: <strong style="color: #fff;">${not empty roleName ? roleName : 'User'}</strong> &bull; Access official certificate issuance, track real-time verification status, and manage civil registration documents securely.
					</p>
				</div>
				<div class="col-sm-4 text-right hidden-xs" style="margin-top: 10px;">
					<a href="${contextPath}/checkApplicationStatus.htm" class="btn btn-warning btn-lg" style="font-weight: 700; border-radius: 8px; box-shadow: 0 4px 10px rgba(0,0,0,0.15);">
						<i class="fa fa-search"></i> Check My Applications
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Metric Overview Cards -->
<div class="row">
	<div class="col-md-4 col-sm-6">
		<section class="panel panel-featured panel-featured-primary" style="border-radius: 10px; border-top-width: 4px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);">
			<div class="panel-body" style="padding: 18px 20px;">
				<div class="widget-summary">
					<div class="widget-summary-col widget-summary-col-icon">
						<div class="summary-icon bg-primary" style="border-radius: 10px; width: 56px; height: 56px; line-height: 56px; text-align: center; font-size: 22px;">
							<i class="fa fa-child"></i>
						</div>
					</div>
					<div class="widget-summary-col">
						<div class="summary">
							<h4 class="title" style="font-size: 14px; font-weight: 700; color: #475569; margin: 0 0 4px 0;">Birth Certificates</h4>
							<div class="info">
								<strong class="amount" style="font-size: 20px; color: #1e293b;">Online Issuance</strong>
							</div>
						</div>
						<div class="summary-footer">
							<a href="${contextPath}/applyBirthCertificate.htm" class="text-uppercase" style="font-weight: 600; font-size: 11px;">Apply Online &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="col-md-4 col-sm-6">
		<section class="panel panel-featured panel-featured-warning" style="border-radius: 10px; border-top-width: 4px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);">
			<div class="panel-body" style="padding: 18px 20px;">
				<div class="widget-summary">
					<div class="widget-summary-col widget-summary-col-icon">
						<div class="summary-icon bg-warning" style="border-radius: 10px; width: 56px; height: 56px; line-height: 56px; text-align: center; font-size: 22px;">
							<i class="fa fa-file-text-o"></i>
						</div>
					</div>
					<div class="widget-summary-col">
						<div class="summary">
							<h4 class="title" style="font-size: 14px; font-weight: 700; color: #475569; margin: 0 0 4px 0;">Death Certificates</h4>
							<div class="info">
								<strong class="amount" style="font-size: 20px; color: #1e293b;">Civil Registry</strong>
							</div>
						</div>
						<div class="summary-footer">
							<a href="${contextPath}/applyDeathCertificate.htm" class="text-uppercase" style="font-weight: 600; font-size: 11px;">Apply Online &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
	<div class="col-md-4 col-sm-12">
		<section class="panel panel-featured panel-featured-success" style="border-radius: 10px; border-top-width: 4px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);">
			<div class="panel-body" style="padding: 18px 20px;">
				<div class="widget-summary">
					<div class="widget-summary-col widget-summary-col-icon">
						<div class="summary-icon bg-success" style="border-radius: 10px; width: 56px; height: 56px; line-height: 56px; text-align: center; font-size: 22px;">
							<i class="fa fa-heart"></i>
						</div>
					</div>
					<div class="widget-summary-col">
						<div class="summary">
							<h4 class="title" style="font-size: 14px; font-weight: 700; color: #475569; margin: 0 0 4px 0;">Marriage Certificates</h4>
							<div class="info">
								<strong class="amount" style="font-size: 20px; color: #1e293b;">Legal Verification</strong>
							</div>
						</div>
						<div class="summary-footer">
							<a href="${contextPath}/applyMarriageCertificate.htm" class="text-uppercase" style="font-weight: 600; font-size: 11px;">Apply Online &rarr;</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>
</div>

<!-- Primary Service Cards Grid -->
<div class="row">
	<div class="col-md-8">
		<section class="panel" style="border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);">
			<header class="panel-heading" style="background:#fff; border-bottom: 1px solid #f1f5f9; padding: 16px 20px;">
				<h2 class="panel-title" style="font-size: 16px; font-weight: 700; color: #1e293b;">
					<i class="fa fa-th-large text-primary"></i> Citizen Certificate Services
				</h2>
			</header>
			<div class="panel-body" style="padding: 20px;">
				<div class="row">
					<div class="col-sm-4" style="margin-bottom: 15px;">
						<div style="border: 1px solid #e2e8f0; border-radius: 10px; padding: 18px; text-align: center; height: 100%; transition: all 0.2s;">
							<div style="width: 48px; height: 48px; background: #eff6ff; color: #2563eb; border-radius: 10px; display: inline-flex; align-items: center; justify-content: center; font-size: 22px; margin-bottom: 12px;">
								<i class="fa fa-birthday-cake"></i>
							</div>
							<h4 style="font-weight: 700; font-size: 15px; margin-bottom: 8px;">Birth Certificate</h4>
							<p style="font-size: 12px; color: #64748b; min-height: 40px;">Register a newborn or apply for official birth registration copy.</p>
							<a href="${contextPath}/applyBirthCertificate.htm" class="btn btn-primary btn-sm btn-block" style="border-radius: 6px; font-weight: 600;">
								Apply Now
							</a>
						</div>
					</div>
					<div class="col-sm-4" style="margin-bottom: 15px;">
						<div style="border: 1px solid #e2e8f0; border-radius: 10px; padding: 18px; text-align: center; height: 100%; transition: all 0.2s;">
							<div style="width: 48px; height: 48px; background: #fffbeb; color: #d97706; border-radius: 10px; display: inline-flex; align-items: center; justify-content: center; font-size: 22px; margin-bottom: 12px;">
								<i class="fa fa-file-text"></i>
							</div>
							<h4 style="font-weight: 700; font-size: 15px; margin-bottom: 8px;">Death Certificate</h4>
							<p style="font-size: 12px; color: #64748b; min-height: 40px;">Record deceased details with authorized medical/police proofs.</p>
							<a href="${contextPath}/applyDeathCertificate.htm" class="btn btn-warning btn-sm btn-block" style="border-radius: 6px; font-weight: 600;">
								Apply Now
							</a>
						</div>
					</div>
					<div class="col-sm-4" style="margin-bottom: 15px;">
						<div style="border: 1px solid #e2e8f0; border-radius: 10px; padding: 18px; text-align: center; height: 100%; transition: all 0.2s;">
							<div style="width: 48px; height: 48px; background: #f0fdf4; color: #16a34a; border-radius: 10px; display: inline-flex; align-items: center; justify-content: center; font-size: 22px; margin-bottom: 12px;">
								<i class="fa fa-users"></i>
							</div>
							<h4 style="font-weight: 700; font-size: 15px; margin-bottom: 8px;">Marriage Certificate</h4>
							<p style="font-size: 12px; color: #64748b; min-height: 40px;">Apply with bride, groom, and witness documentation.</p>
							<a href="${contextPath}/applyMarriageCertificate.htm" class="btn btn-success btn-sm btn-block" style="border-radius: 6px; font-weight: 600;">
								Apply Now
							</a>
						</div>
					</div>
				</div>

				<div class="row" style="margin-top: 10px;">
					<div class="col-sm-12">
						<div style="background: #f8fafc; border: 1px dashed #cbd5e1; border-radius: 8px; padding: 12px 18px; display: flex; align-items: center; justify-content: space-between;">
							<div>
								<strong style="color: #1e293b;"><i class="fa fa-info-circle text-primary"></i> Application Status Tracking:</strong>
								<span style="color: #64748b; font-size: 13px; margin-left: 6px;">Check the live progress of your submitted certificates at any time.</span>
							</div>
							<a href="${contextPath}/checkApplicationStatus.htm" class="btn btn-default btn-sm" style="font-weight: 600;">
								View Status &rarr;
							</a>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Right Column: Quick Operations & Guidelines -->
	<div class="col-md-4">
		<!-- Role Specific Actions -->
		<c:if test="${roleName eq 'Admin'}">
			<section class="panel panel-primary" style="border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); margin-bottom: 20px;">
				<header class="panel-heading" style="border-radius: 9px 9px 0 0; padding: 14px 18px;">
					<h2 class="panel-title" style="font-size: 15px; font-weight: 700;"><i class="fa fa-cog"></i> Administrator Controls</h2>
				</header>
				<div class="panel-body" style="padding: 15px;">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="${contextPath}/createUser.htm"><i class="fa fa-user-plus text-primary"></i> Create System User</a></li>
						<li><a href="${contextPath}/manageUser.htm"><i class="fa fa-users text-primary"></i> Manage Portal Users</a></li>
						<li><a href="${contextPath}/createRole.htm"><i class="fa fa-lock text-primary"></i> Create Portal Role</a></li>
						<li><a href="${contextPath}/manageRole.htm"><i class="fa fa-shield text-primary"></i> Manage Role Permissions</a></li>
					</ul>
				</div>
			</section>
		</c:if>

		<c:if test="${roleName eq 'Authority'}">
			<section class="panel panel-warning" style="border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); margin-bottom: 20px;">
				<header class="panel-heading" style="border-radius: 9px 9px 0 0; padding: 14px 18px;">
					<h2 class="panel-title" style="font-size: 15px; font-weight: 700; color: #fff;"><i class="fa fa-check-square-o"></i> Verification Queue</h2>
				</header>
				<div class="panel-body" style="padding: 15px;">
					<ul class="nav nav-pills nav-stacked">
						<li><a href="${contextPath}/approveBirthCertificate.htm"><i class="fa fa-child text-warning"></i> Review Birth Certificates</a></li>
						<li><a href="${contextPath}/approveDeathCertificate.htm"><i class="fa fa-file-text-o text-warning"></i> Review Death Certificates</a></li>
						<li><a href="${contextPath}/approveMarriageCertificate.htm"><i class="fa fa-heart text-warning"></i> Review Marriage Certificates</a></li>
					</ul>
				</div>
			</section>
		</c:if>

		<!-- Noticeboard Card -->
		<section class="panel" style="border-radius: 10px; box-shadow: 0 2px 8px rgba(0,0,0,0.06);">
			<header class="panel-heading" style="background:#fff; border-bottom: 1px solid #f1f5f9; padding: 14px 18px;">
				<h2 class="panel-title" style="font-size: 15px; font-weight: 700; color: #1e293b;">
					<i class="fa fa-bell text-warning"></i> Portal Instructions
				</h2>
			</header>
			<div class="panel-body" style="padding: 16px; font-size: 13px; color: #475569; line-height: 1.6;">
				<div style="margin-bottom: 12px; display: flex; gap: 10px;">
					<i class="fa fa-check text-success" style="margin-top: 3px;"></i>
					<div>Keep valid government ID proof files (PDF, JPG, PNG) ready before applying.</div>
				</div>
				<div style="margin-bottom: 12px; display: flex; gap: 10px;">
					<i class="fa fa-check text-success" style="margin-top: 3px;"></i>
					<div>Applications are reviewed and certified by the district registrar authority.</div>
				</div>
				<div style="display: flex; gap: 10px;">
					<i class="fa fa-check text-success" style="margin-top: 3px;"></i>
					<div>Certified certificates can be printed directly from the portal once approved.</div>
				</div>
			</div>
		</section>
	</div>
</div>
