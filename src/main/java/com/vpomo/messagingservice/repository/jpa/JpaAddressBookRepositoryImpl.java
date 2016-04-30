package com.vpomo.messagingservice.repository.jpa;

import com.vpomo.messagingservice.model.AddressBook;
import com.vpomo.messagingservice.model.Message;
import com.vpomo.messagingservice.model.Users;
import com.vpomo.messagingservice.repository.AddressBookRepository;
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
 * Created by Vpomo on 30.04.2016.
 */

@Repository
@EnableTransactionManagement
public class JpaAddressBookRepositoryImpl implements com.vpomo.messagingservice.repository.AddressBookRepository {
    private static final Logger logger = LoggerFactory.getLogger(JpaAddressBookRepositoryImpl.class);
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    @Override
    public List<AddressBook> getAll() {
        Query query = this.entityManager.createQuery("SELECT a FROM AddressBook a");
        List<AddressBook> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public int addAddress(Users userOwner, String toUserId, String toUserFio) {
        try {
            AddressBook address = new AddressBook(userOwner, toUserId, toUserFio);
            this.entityManager.persist(address);
            return address.getIdAddress();
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    @Override
    public void removeAddress(int id) {
        AddressBook addressBook = this.entityManager.find(AddressBook.class, id);
        if (addressBook != null) {
            this.entityManager.remove(addressBook);
        }
    }

}
