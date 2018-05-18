package org.tean8.blog.service;

import org.apache.ibatis.annotations.Insert;
import org.tean8.blog.bean.Comment;

import java.util.List;

public interface ICommentService {

    List<Comment> getAllComment();


    /**
     * 获得指定博客的评论数量
     * @param blogId
     * @return
     */
    int getCommentCount(int blogId);


    /**
     * 添加评论
     * @param comment
     * @return
     */
    boolean addComment(Comment comment);

    /**
     * 删除评论
     * @param id
     * @return
     */
    boolean deleteComment(int id);

    /**
     * 通过博客id获得评论列表
     * @param blogId
     * @return
     */
    List<Comment> getCommentByBlogId(int blogId);

    /**
     * 获得最新的指定数量的评论列表
     * @param n
     * @return
     */
    List<Comment> getNewComment(int n);
}
