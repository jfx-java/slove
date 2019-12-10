package com.love.pojo;

import java.util.Date;

public class Sharer {
    private int id;
    private String loginName;
    private String name;
    private String password;
    private Integer loveData;
    private String loveDescribe;
    private String imgurl;
    private Date createDate;
    private Date updateDate;

    @Override
    public String toString() {
        return "Sharer{" +
                "id=" + id +
                ", loginName='" + loginName + '\'' +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", loveData=" + loveData +
                ", loveDescribe='" + loveDescribe + '\'' +
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

    public Integer getLoveData() {
        return loveData;
    }

    public void setLoveData(Integer loveData) {
        this.loveData = loveData;
    }

    public String getLoveDescribe() {
        return loveDescribe;
    }

    public void setLoveDescribe(String loveDescribe) {
        this.loveDescribe = loveDescribe;
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

    public Sharer() {
    }

    public Sharer(int id, String loginName, String name, String password, Integer loveData, String loveDescribe, String imgurl, Date createDate, Date updateDate) {
        this.id = id;
        this.loginName = loginName;
        this.name = name;
        this.password = password;
        this.loveData = loveData;
        this.loveDescribe = loveDescribe;
        this.imgurl = imgurl;
        this.createDate = createDate;
        this.updateDate = updateDate;
    }
}
