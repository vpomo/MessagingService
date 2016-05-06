package com.vpomo.messagingservice.repository.jpa;

import com.vpomo.messagingservice.model.Message;
import com.vpomo.messagingservice.model.Users;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceContextType;
import javax.persistence.Query;
import java.util.Date;
import java.util.List;

/**
 * Created by Vpomo on 29.04.2016.
 */

@Repository
@EnableTransactionManagement
public class JpaMessageRepositoryImpl implements com.vpomo.messagingservice.repository.MessageRepository {
    private static final Logger logger = LoggerFactory.getLogger(JpaMessageRepositoryImpl.class);
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    @Override
    public List<Message> getAll() {
        Query query = this.entityManager.createQuery("SELECT m FROM Message m");
        List<Message> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public List<Message> getMessagesByLogin(Users loginUser) {
        Query query = this.entityManager.createQuery("SELECT m FROM Message m WHERE m.toUserMessage = :userId");
        query.setParameter("userId", loginUser);
        List<Message> resultList = query.getResultList();
        if (resultList != null) {
            System.out.println("Есть сообщения !!!");
        }
        return resultList;
    }


    @Override
    public int addMessage(Users fromUserId, String fromUserFio, Users toUserId, String toUserFio,
                          String subject, String textMessage, Date currentDate) {
        try {
            Message message = new Message(fromUserId, fromUserFio, toUserId, toUserFio, subject, textMessage, currentDate);
            this.entityManager.persist(message);
            return message.getIdMessage();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public void removeMessage(int id) {
        Message message = this.entityManager.find(Message.class, id);
        if (message != null) {
            this.entityManager.remove(message);
        }
    }

}
