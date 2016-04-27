package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.Users;
import com.vpomo.messagingservice.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Mostly used as a facade for all MessagingService controllers
 * Also a placeholder for @Transactional annotations
 *
 * @author Pomogalov Vladimir
 */

@Service
//@Transactional(propagation = Propagation.REQUIRED, timeout = 60)
public class UsersServiceImpl implements UsersService {
    private UsersRepository usersRepository;

    @Autowired
    public UsersServiceImpl(com.vpomo.messagingservice.repository.UsersRepository usersRepository) throws DataAccessException {
        this.usersRepository = usersRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<Users> getAll() throws DataAccessException {
        return usersRepository.getAll();
    }


    @Override
    @Transactional(readOnly = true)
    public Users getUserLogin(String login) throws DataAccessException {
        return usersRepository.getUserLogin(login);
    }

    @Override
    @Transactional
    public Integer addUser(String login, String password, String passwordTwo, String names, String email, String groupUser) throws DataAccessException {
        return usersRepository.addUser(login, password, passwordTwo, names, email, groupUser);
    }

    @Override
    @Transactional
    public Users newUser(String login, String password, String names, String email, String groupUser) throws DataAccessException {
        return usersRepository.newUser(login, password, names, email, groupUser);
    }

    @Override
    @Transactional
    public void newPasswordUser(Users user, String password) throws DataAccessException {
        usersRepository.newPasswordUser(user, password);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Users> getUsersGroup(String grUser) throws DataAccessException {
        return usersRepository.getUsersGroup(grUser);
    }

    @Override
    @Transactional
    public void remove(String login) throws DataAccessException {
        usersRepository.remove(login);
    }

}
