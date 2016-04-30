package com.vpomo.messagingservice.repository;

import com.vpomo.messagingservice.model.Message;
import com.vpomo.messagingservice.model.Users;
import org.springframework.dao.DataAccessException;

import java.util.Date;
import java.util.List;

/**
 * Created by Vpomo on 29.04.2016.
 */
public interface MessageRepository {
    List<Message> getAll() throws DataAccessException;

    int addMessage(Users fromUserId, String fromUserFio, Users toUserId, String toUserFio,
                   String subject, String textMessage, Date currentDate) throws DataAccessException;

    void removeMessage(int id) throws DataAccessException;

}
