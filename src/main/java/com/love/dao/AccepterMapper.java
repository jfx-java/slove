package com.love.dao;


import com.love.pojo.Accepter;
import com.love.pojo.Sharer;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AccepterMapper {
    Accepter select(String loginName);
    Accepter st(int id);
    int selectlove();
    void changeImgurl(@Param("imgurl")String imgurl,@Param("id")int id);
    void updata(Accepter accepter);
    void add(@Param("loginName") String loginName, @Param("password") String password,@Param("difficulty") String difficulty);
    void updataAccepter( @Param("id")int id,@Param("name")String name,@Param("password")String password,@Param("difficulty")String difficulty);
}
