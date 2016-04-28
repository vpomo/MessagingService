package com.vpomo.messagingservice.web;

import com.vpomo.messagingservice.service.UsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.Locale;

@Controller
public class AdminUsers {
    private UsersService usersService;
    private Logger logger = LoggerFactory.getLogger(CommonPhorm.class);

    @Autowired
    public AdminUsers(UsersService usersService) {
        this.usersService = usersService;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String home(Locale locale, Model model) throws IllegalArgumentException {
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String addUserDB(HttpServletRequest request, Model model) {
        String login = null, pass = null, pass2 = null, nams = null, grUser = null;
        String emailUser = null;
        Enumeration<String> parameters = request.getParameterNames();
        while (parameters.hasMoreElements()) {
            String parameter = parameters.nextElement();
            switch (parameter) {
                case "loginUser":
                    login = request.getParameter(parameter);
                    break;
                case "password":
                    pass = request.getParameter(parameter);
                    break;
                case "password2":
                    pass2 = request.getParameter(parameter);
                    break;
                case "nameUser":
                    nams = request.getParameter(parameter);
                    break;
                case "emailUser":
                    emailUser = request.getParameter(parameter);
                    break;
                case "groupUser":
                    grUser = request.getParameter(parameter);
                    break;
            }
        }

        logger.info("!!!!!!!! email=" + emailUser + " login=" + login);

        Integer codeOperation = this.usersService.addUser(login, pass, pass2, nams, emailUser, "user");
        logger.info("!!!!!!!! codeOperation=" + codeOperation);

        switch (codeOperation) {
            case 0:
                model.addAttribute("notif", "Пользователь " + login + " успешно создан!");
                break;
            case 1:
                model.addAttribute("notif", "Ошибка в базе данных!");
                break;
            case 2:
                model.addAttribute("notif", "Введенные пароли не совпадают");
                break;
            case 3:
                model.addAttribute("notif", "Повторите ввод еще раз! Пользователь " + login + " уже существует!");
                break;
        }
        return "/registration";
    }
}


