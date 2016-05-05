package com.vpomo.messagingservice.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import java.io.Serializable;
import java.util.List;

/**
 * Simple model users
 *
 * @author Pomogalov Vladimir
 */

@Entity
@Cacheable(false)
@Table(name = "users")
@XmlRootElement
public class Users implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "login")
    private String login;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 10)
    @Column(name = "password")
    private String password;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 30)
    @Column(name = "email")
    private String email;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 40)
    @Column(name = "fio_user")
    private String nameUser;

    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 9)
    @Column(name = "group_user")
    private String groupUser;

    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "fromUserMessage")
    private List<Message> messageFromUserList;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "toUserMessage")
    private List<Message> messageToUserList;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "userOwner")
    private List<AddressBook> addressBookList;

    public Users() {
    }

    public Users(String login) {
        this.login = login;
    }

    public Users(String login, String password, String nameUser, String email, String groupUser) {
        this.login = login;
        this.password = password;
        this.nameUser = nameUser;
        this.email = email;
        this.groupUser = groupUser;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getGroupUser() {
        return groupUser;
    }

    public void setGroupUser(String groupUser) {
        this.groupUser = groupUser;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    //@XmlTransient
    public List<Message> getMessageFromUserList() {
        return messageFromUserList;
    }

    public void setMessageFromUserList(List<Message> messageFromUserList) {
        this.messageFromUserList = messageFromUserList;
    }

    //@XmlTransient
    public List<Message> getMessageToUserList() {
        return messageToUserList;
    }

    public void setMessageToUserList(List<Message> messageToUserList) {
        this.messageToUserList = messageToUserList;
    }

    //@XmlTransient
    public List<AddressBook> getAddressBookList() {
        return addressBookList;
    }

    public void setAddressBookList(List<AddressBook> addressBookList) {
        this.addressBookList = addressBookList;
    }

    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (login != null ? login.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Users)) {
            return false;
        }
        Users other = (Users) object;
        if ((this.login == null && other.login != null) || (this.login != null && !this.login.equals(other.login))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Users[login = " + login + "]";
    }
    
}
