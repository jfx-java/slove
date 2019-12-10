package com.love.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.love.pojo.Accepter;
import com.love.pojo.Sharer;
import com.love.service.SharerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
@RequestMapping("/sharer")
public class SharingController {
    @Autowired
    private SharerService sharerService;
    @ResponseBody
    @RequestMapping("/do_login")
    public Map<String,Object> login(Model model, Sharer sharer, HttpServletRequest req){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("isSuccess",true);
        Sharer select = sharerService.select(sharer);
        Boolean isLoginSuccess=false;
        String msg = "";
        if (select==null){
            msg="用户名不存在";
        }else if (!select.getPassword().equals(sharer.getPassword())){
            msg="密码错误";
        }else {
            isLoginSuccess=true;
            HttpSession session = req.getSession();
            session.setAttribute("sharer_info",select);
        }
        resultMap.put("isLoginSuccess",isLoginSuccess);
        resultMap.put("msg",msg);
        return resultMap;
    }
    @ResponseBody
    @RequestMapping("/do_regist")
    public Map<String,Object> regist(Model model,String loginName,String password,String qrpassword){
        Map<String,Object> resultMap = new HashMap<>();
        resultMap.put("isSuccess",true);
        Boolean isRegistSuccess=false;
        String msg = "";
        if (!password.equals(qrpassword)){
            msg="两次密码输入 不一致";
        }else {
            try {
                sharerService.add(loginName,password);
                msg="注册 成功";
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



@RequestMapping("/findAccepter")
    public String selectAccepter(Model model,@RequestParam(value = "pn",defaultValue = "1")Integer pn){
        PageHelper.startPage(pn,3);
        List<Accepter> accepters = sharerService.selectAccepter();

        PageInfo pageInfo = new PageInfo(accepters,3);
        model.addAttribute("pageInfo",pageInfo);
        return "sharerHome";
    }





//    @RequestMapping("/upDataLove")
//    public String updatalove(HttpServletResponse resp, Model model,@RequestParam("sharerId")int sharerId,@RequestParam("accepterId")int accepterId){
//        String adata=sharerId+"-"+accepterId;
//        int i = sharerService.sl(adata);
//        if (i==0){
//            try {
//                sharerService.updatalove(adata, accepterId);
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }else {
//
//            System.out.println("已经投过票了");
//            return "fail";
//        }
//        PageHelper.startPage(1,3);
//        List<Accepter> accepters = sharerService.selectAccepter();
//        PageInfo pageInfo = new PageInfo(accepters,3);
//        model.addAttribute("pageInfo",pageInfo);
//        return "sharerHome";
//    }
@ResponseBody
@RequestMapping("/vote")
    public Map<String,Object> vote(int accepterId,int sharerId){
    Map<String,Object> resultMap = new HashMap<>();
    String adata=sharerId+"-"+accepterId;
    int i = sharerService.sl(adata);
    resultMap.put("isSuccess",true);
    String msg="";
    Boolean isVoteSuccess=false;
    if (i==0){
        try {
            isVoteSuccess=true;
            sharerService.updatalove(adata, accepterId);
            msg="投票成功！";
        } catch (Exception e) {
            e.printStackTrace();
            msg="系统异常";
        }
    }else {
        msg="您已经给他投过票啦~";
    }
    resultMap.put("isVoteSuccess",isVoteSuccess);
    resultMap.put("msg",msg);

    return resultMap;
    }
}
