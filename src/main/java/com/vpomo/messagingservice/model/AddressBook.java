package com.vpomo.messagingservice.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;

/**
 * Simple model logusers
 *
 * @author Pomogalov Vladimir
 */

@Entity
@Table(name = "addressbook")
@Cacheable(false)
@XmlRootElement
public class AddressBook implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_address")
    private Integer idAddress;

    @Basic(optional = false)
    @Size(min = 1, max = 40)
    @Column(name = "to_user_fio")
    private String nameUser;

    @Basic(optional = false)
    @Size(min = 1, max = 10)
    @Column(name = "to_user_id")
    private String idUser;


    @JoinColumn(name = "user_owner", referencedColumnName = "login")
    @ManyToOne(optional = false)
    private Users userOwner;

    public AddressBook() {

    }

    public AddressBook(Users userOwner, String toUserId, String toUserFio) {
        this.userOwner = userOwner;
        this.idUser = toUserId;
        this.nameUser = toUserFio;
    }

    public Integer getIdAddress() {
        return idAddress;
    }

    public void setIdAddress(Integer idAddress) {
        this.idAddress = idAddress;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getIdUser() {
        return idUser;
    }

    public void setIdUser(String idUser) {
        this.idUser = idUser;
    }

    public Users getUserOwner() {
        return userOwner;
    }

    public void setUserOwner(Users userOwner) {
        this.userOwner = userOwner;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idAddress != null ? idAddress.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AddressBook)) {
            return false;
        }
        AddressBook other = (AddressBook) object;
        if ((this.idAddress == null && other.idAddress != null) || (this.idAddress != null && !this.idAddress.equals(other.idAddress))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.AddressBook[ idAddress = " + idAddress + " ]";
    }

}
