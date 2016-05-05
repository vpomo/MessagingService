package com.vpomo.messagingservice.web;

import com.vpomo.messagingservice.model.Users;
import com.vpomo.messagingservice.service.UsersService;
import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
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

    @RequestMapping(value = "/usermanagement", method = RequestMethod.GET)
    public String adminUserManagementGET(Locale locale, Model model) throws IllegalArgumentException {
        //model.addAttribute("notif", "Будьте внимательны при занесении данных!");
        logger.info("******usermanagment-GET*****");
        return "usermanagement";
    }

    @RequestMapping(value = "/usermanagement", method = RequestMethod.POST)
    public String adminUserManagementPOST(HttpServletRequest request, Model model) throws IllegalArgumentException {
        String login = null, password = null, fioUser = null, groupUser = null;
        String emailUser = null;
        Users user = null;
        model.addAttribute("notif", "Будьте внимательны при занесении данных!");
        Enumeration<String> parameters = request.getParameterNames();
        while (parameters.hasMoreElements()) {
            String parameter = parameters.nextElement();
            switch (parameter) {
                case "login":
                    login = request.getParameter(parameter);
                    break;
                case "password":
                    password = request.getParameter(parameter);
                    break;
                case "nameUser":
                    fioUser = request.getParameter(parameter);
                    break;
                case "email":
                    emailUser = request.getParameter(parameter);
                    break;
                case "groupUser":
                    groupUser = request.getParameter(parameter);
                    break;
            }
        }
        if ((login != null) & (password != null) & (fioUser != null) & (emailUser != null) & (groupUser != null) ) {
            user = this.usersService.getUserLogin(login);
            if (user != null) {
                this.usersService.updateUser(login, password, fioUser, emailUser, groupUser);
            } else {
                user = this.usersService.newUser(login, password, fioUser, emailUser, groupUser);
                model.addAttribute("notif", "Вы создали пользователя " + fioUser + " !");
            }
        } else {
            model.addAttribute("notif", "Вы заполнили не все поля формы ввода!");
        }
        if ((login != null) & (password == null) & (fioUser == null) & (emailUser == null) & (groupUser == null) ) {
            user = this.usersService.getUserLogin(login);
            if (user != null) {
                this.usersService.remove(login);
                model.addAttribute("notif", "Пользователь успешно удален!");
            } else {
                model.addAttribute("notif", "Вы пытались создать пользователя, не заполнив требуемые поля!");
            }
        }
        logger.info("****" + login + "****" + password + "****" + fioUser + "****" + emailUser + "****" + groupUser);
        return "usermanagement";
    }

    @RequestMapping(value = "/getalluser", method = RequestMethod.GET)
    public @ResponseBody List<Users> getAllUsers() {
        List<Users> listUsers = usersService.getAll();
        return listUsers;
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

        Integer codeOperation = this.usersService.addUser(login, pass, pass2, nams, emailUser, "user");
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


