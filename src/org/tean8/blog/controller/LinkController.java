package org.tean8.blog.controller;

import cn.itcast.servlet.BaseServlet;
import org.tean8.blog.bean.Link;
import org.tean8.blog.service.LinkServiceImpl;

import java.util.List;

public class LinkController extends BaseServlet {

    public String insertLink(){
        Link link = toBean(Link.class);
        new LinkServiceImpl().addLink(link);
        return "/LinkController?method=getAll";
    }
    public String getAll(){
        List<Link> link = new LinkServiceImpl().getLink();
        getRequest().setAttribute("link_list",link);
        return "/admin/link.jsp";
    }

    public String deleteLink(){
        int id=Integer.parseInt(getRequest().getParameter("id"));
        new LinkServiceImpl().deleteLink(id);
        return "redirect:/LinkController?method=getAll";
    }

    public String addLinkPage(){
        List<Link> link = new LinkServiceImpl().getLink();
        getRequest().setAttribute("link_list",link);
        return "/admin/link_insert.jsp";
    }
}
