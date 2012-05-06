package com.nadeem.app.web;

import javax.servlet.http.HttpServletRequest;

import org.atmosphere.cpr.AtmosphereResource;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebArgumentResolver;
import org.springframework.web.context.request.NativeWebRequest;

public class AtmosphereResourceArgumentResolver implements WebArgumentResolver {

    public AtmosphereResourceArgumentResolver() {

    }

    /* (non-Javadoc)
     * @see org.springframework.web.bind.support.WebArgumentResolver#resolveArgument(org.springframework.core.MethodParameter, org.springframework.web.context.request.NativeWebRequest)
     */
    @Override
    public Object resolveArgument(MethodParameter methodParameter, NativeWebRequest webRequest) throws Exception {

        if (AtmosphereResource.class.isAssignableFrom(methodParameter.getParameterType())) {
            return AtmosphereUtils.getAtmosphereResource(webRequest.getNativeRequest(HttpServletRequest.class));
        } else {
            return WebArgumentResolver.UNRESOLVED;
        }

    }
}
