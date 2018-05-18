package org.tean8.blog.service;

import org.tean8.blog.bean.Comment;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.dao.IUpdateDao;
import org.tean8.blog.util.JdbcUtils;

import java.util.List;

public class CommentServiceImpl implements ICommentService {


    @Override
    public List<Comment> getAllComment() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Comment> comments = mapper.selectAllComment();
        JdbcUtils.release();
        return comments;
    }

    @Override
    public int getCommentCount(int blogId) {

        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        int i = mapper.selectBlogCommentCount(blogId);
        JdbcUtils.release();
        return i;
    }

    @Override
    public boolean addComment(Comment comment) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertComment(comment);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean deleteComment(int id) {
        IDeleteDao mapper = JdbcUtils.getMapper(IDeleteDao.class);
        mapper.deleteComment(id);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public List<Comment> getCommentByBlogId(int blogId) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Comment> comments = mapper.selectCommentByBlogId(blogId);
        JdbcUtils.release();
        return comments;
    }
    @Override
    public List<Comment> getNewComment(int n) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Comment> comments = mapper.selectNewComment(n);
        JdbcUtils.release();
        return comments;
    }
}
