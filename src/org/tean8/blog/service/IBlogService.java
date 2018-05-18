package org.tean8.blog.service;

import com.github.pagehelper.PageInfo;
import org.tean8.blog.bean.Blog;
import org.tean8.blog.bean.BlogVo;
import org.tean8.blog.bean.BlogVoAdmin;
import org.tean8.blog.dao.IQueryDao;

import java.util.List;

public interface IBlogService {


    PageInfo<BlogVo> getBlogVoByTypeAndPage(int typeId,int pageNum,int pageSize);

    PageInfo<BlogVo> getBlogVoByTagAndPage(int tagId,int pageNum,int pageSize);

    PageInfo<BlogVo> getBlogVoByNameAndPage(String name,int pageNum,int pageSize);

    /**
     * 获得分页好的博客列表
     * @param pageNum
     * @param pageCount
     * @return
     */
    PageInfo<BlogVo> getBlogVoByPage(int pageNum,int pageCount);

    boolean addBlog(Blog blog);

    int getLastIndex();



    List<Blog> searchBlog(String name);

    List<Blog> getTopCommentBlogByType(int typeId,int n);


    List<Blog> getTopCommentBlogByTag(int tagId,int n);


    List<Blog> getTopPopCommentBlog(int n);

    List<BlogVoAdmin> getBlogVoAdminList(int pageNum);


    List<Blog> getBlogByType(int typeId);

    List<Blog> getBLogByTag(int tagId);
    /**
     * 根据分类id和当前博客id'来获得下一个
     * @param blogId
     * @param typeId
     * @return
     */
    Blog selectNextBlogByTypeIdAndBlogId(int blogId,int typeId);

    Blog selectLastBlogByTypeIdAndBlogId(int blogId,int typeId);

    Blog selectNextBlogByTagIdAndBlogId(int blogId,int tagId);

    Blog selectLastBlogByTagIdAndBlogId(int blogId,int tagId);


    /**
     * 获得n个最新的指定分类博客列表
     * @param n
     * @return
     */
    List<Blog> getNewBlogByType(int typeId,int n);


    /**
     * 获得n个最新的指定标签的博客列表
     * @param n
     * @return
     */
    List<Blog> getNewBlogByTag(int tagId,int n);




    List<Blog> getAllBlog();

    /**
     * 获得指定数量的按照阅读数量降序的博客列表
     * @param n
     * @return
     */
    List<Blog> selectHotBlog(int n);

    /**
     * 获得指定页码的博客列表
     * @param pageNum
     * @return
     */
    List<Blog> selectBlogByPageNum(int pageNum);

    /**
     * 获得所有博客
     * @return
     */
    List<Blog> selectAllBlog();

    List<BlogVo> selectBlogVoByPage(int pageNum);
    /**
     * 根据类型id和页码来获得博客列表
     * @param typeId
     * @param pageNum
     * @return
     */
    List<Blog> selectBlogByType(int typeId,int pageNum);

    /**
     * 根据标签id和页码来获得博客列表
     * @param tagId
     * @param pageNum
     * @return
     */
    List<Blog> selectBlogByTag(int tagId,int pageNum);

    /**
     * 根据博客id来获得博客
     * @param id
     * @return
     */
    Blog selectBlogById(int id);

    /**
     * 根据id删除博客
     * @param id
     * @return
     */
    boolean deleteBlog(int id);

    /**
     * 修改博客
     * @param blog
     * @return
     */
    boolean modifyBlog(Blog blog);


    /**
     * 主页获得指定页码并封装好的博客列表
     * @param pageNum
     * @return
     */
    List<BlogVo> getBlogVo(int pageNum);

    /**
     * 根据类型和页码获得博客列表
     * @param typeId
     * @param pageNum
     * @return
     */
    List<BlogVo> getBlogVoByType(int typeId,int pageNum);

    /**
     * 根据标签和页码来获得博客列表
     * @param tagId
     * @param pageNum
     * @return
     */
    List<BlogVo> getBlogVoByTag(int tagId,int pageNum);
}
