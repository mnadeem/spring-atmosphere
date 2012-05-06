package com.nadeem.app.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.atmosphere.cpr.AtmosphereResource;
import org.atmosphere.cpr.Broadcaster.SCOPE;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @RequestMapping(value="/", method=RequestMethod.GET)
    public String home() {
        logger.info("Welcome home!");
        return "HomePage";
    }

    @RequestMapping(value="/subscribe", method=RequestMethod.GET)
    public void subscribe(final AtmosphereResource<HttpServletRequest, HttpServletResponse> event) {
        event.suspend(); 
    }
    
    @RequestMapping(value="/broadCast", method=RequestMethod.GET)
    @ResponseBody
    public void broadCast(@RequestParam(value="message", required=false) String message, final AtmosphereResource<HttpServletRequest, HttpServletResponse> event) {
    	event.getBroadcaster().setScope(SCOPE.VM);
    	event.getBroadcaster().broadcast(message);       
    }
}

