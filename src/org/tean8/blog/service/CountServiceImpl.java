package org.tean8.blog.service;

import jdk.nashorn.internal.scripts.JD;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.util.JdbcUtils;

public class CountServiceImpl implements ICountService {

    private IQueryDao queryDao=JdbcUtils.getMapper(IQueryDao.class);

    @Override
    public int getBlogCount() {
        int i = queryDao.blogCount();
        JdbcUtils.release();
        return i;
    }

    @Override
    public int getTypeCount() {
        int i = queryDao.typeCount();
        JdbcUtils.release();
        return i;
    }

    @Override
    public int getTagCount() {
        int i = queryDao.tagCount();
        JdbcUtils.release();
        return i;
    }

    @Override
    public int getReadCount() {
        int i = queryDao.readCount();
        JdbcUtils.release();
        return i;
    }
}
