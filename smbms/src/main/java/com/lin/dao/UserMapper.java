package com.lin.dao;

import com.lin.pojo.User;

import java.util.List;

public interface UserMapper {
    public List<User> findUserByUserName(User user)throws Exception;

    int addUser(User user)throws Exception;

    /**
     * 修改用户信息的方法
     * @param user
     * @return
     * @throws Exception
     */
    int updateUser(User user)throws Exception;

    /**
     * 批量删除的方法
     * @param id
     * @return
     * @throws Exception
     */
    public int deleteUserById(String id)throws Exception;
}
