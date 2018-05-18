package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.druid.support.spring.stat.annotation.Stat;
import org.tean8.blog.bean.*;
import org.tean8.blog.service.*;
import org.tean8.blog.util.JsonUtil;

import java.io.IOException;
import java.util.Date;
import java.util.List;

public class ArticleController extends BaseServlet {

    public String showAllArticle() {

        getRequest().setAttribute("blog_list", new BlogServiceImpl().getBlogVoAdminList(1));

        return "admin/article.jsp";
    }

    public String getType() {
        getRequest().setAttribute("parent_list", new TypeServiceImpl().getParentType());
        getRequest().setAttribute("type_list", new TypeServiceImpl().selectTypeVo());
        return "admin/category.jsp";
    }

    public String delete() {
        int blogId = Integer.parseInt(getRequest().getParameter("blogId"));
        new BlogServiceImpl().deleteBlog(blogId);
        return "redirect:/ArticleController?method=showAllArticle";
    }

    public String getAllTag() {
        List<Tag> tags = new TagServiceImpl().selectAllTag();
        getRequest().setAttribute("tag_list", tags);
        return "admin/tag.jsp";
    }

    public String showAllUser() {
        List<User> allUser = new UserServiceImpl().getAllUser();
        getRequest().setAttribute("user_list", allUser);
        return "admin/user.jsp";
    }

    public String addType() {
        Type type = new Type();
        type.setParentId(Integer.parseInt(getRequest().getParameter("parentId")));
        type.setTitle(getRequest().getParameter("title"));
        type.setInfo(getRequest().getParameter("info"));
        if (getRequest().getParameter("parentId").equals("-1")) {
            new TypeServiceImpl().addParentType(type);
        } else {
            new TypeServiceImpl().addType(type);
        }


        return "/ArticleController?method=getType";
    }

    public String addTag() {
        Tag tag = toBean(Tag.class);
        new TagServiceImpl().addTag(tag);
        return "/ArticleController?method=getAllTag";
    }

    public String deleteTag() {
        int tagId = Integer.parseInt(getRequest().getParameter("tagId"));
        new TagServiceImpl().deleteTag(tagId);
        return "/ArticleController?method=getAllTag";
    }

    public String batchDeleteArticle() {
        String[] ids = getRequest().getParameterValues("blogId");
        BlogServiceImpl blogService = new BlogServiceImpl();
        for (String id : ids) {
            int i = Integer.parseInt(id);
            blogService.deleteBlog(i);
        }
        return "/ArticleController?method=showAllArticle";
    }

    public String writeArticlePage() {
        getRequest().setAttribute("type_list", new TypeServiceImpl().selectTypeVo());
        getRequest().setAttribute("tag_list", new TagServiceImpl().selectAllTag());
        return "/admin/article_insert.jsp";
    }

    public void getChildType() throws IOException {
        int parentId = Integer.parseInt(getRequest().getParameter("parentId"));
        System.out.println("zzzzzzzz   "+parentId);
        List<Type> childType = new TypeServiceImpl()._getChildType(parentId);
        for(Type type:childType){
            System.out.println(type.getTitle());
        }

        getResponse().getWriter().print(JsonUtil.convertObject(childType));
        System.out.println(JsonUtil.convertObject(childType));

    }


    public String addArticle() {
        //添加博客
        TagServiceImpl tagService=new TagServiceImpl();
        String title = getRequest().getParameter("articleTitle");
        String content = getRequest().getParameter("articleContent");
        String parentType = getRequest().getParameter("articleParentCategoryId");
        String childType = getRequest().getParameter("articleChildCategoryId");

        String[] tagIds = getRequest().getParameterValues("tagId");
        String status = getRequest().getParameter("articleStatus");

        System.out.println(status+"     status------------");

        Blog blog=new Blog();
        if(childType!=null){
            blog.setTypeId(Integer.parseInt(childType));
        }else{
            blog.setTypeId(Integer.parseInt(parentType));
        }
        blog.setTitle(title);
        blog.setContent(content);
        blog.setStatus(Integer.parseInt(status));
        blog.setDate(new Date());
        new BlogServiceImpl().addBlog(blog);
        int lastIndex = new BlogServiceImpl().getLastIndex();
        for(String id:tagIds){
            System.out.println(id+"---------->");
            int i = Integer.parseInt(id);
            BlogTag blogTag=new BlogTag();
            blogTag.setBlogId(lastIndex);
            blogTag.setTagId(i);
            tagService.addBlogTag(blogTag);
        }

        return "ArticleController?method=showAllArticle";
    }

    public void modifyTag() throws IOException {
        Tag tag = toBean(Tag.class);
        System.out.println(tag.getId()+"   _0000000000");
        new TagServiceImpl().modifyTag(tag);
        getResponse().getWriter().print("\"message\":\"成功啦\"");
    }

    public void modifyType() throws IOException {
        Type type = toBean(Type.class);
       new TypeServiceImpl().addType(type);
        getResponse().getWriter().print("\"message\":\"成功啦\"");
    }

    public void modifyUser() throws IOException {
        User user = toBean(User.class);
        new UserServiceImpl().modifyUser(user);
        getResponse().getWriter().print("\"message\":\"成功啦\"");

    }
}
