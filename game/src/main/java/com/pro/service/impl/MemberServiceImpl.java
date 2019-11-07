package com.pro.service.impl;

import com.pro.dao.MemberMapper;
import com.pro.pojo.Member;
import com.pro.pojo.PageBean;
import com.pro.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;
    @Override
    public List<Member> getList() {
        return memberMapper.getList();
    }

    @Override
    public Member getMemberById(Integer id) {
        return memberMapper.getMemberById(id);
    }

    @Override
    public int editMember(Member member) {
        return memberMapper.editMember(member);
    }

    @Override
    public int delMember(Integer id) {
        return memberMapper.delMember(id);
    }

    @Override
    public int addMember(Member member) {
        return memberMapper.addMember(member);
    }

    @Override
    public List<Member> getListByName(String mname) {
        return memberMapper.getListByName(mname);
    }

    @Override
    public PageBean<Member> findByPage(int currentPage) {
        Map<String,Object> map = new HashMap<>();
        PageBean<Member> pageBean = new PageBean<>();
        //封装当前页数
        pageBean.setCurrPage(currentPage);

        //每页显示的数据
        int pageSize=5;
        pageBean.setPageSize(pageSize);

        //封装总记录数
        int totalCount = memberMapper.selectCount();
        pageBean.setTotalCount(totalCount);

        //封装总页数
        double tc = totalCount;
        Double num =Math.ceil(tc/pageSize);//向上取整
        pageBean.setTotalPage(num.intValue());

        map.put("start",(currentPage-1)*pageSize);
        map.put("size", pageBean.getPageSize());
        //封装每页显示的数据
        List<Member> lists = memberMapper.findByPage(map);
        pageBean.setLists(lists);

        return pageBean;

    }
}
