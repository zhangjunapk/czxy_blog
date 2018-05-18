package org.tean8.blog.bean;

import java.util.Date;
import java.util.List;

public class BlogVoAdmin{
    private Blog blog;
    private List<Type> types;
    private List<Tag> tags;

    public BlogVoAdmin() {
    }

    public Blog getBlog() {
        return blog;
    }

    public void setBlog(Blog blog) {
        this.blog = blog;
    }

    public List<Type> getTypes() {
        return types;
    }

    public void setTypes(List<Type> types) {
        this.types = types;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public BlogVoAdmin(Blog blog, List<Type> types, List<Tag> tags) {
        this.blog = blog;
        this.types = types;
        this.tags = tags;
    }
}
