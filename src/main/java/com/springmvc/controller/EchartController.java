package com.springmvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.naming.ldap.HasControls;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EchartController {

    @RequestMapping("/chart")
    public String index() {return "chart";}

    @RequestMapping(value = "/chartData",method = RequestMethod.GET, produces = "application/json")
    @ResponseBody
    public List echartMethod(HttpServletRequest request){
        Map result =new HashMap();
//        String optValues = request.getParameter("opt_values");
        String dataLevel1 ="5";
        String dataLevel2 ="3";

        ArrayList myList = new ArrayList();
        String Level = "级别";
        String Num ="数量";
        result.put(Level,"正科");
        result.put(Num,dataLevel2);
        myList.add(result);
        Map result1 =new HashMap();
        result1.put(Level,"副处");
        result1.put(Num,dataLevel1);
        myList.add(result1);
        return  myList;
    }
}
