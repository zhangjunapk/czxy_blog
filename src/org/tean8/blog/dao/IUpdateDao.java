package org.tean8.blog.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;
import org.tean8.blog.bean.*;

public interface IUpdateDao {
    @Update("update link set name=#{name},url=#{url},info=#{info},_order=#{order},lxfs=#{lxfs}")
    boolean updateLink(Link link);

    @Update("update blog set title=#{title},content=#{content},type_id=#{typeId},pic_link=#{picLink} where id=#{id}")
    boolean updateBlog(Blog blog);

    @Update("update type set parent_id=#{parentId},title=#{title}")
    boolean updateType(Type type);

    @Update("update tag set title=#{title},info=#{info},status=#{status} where id=#{id}")
    boolean updateTag(Tag tag);

    @Update("update user set nickname=#{nickname},password=#{password},pic_link=#{picLink},email=#{email},status=#{status}")
    boolean updateUser(User user);


}
