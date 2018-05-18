package org.tean8.blog.service;

import jdk.nashorn.internal.scripts.JD;
import org.tean8.blog.bean.Notice;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.util.JdbcUtils;

import java.util.List;

public class NoticeServiceImpl implements INoticeService {
    @Override
    public boolean addNotice(Notice notice) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertNotice(notice);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean deleteNotice(int id) {
        IDeleteDao mapper = JdbcUtils.getMapper(IDeleteDao.class);
        mapper.deleteNotice(id);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public List<Notice> selectALlNotice() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Notice> notices = mapper.selectAllNotice();
        JdbcUtils.release();
        return notices;
    }
}
