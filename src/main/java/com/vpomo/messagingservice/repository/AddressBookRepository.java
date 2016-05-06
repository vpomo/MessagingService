package com.vpomo.messagingservice.repository;

import com.vpomo.messagingservice.model.AddressBook;
import com.vpomo.messagingservice.model.Users;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Created by Vpomo on 30.04.2016.
 */
public interface AddressBookRepository {
    List<AddressBook> getAll() throws DataAccessException;

    List<AddressBook> getAddressByLogin(Users loginUser) throws DataAccessException;

    int addAddress(Users userOwner, String toUserId, String toUserFio) throws DataAccessException;

    void removeAddress(int id) throws DataAccessException;


}
