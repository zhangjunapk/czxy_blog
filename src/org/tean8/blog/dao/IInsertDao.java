package org.tean8.blog.dao;

import org.apache.ibatis.annotations.Insert;
import org.tean8.blog.bean.*;

public interface IInsertDao {

    @Insert("insert into notice(title,content,status,_order) values(#{title},#{content},#{status},#{_order})")
    boolean insertNotice(Notice notice);

    @Insert("insert into link(name,url,info,_order,lxfs,date) values(#{name},#{url},#{info},#{_order},#{lxfs},#{date})")
    boolean insertLink(Link link);

    @Insert("insert into blog(title,content,type_id,pic_link,date,status) values(#{title},#{content},#{typeId},#{picLink},#{date},#{status})")
    boolean insertBlog(Blog blog);

    @Insert("insert into type(parent_id,title,info) values(#{parentId},#{title},#{info})")
    boolean insertType(Type type);

    @Insert("insert into type(title,info) values(#{title},#{info})")
    boolean isnertParentType(Type type);

    @Insert("insert into tag(title,status,info) values(#{title},#{status},#{info})")
    boolean insertTag(Tag tag);

    @Insert("insert into comment(blog_id,content,date) values(#{blogId},#{content},#{date})")
    boolean insertComment(Comment comment);

    @Insert("insert into read_history(blog_id,date) values(#{blogId},#{date})")
    boolean insertReadHistory(ReadHistory readHistory);

    @Insert("insert into blog_tag(blog_id,tag_id,date) values(#{blogId},#{tagId},#{date})")
    boolean insertBlogTag(BlogTag blogTag);


    @Insert("insert into user(username,password,pic_link,nickname,email,status) values(#{username},#{password},#{picLink},#{nickname},#{email},#{status})")
    boolean insertUser(User user);
}
