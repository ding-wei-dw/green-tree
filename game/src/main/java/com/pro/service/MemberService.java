package com.pro.service;

import com.pro.pojo.Member;
import com.pro.pojo.PageBean;

import java.util.List;

public interface MemberService {
    //查询所有
    public List<Member> getList();
    //根据id查询对象
    public Member getMemberById(Integer id);
    //根据id进行修改对象
    public  int editMember(Member member);
    //删除
    public int delMember(Integer id);
    //增加
    public int addMember(Member member);
    //根据姓名模糊查询
    public List<Member> getListByName(String mname);
    //分页查询
    public PageBean<Member> findByPage(int currentPage);
}
