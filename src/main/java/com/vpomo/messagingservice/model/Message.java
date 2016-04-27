package com.vpomo.messagingservice.model;

import javax.persistence.*;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Simple model message
 *
 * @author Pomogalov Vladimir
 */

@Entity
@Cacheable(false)
@Table(name = "messages")
@XmlRootElement
public class Message implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id_message")
    public Integer idMessage;

    @Basic(optional = false)
    @Column(name = "date_message")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateMessage;

    @Basic(optional = false)
    @Size(min = 1, max = 40)
    @Column(name = "from_user_fio")
    private String nameFromUser;
    @Basic(optional = false)
    @Size(min = 1, max = 40)
    @Column(name = "to_user_fio")
    private String nameToUser;

    @Basic(optional = false)
    @Size(min = 1, max = 40)
    @Column(name = "subject_message")
    private String subjectMesage;
    @Basic(optional = false)
    @Column(name = "text_message")
    private String textMesage;

    @JoinColumn(name = "from_user_id", referencedColumnName = "login")
    @ManyToOne(optional = false)
    private Users fromUserMessage;
    @JoinColumn(name = "to_user_id", referencedColumnName = "login")
    @ManyToOne(optional = false)
    private Users toUserMessage;

    public Message() {
    }

    public Message(Integer idReport) {
        this.idMessage = idMessage;
    }

    public Message(Users fromUserMessage, Users toUserMessage, Date dateMessage) {
        this.fromUserMessage = fromUserMessage;
        this.toUserMessage = toUserMessage;
        this.dateMessage = dateMessage;
    }

    public Integer getIdMessage() {
        return idMessage;
    }

    public void setIdMessage(Integer idMessage) {
        this.idMessage = idMessage;
    }

    public String getDateMessage() {
        try {
            return new SimpleDateFormat("dd.MM.yyyy").format(this.dateMessage);
        } catch (NullPointerException e) {
            return "Дата не определена";
        }
    }

    public void setDateMessage(Date dateMessage) {
        this.dateMessage = dateMessage;
    }

    public String getNameFromUser() {
        return nameFromUser;
    }

    public void setNameFromUser(String nameFromUser) {
        this.nameFromUser = nameFromUser;
    }

    public String getNameToUser() {
        return nameToUser;
    }

    public void setNameToUser(String nameToUser) {
        this.nameToUser = nameToUser;
    }

    public String getSubjectMesage() {
        return subjectMesage;
    }

    public void setSubjectMesage(String subjectMesage) {
        this.subjectMesage = subjectMesage;
    }

    public String getTextMesage() {
        return textMesage;
    }

    public void setTextMesage(String textMesage) {
        this.textMesage = textMesage;
    }

    public Users getFromUserMessage() {
        return fromUserMessage;
    }

    public void setFromUserMessage(Users fromUserMessage) {
        this.fromUserMessage = fromUserMessage;
    }

    public Users getToUserMessage() {
        return toUserMessage;
    }

    public void setToUserMessage(Users toUserMessage) {
        this.toUserMessage = toUserMessage;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (idMessage != null ? idMessage.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        if (!(object instanceof Message)) {
            return false;
        }
        Message other = (Message) object;
        if ((this.idMessage == null && other.idMessage != null) || (this.idMessage != null && !this.idMessage.equals(other.idMessage))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Entity.Message[ idMessage = " + idMessage + " ]";
    }

}
