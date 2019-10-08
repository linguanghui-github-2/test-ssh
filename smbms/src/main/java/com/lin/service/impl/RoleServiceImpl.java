package com.lin.service.impl;

import com.lin.dao.RoleMapper;
import com.lin.pojo.Role;
import com.lin.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {
    @Resource
    RoleMapper roleMapper;
    @Override
    public List<Role> findRoleList() {
        return roleMapper.findRoleList();
    }
}
