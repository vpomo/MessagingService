package com.vpomo.messagingservice.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.security.Principal;

/**
 * Created by Помогалов on 27.04.2016.
 */

@Controller
public class Home {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Principal principal, Model model) {
        if (principal != null) {
            String name_user = principal.getName();
            model.addAttribute("notif", "Вы авторизованы в системе как пользователь: " + name_user + " !");
        } else {
            model.addAttribute("notif", "Пожалуйста, зарегистрируйтесь в системе!");
        }
        return "index";
    }

}
