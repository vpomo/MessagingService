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
    public List<Users> getAll() throws DataAccessException;

    public Users getUserLogin(String login) throws DataAccessException;

    public Integer addUser(String login, String password, String passwordTwo, String names, String email, String groupUser) throws DataAccessException;

    public Users newUser(String login, String password, String names, String email, String groupUser) throws DataAccessException;

    public void newPasswordUser(Users user, String password) throws DataAccessException;

    public List<Users> getUsersGroup(String grUser) throws DataAccessException;

    public void remove(String login) throws DataAccessException;
}
