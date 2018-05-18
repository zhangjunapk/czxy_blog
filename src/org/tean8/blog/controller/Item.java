package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import com.sun.xml.internal.bind.v2.runtime.reflect.Accessor;
import org.tean8.blog.bean.Blog;
import org.tean8.blog.bean.ReadHistory;
import org.tean8.blog.bean.Tag;
import org.tean8.blog.bean.TypeVo;
import org.tean8.blog.service.BlogServiceImpl;
import org.tean8.blog.service.ReadHistoryImpl;
import org.tean8.blog.service.TagServiceImpl;
import org.tean8.blog.service.TypeServiceImpl;

import java.util.Date;
import java.util.List;

public class Item extends BaseServlet {
    static BlogServiceImpl blogService = new BlogServiceImpl();
    static TagServiceImpl tagService = new TagServiceImpl();
    static TypeServiceImpl typeService = new TypeServiceImpl();
    public String getItem(){
        String cz=getRequest().getParameter("cz");
        int typeTagId=Integer.parseInt(getRequest().getParameter("typeTagId"));
        System.out.println("typetagId"+typeTagId);


        // 获得请求中的博客id
        int bolgId = Integer.parseInt(getRequest().getParameter("BlogId"));

        ReadHistory readHistory=new ReadHistory();
        readHistory.setBlogId(bolgId);
        readHistory.setDate(new Date());
        new ReadHistoryImpl().addReadHistory(readHistory);

        // 查询博客
        Blog blog = blogService.selectBlogById(bolgId);
        System.out.println(blog.getId()+blog.getTitle()+blog.getContent());
        List<TypeVo> typeVos = typeService.selectTypeVo();
        // 查询获得所有标签
        List<Tag> tags = tagService.selectAllTag();
        // 将查询到的 博客性息,所有标签,主题 转发到item.jsp页面
        getRequest().setAttribute("blog",blog);
        getRequest().setAttribute("tags",tags);
        getRequest().setAttribute("typeVos",typeVos);


        if (cz.equals("type")){
            getRequest().setAttribute("hot_blog_list_center",new BlogServiceImpl().getTopCommentBlogByType(typeTagId,5));

            getRequest().setAttribute("last_blog",blogService.selectLastBlogByTypeIdAndBlogId(blog.getId(),typeTagId));

            getRequest().setAttribute("next_blog",blogService.selectNextBlogByTypeIdAndBlogId(blog.getId(),typeTagId));


            getRequest().setAttribute("new_blog",blogService.getNewBlogByType(typeTagId,5));

            getRequest().setAttribute("hot_blog_list",blogService.selectHotBlog(5));

        }else{
            getRequest().setAttribute("hot_blog_list_center",new BlogServiceImpl().getTopCommentBlogByTag(typeTagId,5));

            getRequest().setAttribute("last_blog",blogService.selectLastBlogByTagIdAndBlogId(blog.getId(),typeTagId));

            getRequest().setAttribute("next_blog",blogService.selectNextBlogByTagIdAndBlogId(blog.getId(),typeTagId));


            getRequest().setAttribute("new_blog",blogService.getNewBlogByTag(typeTagId,5));


            getRequest().setAttribute("hot_blog_list",blogService.selectHotBlog(5));

        }

        getRequest().setAttribute("typeTagId",typeTagId);
        getRequest().setAttribute("cz",cz);


        return "front/item.jsp";
    }

}
