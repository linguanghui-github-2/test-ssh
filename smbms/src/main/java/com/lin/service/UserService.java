package com.lin.service;

import com.lin.pojo.User;

import java.util.List;

public interface UserService {
    public List<User> findUserByUserName(User user,int page,int rows)throws Exception;

    int addUser(User user)throws Exception;

    int updateUser(User user)throws Exception;
    /**
     * 批量删除的方法
     * @param id
     * @return
     * @throws Exception
     */
    public int deleteUserById(String id)throws Exception;
}
