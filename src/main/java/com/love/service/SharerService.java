package com.love.service;

import com.love.dao.SharerMapper;

import com.love.pojo.Accepter;
import com.love.pojo.Sharer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SharerService {
    @Autowired
    private SharerMapper sharerDao;

    public Sharer select(Sharer sharer) {
        System.out.println(sharer);
        return sharerDao.select(sharer.getLoginName());

    }

    public int selectlove() {
        return sharerDao.selectlove();
    }
    public void add(String loginName,String password){
        sharerDao.add(loginName,password);
    }
    public List<Accepter> selectAccepter(){
        return sharerDao.selectAccepter();
    }




    public int sl(String adata){
        return sharerDao.sl(adata);
    }


    @Transactional(propagation = Propagation.REQUIRED,rollbackFor = Exception.class)
    public  void   updatalove(String adata,int accepterId) throws Exception{

        sharerDao.insertLove(adata);
        sharerDao.updataloveb(accepterId);
    }



}
