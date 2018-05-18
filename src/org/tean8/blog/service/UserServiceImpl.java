package org.tean8.blog.service;

import org.tean8.blog.bean.User;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.dao.IUpdateDao;
import org.tean8.blog.util.JdbcUtils;
import org.tean8.blog.util.JsonUtil;

import java.util.List;

public class UserServiceImpl implements IUserService {

    @Override
    public User getUser(int userId) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        User user = mapper.selectUserById(userId);
        JdbcUtils.release();
        return user;
    }

    @Override
    public List<User> getAllUser() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<User> users = mapper.selectAllUser();
        JdbcUtils.release();
        return users;
    }

    @Override
    public User checkUser(String username, String password) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        User user = mapper.selectUserByUsernameAndPassword(username, password);
        if(user!=null){
            return user;
        }
        return null;
    }

    @Override
    public boolean addUser(User user) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertUser(user);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean modifyUser(User user) {

        IUpdateDao mapper = JdbcUtils.getMapper(IUpdateDao.class);
        mapper.updateUser(user);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean deleteUser(int id) {
        IDeleteDao mapper = JdbcUtils.getMapper(IDeleteDao.class);
        mapper.deleteUser(id);
        JdbcUtils.commitAndClose();
        return true;
    }
}
