package com.citizenservice.app;

import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.core.Ordered;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.InternalResourceView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Replacement for Apache Tiles (Tiles is not available for Jakarta EE / Spring
 * Framework 6+). It keeps the old logical view names ("site.dashBoard", ...) that
 * the controllers return, and renders a page by forwarding to a layout JSP which
 * pulls in header / left menu / body / footer with {@code <jsp:include>}.
 *
 * Layout JSPs read these request attributes: layoutHeader, layoutLeftMenu,
 * layoutBody, layoutFooter (an empty value means "nothing to include").
 */
public class LayoutViewResolver implements ViewResolver, Ordered {

	private static final String VIEWS = "/WEB-INF/views/";
	private static final String LAYOUTS = VIEWS + "layout/";

	private static final String DEFAULT = "default";
	private static final String DASHBOARD = "dashboard";
	private static final String BLANK = "blank";

	/** layout name -> {layout jsp, header, leftMenu, footer} */
	private final Map<String, String[]> layouts = new LinkedHashMap<>();

	/** view name -> {layout name, body jsp} */
	private final Map<String, String[]> pages = new LinkedHashMap<>();

	public LayoutViewResolver() {
		layouts.put(DEFAULT, new String[] { LAYOUTS + "defaultLayout.jsp", "", "", "" });
		layouts.put(DASHBOARD, new String[] { LAYOUTS + "dashboardLayout.jsp", LAYOUTS + "dashboardHeader.jsp",
				LAYOUTS + "dashboardLeftMenu.jsp", LAYOUTS + "dashboardFooter.jsp" });
		layouts.put(BLANK, new String[] { LAYOUTS + "blankLayout.jsp", LAYOUTS + "blankHeader.jsp", "",
				LAYOUTS + "blankFooter.jsp" });

		page("site.index", DEFAULT, "index");
		page("site.showSignUpForm", DEFAULT, "user/signUp");

		page("site.dashBoard", DASHBOARD, "dashBoard");
		page("site.createRole", DASHBOARD, "admin/createRole");
		page("site.manageRole", DASHBOARD, "admin/manageRole");
		page("site.createUser", DASHBOARD, "admin/createUser");
		page("site.manageUser", DASHBOARD, "admin/manageUser");
		page("site.changePassword", DASHBOARD, "user/changePassword");
		page("site.editProfile", DASHBOARD, "user/editProfile");
		page("site.showbirthapplicationform", DASHBOARD, "user/birthCertificateForm");
		page("site.showdeathapplicationform", DASHBOARD, "user/deathCertificateForm");
		page("site.showmarriageapplicationform", DASHBOARD, "user/marriageCertificateForm");
		page("site.showapplicationStatusForm", DASHBOARD, "user/applicationStatusForm");
		page("site.approveBrithCertificate", DASHBOARD, "authority/approveBirthCertificateForm");
		page("site.approveDeathCertificate", DASHBOARD, "authority/approveDeathCertificateForm");
		page("site.approveMarriageCertificate", DASHBOARD, "authority/approveMarriageCertificateForm");
		page("site.testUpload", DASHBOARD, "user/testUpload");
		page("site.printBCertifate", DASHBOARD, "user/birthCertificate");
		page("site.printDCertifate", DASHBOARD, "user/deathCertificate");
		page("site.printMCertifate", DASHBOARD, "user/marriageCertificate");
		page("site.feedBack", DASHBOARD, "user/feedBack");
		page("site.needHelp", DASHBOARD, "user/needHelp");

		page("site.forgotPassword", BLANK, "user/forgotPassword");
		page("site.submitOtp", BLANK, "user/submitOtp");
		page("site.changePasswordForForgotCase", BLANK, "user/changePasswordForForgotCase");
	}

	private void page(String viewName, String layout, String bodyJsp) {
		pages.put(viewName, new String[] { layout, VIEWS + bodyJsp + ".jsp" });
	}

	@Override
	public View resolveViewName(String viewName, Locale locale) {
		String[] page = pages.get(viewName);
		if (page == null) {
			return null; // not one of ours - let the next resolver (plain JSP / redirect:) handle it
		}
		String[] layout = layouts.get(page[0]);
		Map<String, String> attributes = new LinkedHashMap<>();
		attributes.put("layoutHeader", layout[1]);
		attributes.put("layoutLeftMenu", layout[2]);
		attributes.put("layoutBody", page[1]);
		attributes.put("layoutFooter", layout[3]);
		return new LayoutView(layout[0], attributes);
	}

	@Override
	public int getOrder() {
		return Ordered.HIGHEST_PRECEDENCE + 10;
	}

	private static class LayoutView extends InternalResourceView {

		private final Map<String, String> attributes;

		LayoutView(String layoutUrl, Map<String, String> attributes) {
			super(layoutUrl);
			this.attributes = attributes;
		}

		@Override
		protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			attributes.forEach(request::setAttribute);
			super.renderMergedOutputModel(model, request, response);
		}
	}

}
