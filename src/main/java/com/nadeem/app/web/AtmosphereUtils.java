package com.nadeem.app.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.atmosphere.cpr.ApplicationConfig;
import org.atmosphere.cpr.AtmosphereResource;
import org.springframework.util.Assert;

public final class AtmosphereUtils {

	public static AtmosphereResource<HttpServletRequest, HttpServletResponse> getAtmosphereResource(HttpServletRequest request) {
		@SuppressWarnings("unchecked")
		AtmosphereResource<HttpServletRequest, HttpServletResponse> resource = (AtmosphereResource<HttpServletRequest, HttpServletResponse>) request.getAttribute(ApplicationConfig.ATMOSPHERE_RESOURCE);
		Assert.notNull(resource, "AtmosphereResource could not be located for the request. Check that AtmosphereServlet is configured correctly in web.xml");
		return resource;
	}
}
