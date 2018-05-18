package org.tean8.blog.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;

public interface IDeleteDao {

    @Delete("delete from notice where id=#{id}")
    boolean deleteNotice(@Param("id")int id);

    @Delete("delete from link where id=#{id}")
    boolean deleteLink(@Param("id") int id);

    @Delete("delete from user where id=#{id}")
    boolean deleteUser(@Param("id")int id);

    @Delete("delete from blog where id=#{id}")
    boolean deleteBlog(@Param("id")int id);

    @Delete("delete from type where id=#{id}")
    boolean deleteType(@Param("id")int id);

    @Delete("delete from tag where id=#{id}")
    boolean deleteTag(@Param("id")int id);

    @Delete("delete from comment where id=#{id}")
    boolean deleteComment(@Param("id")int id);
}
