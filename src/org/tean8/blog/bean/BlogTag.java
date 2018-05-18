package org.tean8.blog.bean;

import java.util.Date;

public class BlogTag {

    private int blogId;
    private int tagId;
    private Date date;

    public BlogTag() {
    }

    public int getBlogId() {
        return blogId;
    }

    public void setBlogId(int blogId) {
        this.blogId = blogId;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public BlogTag(int blogId, int tagId, Date date) {
        this.blogId = blogId;
        this.tagId = tagId;
        this.date = date;
    }
}
