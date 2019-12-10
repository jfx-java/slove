package com.love.dao;


import com.love.pojo.Accepter;
import com.love.pojo.Sharer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface SharerMapper {
    Sharer select(String loginName);
    int selectlove();
    void add(@Param("loginName") String loginName,@Param("password") String password);
    List<Accepter> selectAccepter();

    int sl(@Param("adata") String adata);

    void insertLove(@Param("adata") String adata);
    void updataloveb(@Param("id") int id);
}
