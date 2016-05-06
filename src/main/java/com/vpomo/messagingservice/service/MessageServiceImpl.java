package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.Message;
import com.vpomo.messagingservice.model.Users;
import com.vpomo.messagingservice.repository.MessageRepository;
import com.vpomo.messagingservice.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by Vpomo on 30.04.2016.
 */

@Service
public class MessageServiceImpl implements MessageService {
    private MessageRepository messageRepository;
    private UsersRepository usersRepository;

    @Autowired
    public MessageServiceImpl(MessageRepository messageRepository, UsersRepository usersRepository)  throws DataAccessException {
        this.messageRepository = messageRepository;
        this.usersRepository = usersRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Message> getAll() throws DataAccessException {
        return messageRepository.getAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<Message> getMessagesByLogin(String loginUser) throws DataAccessException {
        Users userOwner = usersRepository.getUserLogin(loginUser);
        if (userOwner != null) {
            return messageRepository.getMessagesByLogin(userOwner);
        } else {
            return null;
        }
    }

    @Override
    @Transactional
    public int addMessage(String fromUserId, String fromUserFio, String toUserId, String toUserFio,
                   String subject, String textMessage, Date currentDate) throws DataAccessException {
        Users fromUser = usersRepository.getUserLogin(fromUserId);
        Users toUser = usersRepository.getUserLogin(toUserId);
        if ((fromUser != null) & (toUser != null)) {
            return messageRepository.addMessage(fromUser, fromUserFio, toUser, toUserFio,
                    subject, textMessage, currentDate);
        } else {
            return 0;
        }
    }

    @Override
    @Transactional
    public void removeMessage(int id) throws DataAccessException {
        messageRepository.removeMessage(id);
    }

}
