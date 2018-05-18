package org.tean8.blog.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.executor.ReuseExecutor;
import org.tean8.blog.bean.Blog;
import org.tean8.blog.bean.BlogVo;
import org.tean8.blog.bean.BlogVoAdmin;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.dao.IUpdateDao;
import org.tean8.blog.util.JdbcUtils;

import java.util.ArrayList;
import java.util.List;

public class BlogServiceImpl implements IBlogService {
    TagServiceImpl tagService=new TagServiceImpl();
    TypeServiceImpl typeService=new TypeServiceImpl();

    public int getPageCount(List<BlogVo> list){
        System.out.println("list size:"+list.size());
        return list.size()/10;
    }

    @Override
    public PageInfo<BlogVo> getBlogVoByTypeAndPage(int typeId, int pageNum, int pageSize) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        PageHelper.startPage(pageNum,pageSize);
        List<BlogVo> blogVos = mapper.selectBlogVoShowByType(typeId);
        JdbcUtils.release();
        return new PageInfo<>(blogVos);
    }

    @Override
    public PageInfo<BlogVo> getBlogVoByTagAndPage(int tagId, int pageNum, int pageSize) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        PageHelper.startPage(pageNum,pageSize);
        List<BlogVo> blogVos = mapper.selectBlogVoShowByTagId(tagId);
        JdbcUtils.release();
        return new PageInfo<>(blogVos);
    }

    @Override
    public PageInfo<BlogVo> getBlogVoByNameAndPage(String name, int pageNum, int pageSize) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        PageHelper.startPage(pageNum,pageSize);
        List<BlogVo> blogVos = mapper.selectBlogVoShowByName(name);
        JdbcUtils.release();
        return new PageInfo<>(blogVos);
    }

    @Override
    public PageInfo<BlogVo> getBlogVoByPage(int pageNum, int pageCount) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        PageHelper.startPage(pageNum,pageCount);
        List<BlogVo> blogs = mapper.selectBlogVoShow();
        return new PageInfo<>(blogs);
    }

    @Override
    public boolean addBlog(Blog blog) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertBlog(blog);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public int getLastIndex() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        int lastBlogId = mapper.getLastBlogId();
        JdbcUtils.release();
        return lastBlogId;
    }

    @Override
    public List<Blog> searchBlog(String name) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectBlogByName(name);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> getTopCommentBlogByType(int typeId, int n) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectHotBlogByType(typeId, n);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> getTopCommentBlogByTag(int tagId, int n) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectHotBLogByTag(tagId, n);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> getTopPopCommentBlog(int n) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectTopPopCommentBlogList(10);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<BlogVoAdmin> getBlogVoAdminList(int pageNum) {
        List<BlogVoAdmin> result=new ArrayList<>();
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        PageHelper.startPage(pageNum,15);
        List<Blog> blogs = mapper.selectAllBlog();
        for(Blog blog:blogs){
            BlogVoAdmin blogVoAdmin=new BlogVoAdmin();
            blogVoAdmin.setBlog(blog);
            blogVoAdmin.setTags(tagService.selectBlogTag(blog.getId()));
            blogVoAdmin.setTypes(typeService.getTypeListByBlogId(blog));
            result.add(blogVoAdmin);
        }

        return result;
    }

    @Override
    public List<Blog> getBlogByType(int typeId) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectBlogByType(typeId);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> getBLogByTag(int tagId) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectBlogByTag(tagId);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public Blog selectNextBlogByTypeIdAndBlogId(int blogId, int typeId) {

        List<Blog> blogByType = getBlogByType(typeId);
        for(int i=0;i<blogByType.size();i++){
            if(blogByType.get(i).getId()==blogId){
                if(i==blogByType.size()-1){
                    return blogByType.get(0);
                }else{
                    return blogByType.get(i+1);
                }
            }
        }
        return null;
    }

    @Override
    public Blog selectLastBlogByTypeIdAndBlogId(int blogId, int typeId) {

        List<Blog> blogByType = getBlogByType(typeId);
        for(int i=0;i<blogByType.size();i++){
            if(blogByType.get(i).getId()==blogId){
                if(i==0){
                    return blogByType.get(blogByType.size()-1);
                }else{
                    return blogByType.get(i-1);
                }
            }
        }
        return null;
    }

    @Override
    public Blog selectNextBlogByTagIdAndBlogId(int blogId, int tagId) {
        List<Blog> blogByType = getBLogByTag(tagId);
        for(int i=0;i<blogByType.size();i++){
            if(blogByType.get(i).getId()==blogId){
                if(i==blogByType.size()-1){
                    return blogByType.get(0);
                }else{
                    return blogByType.get(i+1);
                }
            }
        }
        return null;    }

    @Override
    public Blog selectLastBlogByTagIdAndBlogId(int blogId, int tagId) {

        List<Blog> blogByType = getBLogByTag(tagId);
        for(int i=0;i<blogByType.size();i++){
            if(blogByType.get(i).getId()==blogId){
                if(i==0){
                    return blogByType.get(blogByType.size()-1);
                }else{
                    return blogByType.get(i-1);
                }
            }
        }
        return null;
    }

    @Override
    public List<Blog> getNewBlogByType(int typeId,int n) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectNewBlogByType(typeId,n);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> getNewBlogByTag(int tagId,int n) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectNewBlogByTag(tagId, n);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> getAllBlog() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectAllBlog();
        JdbcUtils.release();
        return blogs;
    }

    /**
     * 获得指定数量的按照阅读数量降序排列的博客列表
     * @param n
     * @return
     */
    @Override
    public List<Blog> selectHotBlog(int n) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectAllPopBLog(n);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> selectBlogByPageNum(int pageNum) {
        PageHelper.startPage(pageNum,9);
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectAllBlogShow();
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> selectAllBlog() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Blog> blogs = mapper.selectAllBlogShow();
        JdbcUtils.release();
        return blogs;
    }
