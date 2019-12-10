package com.love.pojo;

import java.util.Date;

public class Love {
    private String donnor;
    private String type;
    private int number;
    private String describe;
    private String recipient;
    private Date createDate;

    @Override
    public String toString() {
        return "Love{" +
                "donnor='" + donnor + '\'' +
                ", type='" + type + '\'' +
                ", number=" + number +
                ", describe='" + describe + '\'' +
                ", recipient='" + recipient + '\'' +
                ", createDate=" + createDate +
                '}';
    }

    public Love() {
    }

    public Love(String donnor, String type, int number, String describe, String recipient, Date createDate) {
        this.donnor = donnor;
        this.type = type;
        this.number = number;
        this.describe = describe;
        this.recipient = recipient;
        this.createDate = createDate;
    }

    public String getDonnor() {
        return donnor;
    }

    public void setDonnor(String donnor) {
        this.donnor = donnor;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getRecipient() {
        return recipient;
    }

    public void setRecipient(String recipient) {
        this.recipient = recipient;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
}
