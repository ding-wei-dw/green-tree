package com.pro.controller;

import com.alibaba.fastjson.JSONArray;
import com.pro.pojo.Member;
import com.pro.pojo.PageBean;
import com.pro.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;
 /*
    //显示所有
    @RequestMapping("/getList")
    public String getList(Model model){
        List<Member> list = memberService.getList();
        model.addAttribute("list",list);
        return "show";
    }
*/
    //分页显示
    @RequestMapping("/getList")
    public String getPageBean(@RequestParam(value = "currentPage",defaultValue = "1",required = false)int currentPage,Model model){
        PageBean<Member> page = memberService.findByPage(currentPage);
        model.addAttribute("pagemsg",page);
        return "show";
    }

    //模糊查询（根据姓名）ajax实现
    @RequestMapping("/getListByName")
    @ResponseBody
    public String getListByName(@RequestParam(value = "mname",required = false)String mname){
        List<Member> list = memberService.getListByName(mname);
        String json = JSONArray.toJSONString(list);//转成json数据
        return json;
    }
    //新增
    @RequestMapping("/doAdd")
    public String add(Member member,Model model){
        int n =memberService.addMember(member);
        if(n>0){
            return "redirect:/getList";//SUCCESS
        }else {
            return "add";//Failed
        }
    }
    //根据id查询
    @RequestMapping("/getById/{id}")
    public String getById(@PathVariable("id") Integer id, Model model){
        Member member = memberService.getMemberById(id);
        model.addAttribute("member",member);
        return "modify";
    }
    //修改
    @RequestMapping("/edit")
    public String update(Member member,Model model){
        int n = memberService.editMember(member);
        if(n>0){
            return "redirect:/getList";//SUCCESS
        }else{
            return "modify";//Failed
        }
    }
    //删除
    @RequestMapping("/del/{id}")
    public String del(@PathVariable("id")Integer id){
        int n = memberService.delMember(id);
        if(n>0){
            return "redirect:/getList";//SUCCESS
        }else{
            return "show";
        }
    }
}
