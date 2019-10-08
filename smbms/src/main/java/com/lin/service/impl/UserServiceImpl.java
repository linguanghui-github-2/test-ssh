package com.lin.service.impl;

import com.lin.dao.UserMapper;
import com.lin.pojo.User;
import com.lin.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class UserServiceImpl implements UserService {
    @Resource
    UserMapper userMapper;
    @Override
    public List<User> findUserByUserName(User user,int page,int rows) throws Exception {
        return userMapper.findUserByUserName(user);
    }

    @Override
    public int addUser(User user) throws Exception{
        return userMapper.addUser(user);
    }

    @Override
    public int updateUser(User user) throws Exception {
        return userMapper.updateUser(user);
    }

    /**
     * 批量删除的方法
     *
     * @param id
     * @return
     * @throws Exception
     */
    @Override
    public int deleteUserById(String id) throws Exception {
        return userMapper.deleteUserById(id);
    }
}
