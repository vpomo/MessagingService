package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.Users;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.Assert.assertTrue;

/**
 * Here are the methods for testing data features
 *
 * @author Pomogalov Vladimir
 */


public abstract class AbstractUsersServiceTests {

    @Autowired
    protected UsersService usersService;

   // @Transactional

    @Before
    public void shouldUsersTest() {
        System.out.println(" ==== Test Before ==== ");
        System.out.println(" ==== Before Test's passed ==== ");
    }


    @Test
    public void testUsersGetAll() {
        System.out.println(" ==== Test's UsersClass getAll() begin ==== ");
        List<Users> resultList = null;
        resultList = this.usersService.getAll();
        assertTrue(resultList != null);
        System.out.println(" ==== Test's UsersClass  getAll() passed ==== ");
    }

    @Test
    public void testGetUserLogin() {
        System.out.println(" ==== Test's UsersClass getUserLogin() begin ==== ");
        Users resultList = null;
        String login = "adminTest";
        resultList = this.usersService.getUserLogin(login);
        assertTrue(resultList != null);
        System.out.println(" ==== Test's UsersClass  getUserLogin() passed ==== ");
    }

    @Test
    public void testAddUser() {
        System.out.println(" ==== Test's UsersClass addUser() begin ==== ");
        Integer result = 10;
        String login = "testUser";
        String password = "testpass";
        String passwordTwo = "testpass";
        String names = "namesTestUser";
        String groupUser = "user";
        String email = "vasya@mail.ru";

        result = this.usersService.addUser(login, password, passwordTwo, names, email, groupUser);
        // You can create a new user
        assertThat(result.compareTo(0));

        login = "adminTest";
        result = this.usersService.addUser(login, password, passwordTwo, names, email, groupUser);
        // Such user already exists
        assertThat(result.compareTo(3));

        passwordTwo = "newTestPass";
        result = this.usersService.addUser(login, password, passwordTwo, names, email, groupUser);
        // password is not passwordTwo for user
        assertThat(result.compareTo(2));

        passwordTwo = null;
        result = this.usersService.addUser(login, password, passwordTwo, names, email, groupUser);
        // passwordTwo is null
        assertThat(result.compareTo(2));

        System.out.println(" ==== Test's UsersClass  addUser() passed ==== ");
    }

    @Test
    public void testNewUser() {
        System.out.println(" ==== Test's UsersClass newUser() begin ==== ");
        String login = "newUser";
        String password = "testpass";
        String names = "Проверка";
        Date dateLastReport = new Date();
        String groupUser = "user";
        Users user = null;
        String email = "vasya@mail.ru";

        user = this.usersService.newUser(login, password, names, email, groupUser);
        System.out.println(names);
        assertTrue(user != null);
        this.usersService.remove(login);
        System.out.println(" ==== Test's UsersClass  newUser() passed ==== ");
    }

    @Test
    public void testNewDateUser() {
        System.out.println(" ==== Test's UsersClass newDateUser() begin ==== ");
        Users user = new Users();
        Users user2 = new Users();
        String login = "adminTest";

        user = this.usersService.getUserLogin(login);

        Date currentDate = new Date();
        String password = "654321";
        String newPassword = "123456";

        this.usersService.newPasswordUser(user, password);
        String oldUserPassword = user.getPassword();
        System.out.println("oldUserPassword = " + oldUserPassword);

        this.usersService.newPasswordUser(user, newPassword);
        user2 = this.usersService.getUserLogin(login);
        String newUserPassword = user.getPassword();
        System.out.println("newUserPassword = " + newUserPassword);

        assertTrue(password != newPassword);
        assertTrue(!newUserPassword.equals(oldUserPassword));

        System.out.println(" ==== Test's UsersClass  newDateUser() passed ==== ");
    }

    @Test
    public void testGetUsersGroup() {
        System.out.println(" ==== Test's UsersClass getUsersGroup() begin ==== ");
        String groupUser = "user";
        List<Users> resultList = null;
        resultList = this.usersService.getUsersGroup(groupUser);
        assertTrue(resultList != null);
        System.out.println(" ==== Test's UsersClass  getUsersGroup() passed ==== ");
    }

    @After
    public void testRemoveUser() {
        System.out.println(" ==== Test's UsersClass remove() begin ==== ");
        String login = "testUser";
        this.usersService.remove(login);
        System.out.println(" ==== Test's UsersClass  remove() passed ==== ");
    }

}
