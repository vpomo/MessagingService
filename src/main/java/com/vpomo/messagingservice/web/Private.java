package com.vpomo.messagingservice.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

/**
 * Handles requests for the application home page.
 */
@Controller
public class Private {
    /**
     * Simply selects the home view to render by returning its name.
     *
     * @param locale
     * @param model
     * @return
     */
    @RequestMapping(value = "/login_user", method = RequestMethod.GET)
    public String loginUser(Locale locale, Model model) {
        return "/login_user";
    }

    @RequestMapping(value = "/logout_user", method = RequestMethod.GET)
    public String logoutUser(Locale locale, Model model) {
        return "/logout_user";
    }

    @RequestMapping(value = "/error_login", method = RequestMethod.GET)
    public String errorLoginUser(Locale locale, Model model) {
        return "/error_login";
    }

}


