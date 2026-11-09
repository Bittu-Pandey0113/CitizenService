<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>  
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<header class="page-header">
	<h2>Application Status Tracker</h2> 
	<div class="right-wrapper pull-right">
		<ol class="breadcrumbs">
			<li><a href="${contextPath}/dashBoard.htm"><i class="fa fa-home"></i></a></li> 
			<li><span>Dashboard</span></li>
			<li><span>Application Status</span></li>
		</ol>
	</div>
</header>

<!-- Header Overview Banner -->
<div class="row">
	<div class="col-md-12">
		<div class="panel" style="background:#fff; border-radius: 12px; border-left: 5px solid #2563eb; padding: 20px 24px; box-shadow: 0 2px 8px rgba(0,0,0,0.06); margin-bottom: 25px;">
			<div class="row">
				<div class="col-sm-9">
					<h3 style="font-weight: 800; color: #1e293b; margin: 0 0 6px 0; font-size: 20px;">
						<i class="fa fa-tachometer text-primary"></i> Real-Time Certificate Status Overview
					</h3>
					<p style="color: #64748b; font-size: 13.5px; margin: 0;">
						Below is the current lifecycle status for all civil registration certificates associated with your citizen account.
					</p>
				</div>
				<div class="col-sm-3 text-right hidden-xs">
					<a href="${contextPath}/dashBoard.htm" class="btn btn-default" style="margin-top: 5px;">
						<i class="fa fa-arrow-left"></i> Back to Dashboard
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 3 Status Cards Grid -->
<div class="row">
	<!-- 1. Birth Certificate Status -->
	<div class="col-md-4">
		<section class="panel" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border: 1px solid #e2e8f0; height: 100%;">
			<header class="panel-heading" style="background: #f8fafc; border-bottom: 1px solid #f1f5f9; padding: 18px 20px; border-radius: 12px 12px 0 0;">
				<div class="d-flex align-items-center justify-content-between">
					<h3 class="panel-title" style="font-size: 16px; font-weight: 700; color: #1e293b;">
						<i class="fa fa-child text-primary" style="margin-right: 6px;"></i> Birth Certificate
					</h3>
				</div>
			</header>
			<div class="panel-body text-center" style="padding: 30px 20px;">
				<c:choose>
					<c:when test="${birthStatus eq 'APPROVED'}">
						<div style="width: 70px; height: 70px; background: #dcfce7; color: #16a34a; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-check"></i>
						</div>
						<h4 style="font-weight: 800; color: #16a34a; margin-bottom: 6px;">APPROVED</h4>
						<p style="color: #64748b; font-size: 13px; margin-bottom: 20px;">
							Your birth certificate application has been verified and certified by the registrar authority.
						</p>
						<a href="${contextPath}/printBCertificate.htm" class="btn btn-success btn-block" style="border-radius: 8px; font-weight: 700; padding: 10px;">
							<i class="fa fa-print"></i> View &amp; Print Certificate
						</a>
					</c:when>
					<c:when test="${birthStatus eq 'APPLIED'}">
						<div style="width: 70px; height: 70px; background: #fef3c7; color: #d97706; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-clock-o"></i>
						</div>
						<h4 style="font-weight: 800; color: #d97706; margin-bottom: 6px;">UNDER REVIEW</h4>
						<p style="color: #64748b; font-size: 13px; margin-bottom: 20px;">
							Your application has been received and is currently undergoing verification.
						</p>
						<button class="btn btn-warning btn-block" disabled style="border-radius: 8px; font-weight: 600; padding: 10px; opacity: 0.85;">
							<i class="fa fa-spinner fa-spin"></i> Processing Verification
						</button>
					</c:when>
					<c:otherwise>
						<div style="width: 70px; height: 70px; background: #f1f5f9; color: #94a3b8; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-file-o"></i>
						</div>
						<h4 style="font-weight: 700; color: #64748b; margin-bottom: 6px;">NOT APPLIED</h4>
						<p style="color: #94a3b8; font-size: 13px; margin-bottom: 20px;">
							You have not submitted any birth certificate registration application yet.
						</p>
						<a href="${contextPath}/applyBirthCertificate.htm" class="btn btn-primary btn-block" style="border-radius: 8px; font-weight: 700; padding: 10px;">
							<i class="fa fa-plus-circle"></i> Apply for Birth Certificate
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</div>

	<!-- 2. Death Certificate Status -->
	<div class="col-md-4">
		<section class="panel" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border: 1px solid #e2e8f0; height: 100%;">
			<header class="panel-heading" style="background: #f8fafc; border-bottom: 1px solid #f1f5f9; padding: 18px 20px; border-radius: 12px 12px 0 0;">
				<h3 class="panel-title" style="font-size: 16px; font-weight: 700; color: #1e293b;">
					<i class="fa fa-file-text-o text-warning" style="margin-right: 6px;"></i> Death Certificate
				</h3>
			</header>
			<div class="panel-body text-center" style="padding: 30px 20px;">
				<c:choose>
					<c:when test="${deathStatus eq 'APPROVED'}">
						<div style="width: 70px; height: 70px; background: #dcfce7; color: #16a34a; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-check"></i>
						</div>
						<h4 style="font-weight: 800; color: #16a34a; margin-bottom: 6px;">APPROVED</h4>
						<p style="color: #64748b; font-size: 13px; margin-bottom: 20px;">
							The death certificate application has been approved by the municipal health authority.
						</p>
						<a href="${contextPath}/printDCertificate.htm" class="btn btn-success btn-block" style="border-radius: 8px; font-weight: 700; padding: 10px;">
							<i class="fa fa-print"></i> View &amp; Print Certificate
						</a>
					</c:when>
					<c:when test="${deathStatus eq 'APPLIED'}">
						<div style="width: 70px; height: 70px; background: #fef3c7; color: #d97706; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-clock-o"></i>
						</div>
						<h4 style="font-weight: 800; color: #d97706; margin-bottom: 6px;">UNDER REVIEW</h4>
						<p style="color: #64748b; font-size: 13px; margin-bottom: 20px;">
							Your death certificate request is awaiting authorized medical record confirmation.
						</p>
						<button class="btn btn-warning btn-block" disabled style="border-radius: 8px; font-weight: 600; padding: 10px; opacity: 0.85;">
							<i class="fa fa-spinner fa-spin"></i> Processing Verification
						</button>
					</c:when>
					<c:otherwise>
						<div style="width: 70px; height: 70px; background: #f1f5f9; color: #94a3b8; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-file-o"></i>
						</div>
						<h4 style="font-weight: 700; color: #64748b; margin-bottom: 6px;">NOT APPLIED</h4>
						<p style="color: #94a3b8; font-size: 13px; margin-bottom: 20px;">
							You have not submitted any death certificate registration application yet.
						</p>
						<a href="${contextPath}/applyDeathCertificate.htm" class="btn btn-warning btn-block" style="border-radius: 8px; font-weight: 700; padding: 10px;">
							<i class="fa fa-plus-circle"></i> Apply for Death Certificate
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</div>

	<!-- 3. Marriage Certificate Status -->
	<div class="col-md-4">
		<section class="panel" style="border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); border: 1px solid #e2e8f0; height: 100%;">
			<header class="panel-heading" style="background: #f8fafc; border-bottom: 1px solid #f1f5f9; padding: 18px 20px; border-radius: 12px 12px 0 0;">
				<h3 class="panel-title" style="font-size: 16px; font-weight: 700; color: #1e293b;">
					<i class="fa fa-heart text-danger" style="margin-right: 6px;"></i> Marriage Certificate
				</h3>
			</header>
			<div class="panel-body text-center" style="padding: 30px 20px;">
				<c:choose>
					<c:when test="${marriageStatus eq 'APPROVED'}">
						<div style="width: 70px; height: 70px; background: #dcfce7; color: #16a34a; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-check"></i>
						</div>
						<h4 style="font-weight: 800; color: #16a34a; margin-bottom: 6px;">APPROVED</h4>
						<p style="color: #64748b; font-size: 13px; margin-bottom: 20px;">
							The marriage registration application has been verified and registered legally.
						</p>
						<a href="${contextPath}/printMCertificate.htm" class="btn btn-success btn-block" style="border-radius: 8px; font-weight: 700; padding: 10px;">
							<i class="fa fa-print"></i> View &amp; Print Certificate
						</a>
					</c:when>
					<c:when test="${marriageStatus eq 'APPLIED'}">
						<div style="width: 70px; height: 70px; background: #fef3c7; color: #d97706; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-clock-o"></i>
						</div>
						<h4 style="font-weight: 800; color: #d97706; margin-bottom: 6px;">UNDER REVIEW</h4>
						<p style="color: #64748b; font-size: 13px; margin-bottom: 20px;">
							Witness documents and partner identification are currently under review by registrar.
						</p>
						<button class="btn btn-warning btn-block" disabled style="border-radius: 8px; font-weight: 600; padding: 10px; opacity: 0.85;">
							<i class="fa fa-spinner fa-spin"></i> Processing Verification
						</button>
					</c:when>
					<c:otherwise>
						<div style="width: 70px; height: 70px; background: #f1f5f9; color: #94a3b8; border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 32px; margin-bottom: 16px;">
							<i class="fa fa-file-o"></i>
						</div>
						<h4 style="font-weight: 700; color: #64748b; margin-bottom: 6px;">NOT APPLIED</h4>
						<p style="color: #94a3b8; font-size: 13px; margin-bottom: 20px;">
							You have not submitted any marriage certificate registration application yet.
						</p>
						<a href="${contextPath}/applyMarriageCertificate.htm" class="btn btn-success btn-block" style="border-radius: 8px; font-weight: 700; padding: 10px;">
							<i class="fa fa-plus-circle"></i> Apply for Marriage Certificate
						</a>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
	</div>
</div>
