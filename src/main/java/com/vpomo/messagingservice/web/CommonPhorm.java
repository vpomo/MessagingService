package com.vpomo.messagingservice.web;

import com.vpomo.messagingservice.model.Users;
import com.vpomo.messagingservice.service.UsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.Enumeration;
import java.util.List;

/**
 * Handles requests for the application home page.
 */
@Controller
public class CommonPhorm {

    /**
     * Simply selects the home view to render by returning its name.
     *
     * @param request
     * @param model
     * @return
     */
    private static final Logger logger = LoggerFactory.getLogger(CommonPhorm.class);
    private String login = null;

    private UsersService usersService;

    @Autowired
    public CommonPhorm(UsersService usersService) {
        this.usersService = usersService;
    }


    @RequestMapping(value = "/common_phorm", method = RequestMethod.GET)
    public String firstEnter(HttpServletRequest request, Principal principal, Model model) {

        List<Users> userRep = null;

        Enumeration<String> params = request.getParameterNames();
        while (params.hasMoreElements()) {
            String parameter = params.nextElement();
            login = "login".equals(parameter) ? request.getParameter(parameter) : login;
        }
        model.addAttribute("login", login);
        request.getSession().getServletContext().setAttribute("login", login);
        logger.info("common_phorm GET !!!");

        return "/common_phorm";
    }

    @RequestMapping(value = "/common_phorm", method = RequestMethod.POST)
    public String makeReports(HttpServletRequest request, Principal principal, Model model) {
        String name_user = null;
        if (principal != null) {
            name_user = principal.getName();
        }
        logger.info("common_phorm POST !!!");
        if (name_user == null ? login == null : name_user.equals(login)) {
            return ("/login_user");
        }
        return "/common_phorm";
    }
}


