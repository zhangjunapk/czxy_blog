package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import org.tean8.blog.bean.Notice;
import org.tean8.blog.service.NoticeServiceImpl;

import java.util.List;

public class NoticeController extends BaseServlet {
    public String addNotice(){
        Notice notice = toBean(Notice.class);
        new NoticeServiceImpl().addNotice(notice);
        return "/NoticeController?method=getAll";
    }
    public String getAll(){
        List<Notice> notices = new NoticeServiceImpl().selectALlNotice();
        getRequest().setAttribute("notice_list",notices);
        return "/admin/notice.jsp";
    }
    public String addNoticePage(){
        List<Notice> notices = new NoticeServiceImpl().selectALlNotice();
        getRequest().setAttribute("notice_list",notices);
        return "/NoticeController?method=getAll";
    }
    public String deleteNotice(){
        int id=Integer.parseInt(getRequest().getParameter("id"));
        new NoticeServiceImpl().deleteNotice(id);
        return "/NoticeController?method=getAll";
    }

}
