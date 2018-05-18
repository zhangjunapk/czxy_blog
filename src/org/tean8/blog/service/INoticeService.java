package org.tean8.blog.service;

import org.tean8.blog.bean.Notice;

import java.util.List;

public interface INoticeService {
    boolean addNotice(Notice notice);
    boolean deleteNotice(int id);
    List<Notice> selectALlNotice();
}
