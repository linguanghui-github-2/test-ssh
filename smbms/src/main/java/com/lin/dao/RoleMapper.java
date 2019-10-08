package com.lin.dao;

import com.lin.pojo.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleMapper {
    @Select("select * from smbms_role")
    public List<Role> findRoleList();
}
