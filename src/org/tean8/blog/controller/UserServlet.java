package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import org.tean8.blog.bean.User;
import org.tean8.blog.service.UserServiceImpl;

import java.util.List;
import java.util.prefs.BackingStoreException;

public class UserServlet  extends BaseServlet {
    UserServiceImpl userService=new UserServiceImpl();
    public String showAllUser(){
        List<User> allUser = userService.getAllUser();
        getRequest().setAttribute("user_list",allUser);
        return "admin/user.jsp";
    }

    public String addUser(){
        User user = toBean(User.class);
        new UserServiceImpl().addUser(user);
        return "/UserServlet?method=showAllUser";
    }

    public String deleteUser(){
        int userId=Integer.parseInt(getRequest().getParameter("userId"));
        new UserServiceImpl().deleteUser(userId);
        return "/UserServlet?method=showAllUser";
    }
}
