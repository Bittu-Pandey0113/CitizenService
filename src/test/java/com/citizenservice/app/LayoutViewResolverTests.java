package com.citizenservice.app;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.util.Locale;

import org.junit.jupiter.api.Test;

/** Plain unit test - needs no database and no Spring context. */
class LayoutViewResolverTests {

	private final LayoutViewResolver resolver = new LayoutViewResolver();

	@Test
	void knownPageNamesAreResolved() {
		assertNotNull(resolver.resolveViewName("site.index", Locale.ENGLISH));
		assertNotNull(resolver.resolveViewName("site.dashBoard", Locale.ENGLISH));
		assertNotNull(resolver.resolveViewName("site.forgotPassword", Locale.ENGLISH));
	}

	@Test
	void otherNamesAreLeftToTheNextResolver() {
		assertNull(resolver.resolveViewName("redirect:/dashBoard.htm", Locale.ENGLISH));
		assertNull(resolver.resolveViewName("errors/404", Locale.ENGLISH));
	}

}
