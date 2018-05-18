package org.tean8.blog.service;

import org.apache.ibatis.executor.keygen.Jdbc3KeyGenerator;
import org.tean8.blog.bean.Link;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.dao.IUpdateDao;
import org.tean8.blog.util.JdbcUtils;

import java.util.Date;
import java.util.List;

public class LinkServiceImpl implements ILinkService {
    @Override
    public boolean addLink(Link link) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        link.setDate(new Date());
        mapper.insertLink(link);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean deleteLink(int id) {
        IDeleteDao mapper = JdbcUtils.getMapper(IDeleteDao.class);
        mapper.deleteLink(id);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public List<Link> getLink() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Link> links = mapper.selectAllLink();
        JdbcUtils.release();
        return links;
    }

    @Override
    public boolean modifyLink(Link link) {
        IUpdateDao mapper = JdbcUtils.getMapper(IUpdateDao.class);
        mapper.updateLink(link);
        JdbcUtils.commitAndClose();
        return true;
    }
}
