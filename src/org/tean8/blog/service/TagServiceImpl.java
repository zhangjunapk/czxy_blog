package org.tean8.blog.service;

import org.tean8.blog.bean.BlogTag;
import org.tean8.blog.bean.Tag;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.dao.IUpdateDao;
import org.tean8.blog.util.JdbcUtils;

import java.util.List;


public class TagServiceImpl implements ITagService {


    @Override
    public boolean addBlogTag(BlogTag blogTag) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertBlogTag(blogTag);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean addTag(Tag tag) {

        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertTag(tag);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean deleteTag(int id) {
        IDeleteDao mapper = JdbcUtils.getMapper(IDeleteDao.class);
        mapper.deleteTag(id);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public List<Tag> selectAllTag() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Tag> tags = mapper.selectAllTag();
        JdbcUtils.release();
        return tags;
    }

    @Override
    public List<Tag> selectBlogTag(int blogId) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Tag> tags = mapper.selectBlogTag(blogId);

        for(Tag tag:tags){
            System.out.println("------>"+blogId+"       "+tag.getTitle());
        }

        JdbcUtils.release();
        return tags;
    }


    @Override
    public boolean modifyTag(Tag tag) {
        IUpdateDao mapper = JdbcUtils.getMapper(IUpdateDao.class);
        mapper.updateTag(tag);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public Tag getTag(int id) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        Tag tag = mapper.selectTag(id);
        JdbcUtils.release();
        return tag;
    }
}
