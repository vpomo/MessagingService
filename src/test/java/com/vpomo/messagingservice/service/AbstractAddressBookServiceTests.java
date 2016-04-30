package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.AddressBook;
import com.vpomo.messagingservice.model.Users;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.assertTrue;

/**
 * Created by Vpomo on 30.04.2016.
 */
public abstract class AbstractAddressBookServiceTests {

    @Autowired
    protected AddressBookService addressBookService;
    @Autowired
    protected UsersService usersService;

    @Before
    public void shouldAddressTest() {
        System.out.println(" ==== Test Before ==== ");
        Users user1 = usersService.newUser("testUser1", "123456", "Первый Тестовый", "one@mail.ru", "user");
        Users user2 = usersService.newUser("testUser2", "123456", "Второй Тестовый", "two@mail.ru", "user");

        addressBookService.addMessage(user1.getLogin(), user2.getLogin(), user2.getNameUser());
        addressBookService.addMessage(user2.getLogin(), user1.getLogin(), user1.getNameUser());
        System.out.println(" ==== Before Test's passed ==== ");
    }

    @Test
    public void testAddressGetAll() {
        System.out.println(" ==== Test's AddressBookClass getAll() begin ==== ");
        List<AddressBook> resultList = null;
        resultList = this.addressBookService.getAll();
        assertTrue(resultList != null);
        System.out.println(" ==== Test's AddressBookClass  getAll() passed ==== ");
    }

}
