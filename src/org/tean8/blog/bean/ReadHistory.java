package org.tean8.blog.bean;

import java.util.Date;

public class ReadHistory {
    private int id;
    private int blogId;
    private Date date;

    public ReadHistory() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public ReadHistory(int id, int blogId, Date date) {
        this.id = id;
        this.blogId = blogId;
        this.date = date;
    }
}
