package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import com.github.pagehelper.PageInfo;
import org.tean8.blog.bean.Blog;
import org.tean8.blog.bean.BlogVo;
import org.tean8.blog.bean.Tag;
import org.tean8.blog.bean.Type;
import org.tean8.blog.service.BlogServiceImpl;
import org.tean8.blog.service.CountServiceImpl;
import org.tean8.blog.service.TagServiceImpl;
import org.tean8.blog.service.TypeServiceImpl;

import java.io.IOException;
import java.util.List;


public class TypeTagServlet extends BaseServlet {
    private TypeServiceImpl typeServiceImpl= new TypeServiceImpl();
    static BlogServiceImpl blogService=new BlogServiceImpl();
    private PageInfo<BlogVo> blogVoList;

    public String show() {
//写一个方法 获得一个叫做method的字段,还有一个id字段

        String pageNum=getRequest().getParameter("pageNum");


        /**
         * /TypeTagServlet?method=showTypeTag&cz=tag&id=2
         */

        //获得操作
        String cz=getRequest().getParameter("cz");

        //获得id
        Integer id =Integer.parseInt(getRequest().getParameter("typeTagId")) ;
        //int id=Integer.parseInt()
        //如果method字段内容是 "type" 那就从后台根据接受的id来查询使用了这个分类的所有博客列表

        if (cz.equals("type")){
            if(pageNum!=null){
                blogVoList=new BlogServiceImpl().getBlogVoByTypeAndPage(id,Integer.parseInt(pageNum),10);
                getRequest().setAttribute("hot_blog_list",new BlogServiceImpl().getTopCommentBlogByType(id,5));

            }else{

                blogVoList=new BlogServiceImpl().getBlogVoByTypeAndPage(id,Integer.parseInt(pageNum),10);
                getRequest().setAttribute("hot_blog_list",new BlogServiceImpl().getTopCommentBlogByType(id,5));

            }



        }else{
            if(pageNum!=null){

                getRequest().setAttribute("hot_blog_list", new BlogServiceImpl().getTopCommentBlogByType(id, 5));
                //如果method字段内容是 "tag" 那就从后台根据接受的id来查询使用了这个标签所有博客列表
                blogVoList = new BlogServiceImpl().getBlogVoByTagAndPage(id, Integer.parseInt(pageNum), 10);
            }else {
                getRequest().setAttribute("hot_blog_list", new BlogServiceImpl().getTopCommentBlogByType(id, 5));
                //如果method字段内容是 "tag" 那就从后台根据接受的id来查询使用了这个标签所有博客列表
                blogVoList = new BlogServiceImpl().getBlogVoByTagAndPage(id, 1, 10);
            }}
            this.getRequest().setAttribute("blog_list",blogVoList);

            getRequest().setAttribute("tag_list",new TagServiceImpl().selectAllTag());
        getRequest().setAttribute("type_list",new TypeServiceImpl().selectTypeVo());



        return "front/type&tag.jsp";
    }

    public void findAllTag() throws IOException {
        TagServiceImpl tagService = new TagServiceImpl();
        List<Tag> tagList = tagService.selectAllTag();
        getResponse().getWriter().print(tagList);
    }



}
