package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.AddressBook;
import com.vpomo.messagingservice.model.Message;
import com.vpomo.messagingservice.model.Users;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

import static org.junit.Assert.assertTrue;

/**
 * Created by Vpomo on 01.05.2016.
 */
public abstract class AbstractMessageServiceTests {

    @Autowired
    protected MessageService messageService;
    @Autowired
    protected UsersService usersService;

    @Before
    public void prepareTest() {
        System.out.println(" ==== Test Before ==== ");
        Users user1 = usersService.newUser("testUser1", "123456", "Первый Тестовый", "one@mail.ru", "user");
        Users user2 = usersService.newUser("testUser2", "123456", "Второй Тестовый", "two@mail.ru", "user");
        System.out.println(" ==== Before Test's passed ==== ");
    }

    @Test
    public void testAddressGetAll() {
        System.out.println(" ==== Test's AddressBookClass getAll() begin ==== ");
        Date currentDate = new Date();
        List<Message> resultList = null;
        int idMessage1 = messageService.addMessage("testUser1", "Первый Тестовый", "testUser2", "Второй Тестовый",
                                                    "Тема №1", "текст 1", currentDate);
        int idMessage2 = messageService.addMessage("testUser2", "Второй Тестовый",  "testUser1", "Первый Тестовый",
                                                    "Тема №2", "текст 2", currentDate);
        resultList = this.messageService.getAll();
        assertTrue(resultList != null);
        messageService.removeMessage(idMessage1);
        messageService.removeMessage(idMessage2);
        System.out.println(" ==== Test's AddressBookClass  getAll() passed ==== ");
    }

    @Test
    public void testAddRemove() {
        System.out.println(" ==== Test's add() remove() begin ==== ");
        Date currentDate = new Date();
        int idMessage1 = messageService.addMessage("testUser1", "Первый Тестовый", "testUser2", "Второй Тестовый",
                "Тема №1", "текст 1", currentDate);
        int idMessage2 = messageService.addMessage("testUser2", "Второй Тестовый",  "testUser1", "Первый Тестовый",
                "Тема №2", "текст 2", currentDate);
        assertTrue(idMessage1 != 0);
        assertTrue(idMessage2 != 0);
        System.out.println(" ==== Test's add() remove() passed ==== ");
    }

    @After
    public void finish() {
        usersService.remove("testUser1");
        usersService.remove("testUser2");
    }


}
