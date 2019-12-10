package com.love.controller;

import com.love.pojo.Accepter;
import com.love.pojo.Sharer;
import com.love.service.AccepterService;
import com.love.service.SharerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/accepter")
public class AccepterController {
    @Autowired
    private AccepterService accepterService;
    @ResponseBody
    @RequestMapping("/do_login")
    public Map<String,Object> login(Accepter accepter, HttpServletRequest req){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("isSuccess",true);
        Accepter select = accepterService.select(accepter);
        Boolean isLoginSuccess=false;
        String msg = " ";
        if (select==null){
            msg="用户名不存在";
        }else if (!select.getPassword().equals(accepter.getPassword())){
            msg="密码 错误";
        }else {
            isLoginSuccess=true;
            HttpSession session = req.getSession();
            session.setAttribute("accepters",select);
        }
        resultMap.put("isLoginSuccess",isLoginSuccess);
        resultMap.put("msg",msg);
        return resultMap;
    }
    @ResponseBody
    @RequestMapping("/do_regist")
    public Map<String,Object> regist(String loginName,String password,String qrpassword,String difficulty){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("isSuccess",true);
        Boolean isRegistSuccess=false;
        String msg = "";
        if (!password.equals(qrpassword)){
            msg="两次密码输入不一致";
        }else {
            try {
                accepterService.add(loginName,password,difficulty);
                msg="注册成功";
                isRegistSuccess=true;
            }catch (Exception e){
                e.printStackTrace();
                msg="账号已存在";
            }
        }
        resultMap.put("isRegistSuccess",isRegistSuccess);
        resultMap.put("msg",msg);
        return resultMap;
    }




@ResponseBody
@RequestMapping("/imgChange")
    public Map<String,Object> imgChange(MultipartFile img,HttpServletRequest req){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("isSuccess",true);
        Boolean isChangeSuccess=false;
        String imgurl = accepterService.uploadPicture(img);
        try {
            HttpSession session = req.getSession();
            Accepter accepter = (Accepter)session.getAttribute("accepters");
            accepterService.changeImgurl(imgurl,accepter.getId());
            isChangeSuccess=true;
        }catch (Exception e){
            e.printStackTrace();
        }
        resultMap.put("isChangeSuccess",isChangeSuccess);
        resultMap.put("isurl",imgurl);
    return resultMap;
    }


    @ResponseBody
    @RequestMapping("/upData")
    public Map<String,Object> upData(HttpServletRequest req,int id,String name,String password,String difficulty){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("isSuccess",true);
        Boolean isUpDataSuccess=false;
        try {
            accepterService.updataAccepter(id,name,password,difficulty);
            isUpDataSuccess=true;

        }catch (Exception e){
            e.printStackTrace();
        }
        resultMap.put("isUpDataSuccess",isUpDataSuccess);
        Accepter accepter = accepterService.st(id);
        HttpSession session = req.getSession();
        session.setAttribute("accepters",accepter);
        return resultMap;
    }

}
