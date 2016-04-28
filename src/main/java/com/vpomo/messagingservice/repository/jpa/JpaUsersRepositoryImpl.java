package com.vpomo.messagingservice.repository.jpa;

import org.springframework.stereotype.Repository;

import com.vpomo.messagingservice.model.Users;
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
 * JPA implementation of the {@link com.vpomo.messagingservice.repository.UsersRepository} interface.
 *
 * @author Pomogalov Vladimir
 */

@Repository
@EnableTransactionManagement
public class JpaUsersRepositoryImpl implements com.vpomo.messagingservice.repository.UsersRepository {
    private static final Logger logger = LoggerFactory.getLogger(JpaUsersRepositoryImpl.class);
    @PersistenceContext(type = PersistenceContextType.EXTENDED)
    private EntityManager entityManager;

    @Override
    public List<Users> getAll() {
        Query query = this.entityManager.createQuery("SELECT u FROM Users u");
        List<Users> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public Users getUserLogin(String login) {
        Users resultList = null;
        //Query query = this.entityManager.createQuery("SELECT u FROM Users u WHERE u.login = :login");
        //query.setParameter("login", login);
        //resultlist = (Users) query.getResultList();
        resultList = this.entityManager.find(Users.class,login);
        return resultList;
    }

    @Override
    public Integer addUser(String login, String password, String passwordTwo, String names, String email, String groupUser) {
        Users resultList = null;

        try{
            if (login!=null && password!=null && passwordTwo!=null && password.equals(passwordTwo)){
                resultList = getUserLogin(login);
                if (resultList == null) {
                    Users user = newUser(login, password, names, email, groupUser);
                    return 0;
                }else {return 3;}
            }else {return 2;}
        }catch (Exception e){
            return 1;
        }
    }

    @Override
    public Users newUser(String login, String password, String names, String email, String groupUser) {
        Users user = new Users(login, password, names, email, groupUser);
        if (getUserLogin(login) == null) {
            this.entityManager.persist(user);
        } else {
            this.entityManager.merge(user);
        }

        return user;
    }

    @Override
    public void newPasswordUser(Users user, String password) {
        user.setPassword(password);
        this.entityManager.merge(user);
        this.entityManager.flush();
    }

    @Override
    public void updateUser(String login, String password, String fioUser, String emailUser, String groupUser) {
        Users user = null;
        user = this.entityManager.find(Users.class, login);
        user.setPassword(password);
        user.setNameUser(fioUser);
        user.setEmail(emailUser);
        user.setGroupUser(groupUser);
        this.entityManager.merge(user);
        this.entityManager.flush();
    }

    @Override
    public List<Users> getUsersGroup(String grUser) {
        Query query = this.entityManager.createQuery("SELECT u FROM Users u WHERE u.groupUser = :groupUser");
        query.setParameter("groupUser", grUser);
        List<Users> resultList = query.getResultList();
        return resultList;
    }

    @Override
    public void remove(String login) {
        Users user = this.entityManager.find(Users.class, login);
        if (user != null) {
            this.entityManager.remove(user);
        }
    }

}
