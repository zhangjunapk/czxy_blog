package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import com.github.pagehelper.PageInfo;
import org.tean8.blog.bean.BlogVo;
import org.tean8.blog.bean.Comment;
import org.tean8.blog.bean.Notice;
import org.tean8.blog.service.*;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Index extends BaseServlet {

    public String uu(){
        getRequest().setAttribute("blog_list",new BlogServiceImpl().getBlogVoByPage(1,10));
        return "uu.jsp";
    }


  /*  static BlogServiceImpl blogService=new BlogServiceImpl();
    static TypeServiceImpl typeService=new TypeServiceImpl();
    static TagServiceImpl tagService=new TagServiceImpl();
    static CommentServiceImpl commentService=new CommentServiceImpl();
*/
    public String index(){
        System.out.println("-->pageNum:"+getRequest().getParameter("pageNum"));


        if(getRequest().getParameter("pageNum")==null) {
            PageInfo<BlogVo> blogVoByPage = new BlogServiceImpl().getBlogVoByPage(1, 10);

            getRequest().setAttribute("blog_list", blogVoByPage);

        }else{
            int pageNum=Integer.parseInt(getRequest().getParameter("pageNum"));
            PageInfo<BlogVo> blogVoByPage = new BlogServiceImpl().getBlogVoByPage(pageNum, 10);
            getRequest().setAttribute("blog_list", blogVoByPage);

        }
        //System.out.println(blogService.selectBlogVoByPage(1).size()+"<-------->");

        getRequest().setAttribute("blog_count",new CountServiceImpl().getBlogCount());
        getRequest().setAttribute("type_count",new CountServiceImpl().getTypeCount());
        getRequest().setAttribute("tag_count",new CountServiceImpl().getTagCount());
        getRequest().setAttribute("read_count",new CountServiceImpl().getReadCount());
        getRequest().setAttribute("time",new SimpleDateFormat("yyyy年MM月dd日 ").format(new Date()).toString());



        getRequest().setAttribute("type_list",new TypeServiceImpl().selectTypeVo());
        getRequest().setAttribute("tag_list",new TagServiceImpl().selectAllTag());
        getRequest().setAttribute("hot_blog_list",new BlogServiceImpl().selectHotBlog(5));
        getRequest().setAttribute("comment_list",new CommentServiceImpl().getNewComment(5));
        System.out.println("123");

        for(Comment comment:new CommentServiceImpl().getNewComment(5)){
            System.out.println("aaaaaaaaaa        "+comment);
        }


        getRequest().setAttribute("pop_blog_list",new BlogServiceImpl().getTopPopCommentBlog(10));

        getRequest().setAttribute("link_list",new LinkServiceImpl().getLink());

        return "front/index.jsp";

    }

    public String searchBlog(){
        String name=getRequest().getParameter("name");
        StringBuilder sb=new StringBuilder("%");
        for(String str:name.split("")){
            sb.append(str).append("%");
        }
        getRequest().setAttribute("tag_list",new TagServiceImpl().selectAllTag());
        getRequest().setAttribute("type_list",new TypeServiceImpl().selectTypeVo());

        getRequest().setAttribute("blog_list",new BlogServiceImpl().getBlogVoByNameAndPage(sb.toString(),1,10));

        getRequest().setAttribute("cz","type");
        getRequest().setAttribute("typeTagId",1);

        getRequest().setAttribute("notice_list",new NoticeServiceImpl().selectALlNotice());



        for(Notice notice:new NoticeServiceImpl().selectALlNotice()){
            System.out.println(notice.getTitle()+" ppppp");
        }

        return "front/type&tag.jsp";
    }


}
