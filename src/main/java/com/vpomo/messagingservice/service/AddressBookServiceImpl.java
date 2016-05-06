package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.AddressBook;
import com.vpomo.messagingservice.model.Users;
import com.vpomo.messagingservice.repository.AddressBookRepository;
import com.vpomo.messagingservice.repository.UsersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Vpomo on 30.04.2016.
 */

@Service
public class AddressBookServiceImpl implements AddressBookService {
    private AddressBookRepository addressBookRepository;
    private UsersRepository usersRepository;

    @Autowired
    public AddressBookServiceImpl(AddressBookRepository addressBookRepository, UsersRepository usersRepository) throws DataAccessException {
        this.addressBookRepository = addressBookRepository;
        this.usersRepository = usersRepository;
    }

    @Override
    @Transactional(readOnly = true)
    public List<AddressBook> getAll() throws DataAccessException {
        return addressBookRepository.getAll();
    }

    @Override
    @Transactional(readOnly = true)
    public List<AddressBook> getAddressByLogin(String loginUser) throws DataAccessException {
        Users userOwner = usersRepository.getUserLogin(loginUser);
        if (userOwner != null) {
            return addressBookRepository.getAddressByLogin(userOwner);
        } else {
            return null;
        }
    }

    @Override
    @Transactional
    public int addMessage(String userOwnerId, String toUserId, String toUserFio) throws DataAccessException {
        Users userOwner = usersRepository.getUserLogin(userOwnerId);
        if (userOwner != null) {
            return addressBookRepository.addAddress(userOwner, toUserId, toUserFio);
        } else {
            return 0;
        }
    }

    @Override
    @Transactional
    public void removeAddress(int id) throws DataAccessException {
        addressBookRepository.removeAddress(id);
    }

}
