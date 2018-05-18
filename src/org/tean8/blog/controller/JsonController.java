package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import com.sun.corba.se.spi.activation.BadServerDefinition;
import org.tean8.blog.bean.Blog;
import org.tean8.blog.bean.Tag;
import org.tean8.blog.bean.Type;
import org.tean8.blog.bean.User;
import org.tean8.blog.service.BlogServiceImpl;
import org.tean8.blog.service.TagServiceImpl;
import org.tean8.blog.service.TypeServiceImpl;
import org.tean8.blog.service.UserServiceImpl;
import org.tean8.blog.util.JsonUtil;

import java.io.IOException;
import java.util.List;

public class JsonController extends BaseServlet {

    TagServiceImpl tagService=new TagServiceImpl();
    TypeServiceImpl typeService=new TypeServiceImpl();
    BlogServiceImpl blogService=new BlogServiceImpl();
    UserServiceImpl userService=new UserServiceImpl();

    public void getTag() throws IOException {
        int tagId=Integer.parseInt(getRequest().getParameter("tagId"));
        Tag tag = tagService.getTag(tagId);
        getResponse().getWriter().print(JsonUtil.convertObject(tag));
    }

    public void getType() throws IOException {
        int typeId=Integer.parseInt(getRequest().getParameter("typeId"));
        Type type = typeService.getType(typeId);
        getResponse().getWriter().print(JsonUtil.convertObject(type));
    }

    public void getBlog() throws IOException {
        int blogId=Integer.parseInt(getRequest().getParameter("blogId"));
        Blog blog = blogService.selectBlogById(blogId);
        getResponse().getWriter().print(JsonUtil.convertObject(blog));
    }

    public void getUser() throws IOException {
        int userId=Integer.parseInt(getRequest().getParameter("userId"));
        User user = userService.getUser(userId);
        getResponse().getWriter().print(JsonUtil.convertObject(user));
    }

    public void getParentType() throws IOException {
        List<Type> parentType = typeService.getParentType();
        getResponse().getWriter().print(JsonUtil.convertObject(parentType));
    }

}
