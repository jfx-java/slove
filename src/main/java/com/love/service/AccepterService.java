package com.love.service;

import com.love.dao.AccepterMapper;
import com.love.dao.SharerMapper;
import com.love.pojo.Accepter;
import com.love.pojo.Sharer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class AccepterService {
    private String filepath = "D:/java/slove/src/main/webapp/resource/portrait/";
    @Autowired
    private AccepterMapper accepterMapper;

    public void changeImgurl(String imgurl,int id){
        accepterMapper.changeImgurl(imgurl,id);
    }
    public String uploadPicture(MultipartFile img){
        //获取上传文件名
        String originalFilename = img.getOriginalFilename();
        //判断文件夹是否存在，不存在则创建
        File file = new File(filepath);

        if (!file.exists()){
            file.mkdirs();
        }
        String uuid = getUUID();
        String newFilePath = filepath+uuid+originalFilename;
        System.out.println(newFilePath);
        try {
            img.transferTo(new File(newFilePath));
        } catch (IOException e) {
            e.printStackTrace();
        }
        return uuid+originalFilename;
    }

    public void updataAccepter(int id,String name,String password,String difficulty){
        accepterMapper.updataAccepter(id,name,password,difficulty);
    }
    public Accepter st(int id){
        return accepterMapper.st(id);
    }

    public static String getUUID(){
        String uuid = UUID.randomUUID().toString();
        uuid = uuid.replaceAll("-", "");

        return uuid;
    }




    public Accepter select(Accepter accepter) {
        System.out.println(accepter);

         return accepterMapper.select(accepter.getLoginName());


    }

    public int selectlove() {
        return accepterMapper.selectlove();
    }
    public void add(String loginName,String password,String difficulty){
        accepterMapper.add(loginName,password,difficulty);
    }

}
