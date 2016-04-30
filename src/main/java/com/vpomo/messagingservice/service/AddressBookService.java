package com.vpomo.messagingservice.service;

import com.vpomo.messagingservice.model.AddressBook;
import org.springframework.dao.DataAccessException;

import java.util.List;

/**
 * Created by Vpomo on 30.04.2016.
 */
public interface AddressBookService {
    List<AddressBook> getAll() throws DataAccessException;

    int addMessage(String userOwnerId, String toUserId, String toUserFio);

    void removeAddress(int id);
}
