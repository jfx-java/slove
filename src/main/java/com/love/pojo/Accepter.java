package com.love.pojo;

import java.util.Date;

public class Accepter {
    private int id;
    private String loginName;
    private String name;
    private String password;
    private int acceptLoveData;
    private String difficulty;
    private String imgurl;
    private Date createDate;
    private Date updateDate;

    @Override
    public String toString() {
        return "Accepter{" +
                "id=" + id +
                ", loginName='" + loginName + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", acceptLoveData=" + acceptLoveData +
                ", difficulty='" + difficulty + '\'' +
                ", imgurl='" + imgurl + '\'' +
                ", createDate=" + createDate +
                ", updateDate=" + updateDate +
                '}';
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAcceptLoveData() {
        return acceptLoveData;
    }

    public void setAcceptLoveData(int acceptLoveData) {
        this.acceptLoveData = acceptLoveData;
    }

    public String getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(String difficulty) {
        this.difficulty = difficulty;
    }

    public String getImgurl() {
        return imgurl;
    }

    public void setImgurl(String imgurl) {
        this.imgurl = imgurl;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public Accepter() {
    }

    public Accepter(int id, String loginName, String name, String password, int acceptLoveData, String difficulty, String imgurl, Date createDate, Date updateDate) {
        this.id = id;
        this.loginName = loginName;
        this.name = name;
        this.password = password;
        this.acceptLoveData = acceptLoveData;
        this.difficulty = difficulty;
        this.imgurl = imgurl;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
}
