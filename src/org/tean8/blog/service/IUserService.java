package org.tean8.blog.service;

import org.apache.ibatis.annotations.Select;
import org.tean8.blog.bean.User;

import java.util.List;

public interface IUserService {

    User getUser(int uerId);

    /**
     * 获得所有用户
     * @return
     */
    List<User> getAllUser();

    /**
     * 用户登录检测
     * @param username
     * @param password
     * @return
     */
    User checkUser(String username,String password);

    /**
     * 添加用户
     * @param user
     * @return
     */
    boolean addUser(User user);

    /**
     * 修改用户
     * @param user
     * @return
     */
    boolean modifyUser(User user);

    /**
     * 删除指定id的用户
     * @param id
     * @return
     */
    boolean deleteUser(int id);

}
