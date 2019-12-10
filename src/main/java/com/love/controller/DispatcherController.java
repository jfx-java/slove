package com.love.controller;

import com.love.service.SharerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

//装配bean
@Controller
//虚拟路径 '/'是当前网站的根
@RequestMapping("/dispatcher")
public class DispatcherController {
    @Autowired
    private SharerService sharerService;
    @RequestMapping("/view")
    public String view(Model model){
        int selectlove = sharerService.selectlove();
        model.addAttribute("loveData",selectlove);
        return "main";
    }


    @RequestMapping("/updataAccepter")
    public String updataAccepter(){
        return "updataSuccess";
    }

    @RequestMapping("/tl")
    public String tl(){
        return "login";
    }

    @RequestMapping("/atl")
    public String atl(){
        return "alogin";
    }
    @RequestMapping("/atz")
    public String atz(){
        return "aregist";
    }
    @RequestMapping("/aregistSuccess")
    public String aregistSuccess(){
        return "aregistSuccess";
    }
    @RequestMapping("/ash")
    public String ahome(){return "accepterHome";}
    @RequestMapping("/accepter_list")
    public String accepterlist(){return "accepter_list";}



    @RequestMapping("/tz")
    public String tz(){
        return "regist";
    }
    @RequestMapping("/registSuccess")
    public String registSuccess(){
        return "registSuccess";
    }
    @RequestMapping("/sh")
    public String home(){return "sharerHome";}
}
