package org.tean8.blog.service;

import org.tean8.blog.bean.BlogTag;
import org.tean8.blog.bean.Tag;

import java.util.List;

public interface ITagService {

    boolean addBlogTag(BlogTag blogTag);

    /**
     * 添加标签
     * @param tag
     * @return
     */
    boolean addTag(Tag tag);

    /**
     * 删除标签
     * @param id
     * @return
     */
    boolean deleteTag(int id);

    /**
     * 获得所有标签
     * @return
     */
    List<Tag> selectAllTag();

    /**
     * 获得指定博客的标签列表
     * @param blogId
     * @return
     */
    List<Tag> selectBlogTag(int blogId);

    /**
     * 修改标签
     * @param tag
     * @return
     */
    boolean modifyTag(Tag tag);

    /**
     * 根据id获得指定标签
     * @param id
     * @return
     */
    Tag getTag(int id);

}
