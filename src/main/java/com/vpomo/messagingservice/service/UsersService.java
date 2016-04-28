package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.Users;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Mostly used as a facade so all controllers have a single point of entry
 *
 * @author Pomogalov Vladimir
 */

public interface UsersService {
    List<Users> getAll() throws DataAccessException;

    Users getUserLogin(String login) throws DataAccessException;

    Integer addUser(String login, String password, String passwordTwo, String names, String email, String groupUser) throws DataAccessException;

    Users newUser(String login, String password, String names, String email, String groupUser) throws DataAccessException;

    void newPasswordUser(Users user, String password) throws DataAccessException;

    void updateUser(String login, String password, String fioUser, String emailUser, String groupUser) throws DataAccessException;

    List<Users> getUsersGroup(String grUser) throws DataAccessException;

    void remove(String login) throws DataAccessException;
}
