package org.tean8.blog.service;

import org.tean8.blog.bean.ReadHistory;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.dao.IUpdateDao;
import org.tean8.blog.util.JdbcUtils;

public class ReadHistoryImpl implements IReadHistoryService {



    @Override
    public boolean addReadHistory(ReadHistory readHistory) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertReadHistory(readHistory);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public int getReadCount(int blogId){
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        int i = mapper.selectBlogReadCount(blogId);
        JdbcUtils.release();
        return i;
    }
}