/*
    *//**
     * 主页 获得指定页码的博客列表
     * @param pageNum
     * @return
     */
    @Override
    public List<BlogVo> selectBlogVoByPage(int pageNum) {
        List<BlogVo> result=new ArrayList<>();
        for(Blog blog:selectBlogByPageNum(pageNum)){
            result.add(getBlogVo(blog));
        }
        return result;
    }


    @Override
    public List<Blog> selectBlogByType(int typeId, int pageNum) {
        PageHelper.startPage(pageNum,50);
        List<Blog> blogs = JdbcUtils.getMapper(IQueryDao.class).selectBlogByType(typeId);
        JdbcUtils.release();
        return blogs;
    }

    @Override
    public List<Blog> selectBlogByTag(int tagId, int pageNum) {
        PageHelper.startPage(pageNum,50);
        List<Blog> blogs = JdbcUtils.getMapper(IQueryDao.class).selectBlogByTag(tagId);
        JdbcUtils.release();
        return blogs;

    }

    /**
     * 根据博客ID获得博客
     * @param id
     * @return
     */
    @Override
    public Blog selectBlogById(int id) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        Blog blog = mapper.selectBlogById(id);
        JdbcUtils.release();
        return blog;
    }

    /**
     * 删除博客
     * @param id
     * @return
     */
    @Override
    public boolean deleteBlog(int id) {
        IDeleteDao mapper = JdbcUtils.getMapper(IDeleteDao.class);
        mapper.deleteBlog(id);
        JdbcUtils.commitAndClose();
        return true;
    }

    /**
     * 修改博客
     * @param blog
     * @return
     */
    @Override
    public boolean modifyBlog(Blog blog) {
        IUpdateDao mapper = JdbcUtils.getMapper(IUpdateDao.class);
        mapper.updateBlog(blog);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public List<BlogVo> getBlogVo(int pageNum) {
        return null;
    }

    @Override
    public List<BlogVo> getBlogVoByType(int typeId, int pageNum) {
        List<BlogVo> result=new ArrayList<>();
        for(Blog blog:selectBlogByType(typeId,pageNum)){
            result.add(getBlogVo(blog));
        }
        return result;
    }

    @Override
    public List<BlogVo> getBlogVoByTag(int tagId, int pageNum) {
        List<BlogVo> result=new ArrayList<>();
        for(Blog blog:selectBlogByTag(tagId,pageNum)){
            result.add(getBlogVo(blog));
        }
        return result;
    }

    /**
     * 根据Blog获得bogvo
     * @param blog
     * @return
     */
    private BlogVo getBlogVo(Blog blog){
        BlogVo blogVo=new BlogVo();
        blogVo.setBlog(blog);
        blogVo.setType(new TypeServiceImpl().getType(blog.getTypeId())!=null?new TypeServiceImpl().getType(blog.getTypeId()).getTitle():"");
        blogVo.setViewCount(new ReadHistoryImpl().getReadCount(blog.getId()));
        blogVo.setCommentCount(new CommentServiceImpl().getCommentCount(blog.getId()));
        return blogVo;
    }
}
