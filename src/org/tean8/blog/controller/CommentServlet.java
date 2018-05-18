package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import org.tean8.blog.bean.Comment;
import org.tean8.blog.service.CommentServiceImpl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class CommentServlet extends BaseServlet {
    /**
     * 遍历所有评论
     * @return
     */

    static CommentServiceImpl commentService = new CommentServiceImpl();

    public String getComment(){
    //获得评论
        List<org.tean8.blog.bean.Comment> Comments = commentService.getAllComment();
    //传入工作域
        getRequest().setAttribute("comment_list" , Comments);
    //重订项
        return "/admin/comment.jsp";
    }

    public String deleteComment(){
        int commentId=Integer.parseInt(getRequest().getParameter("id"));
        new CommentServiceImpl().deleteComment(commentId);
        return "/CommentServlet?method=getComment";
    }

    public String addComment(){
        Comment comment = toBean(Comment.class);
        comment.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        new CommentServiceImpl().addComment(comment);
        return "/index.jsp";
    }


}
