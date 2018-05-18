package org.tean8.blog.bean;

import java.util.Date;

public class Link {
    private int id;
    private String name;
    private String url;
    private String info;
    private int _order;
    private String lxfs;
    private Date date;

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getLxfs() {
        return lxfs;
    }

    public void setLxfs(String lxfs) {
        this.lxfs = lxfs;
    }

    public Link() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public int get_order() {
        return _order;
    }

    public void set_order(int _order) {
        this._order = _order;
    }

    public Link(int id, String name, String url, String info, int _order) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.info = info;
        this._order = _order;
    }
}
