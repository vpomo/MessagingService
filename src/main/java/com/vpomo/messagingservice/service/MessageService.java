package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.Message;
import org.springframework.dao.DataAccessException;

import java.util.Date;
import java.util.List;

/**
 * Created by Vpomo on 30.04.2016.
 */

public interface MessageService {
    List<Message> getAll() throws DataAccessException;

    int addMessage(String fromUserId, String fromUserFio, String toUserId, String toUserFio,
                   String subject, String textMessage, Date currentDate) throws DataAccessException;

    void removeMessage(int id) throws DataAccessException;

}
