package org.tean8.blog.bean;

public class Comment {
    private int id;
    private int blogId;
    private String content;
    private String date;
    private String nickname;
    private String email;
    private String url;
    private Blog blog;
    private int typeId;

    public int getTypeId() {
        return typeId;
    }

    public void setTypeId(int typeId) {
        this.typeId = typeId;
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Comment() {
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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Comment(int id, int blogId, String content) {
        this.id = id;
        this.blogId = blogId;
        this.content = content;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", blogId=" + blogId +
                ", content='" + content + '\'' +
                ", date='" + date + '\'' +
                ", nickname='" + nickname + '\'' +
                ", email='" + email + '\'' +
                ", url='" + url + '\'' +
                ", blog=" + blog +
                '}';
    }
}
