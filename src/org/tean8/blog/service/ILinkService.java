package org.tean8.blog.service;

import org.tean8.blog.bean.Link;

import java.util.List;

public interface ILinkService {
    boolean addLink(Link link);
    boolean deleteLink(int id);
    List<Link> getLink();
    boolean modifyLink(Link link);
}
