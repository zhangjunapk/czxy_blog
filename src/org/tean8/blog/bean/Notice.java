package org.tean8.blog.bean;

public class Notice {
    private int id;
    private String title;
    private String content;
    private int _order;
    private String status;

    public int get_order() {
        return _order;
    }

    public void set_order(int _order) {
        this._order = _order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Notice() {
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Notice(String title, String content, String status) {
        this.title = title;
        this.content = content;
        this.status = status;
    }
}
