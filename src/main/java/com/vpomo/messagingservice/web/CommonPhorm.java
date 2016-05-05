package com.vpomo.messagingservice.web;

import com.vpomo.messagingservice.model.Message;
import com.vpomo.messagingservice.model.Users;
import com.vpomo.messagingservice.service.MessageService;
import com.vpomo.messagingservice.service.UsersService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.ArrayList;
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

    private MessageService messageService;
    private UsersService usersService;

    @Autowired
    public CommonPhorm(MessageService messageService, UsersService usersService) {
        this.messageService = messageService;
        this.usersService = usersService;
    }

    @RequestMapping(value = "/common", method = RequestMethod.GET)
    public String firstEnter(HttpServletRequest request, Principal principal, Model model) {
        String nameUser = null;
        if (principal != null) {
            nameUser = principal.getName();
        }
        logger.info("common_phorm GET for user: " + nameUser + " !!!!");
        return "/common";
    }

    @RequestMapping(value = "/common", method = RequestMethod.POST)
    public String makeMessages(HttpServletRequest request, Principal principal, Model model) {
        String idMessage = null;
        String nameFromUser = null; String nameToUser = null;
        String dateMessage = null; String subjectMesage = null;
        String nameUser = null;
        if (principal != null) {
            nameUser = principal.getName();
        }
        logger.info("common_phorm POST for user: " + nameUser + " !!!!");

        Enumeration<String> parameters = request.getParameterNames();
        while (parameters.hasMoreElements()) {
            String parameter = parameters.nextElement();
            switch (parameter) {
                case "idMessage":
                    idMessage = request.getParameter(parameter);
                    break;
                case "nameFromUser":
                    nameFromUser = request.getParameter(parameter);
                    break;
                case "nameToUser":
                    nameToUser = request.getParameter(parameter);
                    break;
                case "dateMessage":
                    dateMessage = request.getParameter(parameter);
                    break;
                case "subjectMesage":
                    subjectMesage = request.getParameter(parameter);
                    break;
            }
        }
        logger.info("idMessage=" + idMessage + "; nameFromUser=" + nameFromUser + "; nameToUser=" + nameToUser + "; subjectMesage=" + subjectMesage);

        if ((idMessage != null) & (nameFromUser == null) & (nameToUser == null) & (dateMessage == null) & (subjectMesage == null) ) {
                this.messageService.removeMessage(Integer.parseInt(idMessage));
                model.addAttribute("notif", "Сообщение успешно удалено!");
        }

        return "/common";
    }

    @RequestMapping(value = "/getallmessages", method = RequestMethod.GET)
    public @ResponseBody
    List<Message> getAllUsers() {
        return messageService.getAll();
    }

}


