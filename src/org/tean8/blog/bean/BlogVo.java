package org.tean8.blog.bean;

public class BlogVo {
    private Blog blog;
    private String type;
    private int viewCount;
    private int commentCount;

    public BlogVo() {
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    public int getCommentCount() {
        return commentCount;
    }

    public void setCommentCount(int commentCount) {
        this.commentCount = commentCount;
    }

    public BlogVo(Blog blog, String type, int viewCount, int commentCount) {
        this.blog = blog;
        this.type = type;
        this.viewCount = viewCount;
        this.commentCount = commentCount;
    }
}
