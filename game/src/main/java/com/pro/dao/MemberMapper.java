package com.pro.dao;

import com.pro.pojo.Member;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface MemberMapper {
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
    public List<Member> getListByName(@Param("mname") String mname);
    //分页查询
    public List<Member> findByPage(Map<String,Object> map);
    //查询总数
    public int selectCount();
}
