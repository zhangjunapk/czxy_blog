package org.tean8.blog.dao;

import com.sun.org.glassfish.gmbal.ParameterNames;
import com.sun.tracing.dtrace.ProviderAttributes;
import com.sun.tracing.dtrace.StabilityLevel;
import org.apache.ibatis.annotations.*;
import org.tean8.blog.bean.*;

import java.util.List;

public interface IQueryDao {

    @Select("select * from blog where id in(select blog_id from comment group by blog_id order by count(1)) and type_id =#{id} limit #{n}")
    List<Blog> selectHotBlogByType(@Param("id") int typeId,@Param("n") int n);


    @Select("select * from blog where id in(select blog_id from comment group by blog_id order by count(1)) and id in(select blog_id from blog_tag where tag_id=#{id}) limit #{n}")
    List<Blog> selectHotBLogByTag(@Param("id")int tagId,@Param("n")int n);

    @Select("select * from notice")
    List<Notice> selectAllNotice();

    @Select("select * from link")
    List<Link> selectAllLink();

    @Select("select * from user where id=#{id}")
    User selectUserById(@Param("id")int id);

    @Select("select * from blog where status=1 and id in(select blog_id from blog_tag where tag_id =#{tagId})")
    /**
     * private Blog blog;
     *     private String type;
     *     private int viewCount;
     *     private int commentCount;
     */
    @Results({
            @Result(property = "blog",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectBlogById"),column = "id"),
            @Result(property = "type",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectTypeName"),column = "type_id"),
            @Result(property = "viewCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogReadCount"),column = "id"),
            @Result(property = "commentCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogCommentCount"),column = "id")
    })
    List<BlogVo> selectBlogVoShowByTagId(@Param("tagId")int tagId);

    @Select("select * from blog where type_id=#{typeId} or type_id in(select id from type where parent_id=#{typeId})")
    /**
     * private Blog blog;
     *     private String type;
     *     private int viewCount;
     *     private int commentCount;
     */
    @Results({
            @Result(property = "blog",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectBlogById"),column = "id"),
            @Result(property = "type",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectTypeName"),column = "type_id"),
            @Result(property = "viewCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogReadCount"),column = "id"),
            @Result(property = "commentCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogCommentCount"),column = "id")
    })
    List<BlogVo> selectBlogVoShowByType(@Param("typeId")int typeId);



    @Select("select title from type where id=#{id}")
    String selectTypeName(@Param("id")int id);



    @Select("select * from blog where status=1")
    /**
     * private Blog blog;
     *     private String type;
     *     private int viewCount;
     *     private int commentCount;
     */
    @Results({
            @Result(property = "blog",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectBlogById"),column = "id"),
            @Result(property = "type",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectTypeName"),column = "type_id"),
            @Result(property = "viewCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogReadCount"),column = "id"),
            @Result(property = "commentCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogCommentCount"),column = "id")
    })
    List<BlogVo> selectBlogVoShow();


    @Select("select * from blog where status=1 and title like #{name}")
    /**
     * private Blog blog;
     *     private String type;
     *     private int viewCount;
     *     private int commentCount;
     */
    @Results({
            @Result(property = "blog",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectBlogById"),column = "id"),
            @Result(property = "type",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectTypeName"),column = "type_id"),
            @Result(property = "viewCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogReadCount"),column = "id"),
            @Result(property = "commentCount",one=@One(select = "org.tean8.blog.dao.IQueryDao.selectBlogCommentCount"),column = "id")
    })
    List<BlogVo> selectBlogVoShowByName(@Param("name")String name);

    @Select("select id from blog order by date limit 1")
    int getLastBlogId();

    @Select("select * from blog where title like #{name}")
    List<Blog> selectBlogByName(@Param("name")String name);


    @Select("select count(1) from blog_tag where tag_id=#{tagId}")
    int selectArticleCountByTag(@Param("tagId")int tagId);


    @Select("select type_id from blog where id=#{blogId}")
    int selectTypeIdByBlogId(@Param("blogId")int blogId);

    @Select("select * from blog where id in(select blog_id from comment group by blog_id order by count(1)) limit #{n}")
    List<Blog> selectAllPopBLog(@Param("n")int n);

    @Select("select * from blog where id in(select blog_id from comment group by blog_id order by count(1))")
    List<Blog> selectTopCommentBlogByTypeId();



    @Select("select * from blog where id in(select distinct blog_id from blog_tag where tag_id=#{tagId} order by date desc limit #{n})")
    List<Blog> selectNewBlogByTag(@Param("tagId")int tagId,@Param("n")int n);

    @Select("select * from blog where id in( select blog_id from comment group by blog_id order by count(1) desc) limit #{n}")
    List<Blog> selectTopPopCommentBlogList(@Param("n")int n);

    @Select("select * from comment")
    /**
     * private int id;
     *     private int blogId;
     *     private String content;
     *     private String date;
     *     private String nickname;
     *     private String email;
     *     private String url;
     *     private Blog blog;
     */
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "blogId",column = "blog_id"),
            @Result(property = "id",column = "id"),
            @Result(property = "date",column = "date"),
            @Result(property = "nickname",column = "nickname"),
            @Result(property = "email",column = "email"),
            @Result(property = "url",column = "url"),
            @Result(property = "blog",column = "blog_id",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectBlogById")),
    })
    List<Comment> selectAllComment();

    @Select("select count(1) from blog where type_id=#{typeId}")
    int selectArticleCountByChildTypeId(@Param("typeId")int typeId);

    @Select("select count(1) from blog where type_id in(select id from type where parent_id=#{typeId}) or type_id=#{typeId}")
    int selectArticleCountByParentTypeId(@Param("typeId")int typeId);



    @Select("select * from type where parent_id is null and id=#{typeId}")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "parentId",column = "parent_id"),
            @Result(property = "title",column = "title"),
            @Result(property = "info",column = "info"),
            @Result(property = "articleCount",column = "id",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectArticleCountByParentTypeId")),
    })
    Type selectParentType(@Param("typeId") int typeId);

    @Select("select distinct * from type where blog_id=#{blogId}")
List<Type> selectTypeListByBlogId(@Param("blogId")int blogId);

    // TODO: 2018/5/15
    @Select("select * from blog  where type_id=#{typeId} or type_id in(select parent_id from type where id =#{typeId}) order by date desc limit #{n}")
    List<Blog> selectNewBlogByType(@Param("typeId")int typeId,@Param("n") int n);

    @Select("select * from user")
    List<User> selectAllUser();

    @Select("select * from user where username=#{username} and password=#{password}")
    User selectUserByUsernameAndPassword(@Param("username")String username,@Param("password")String password);

    /**
     * 得到所有博客
     * @return
     */
    @Select("select * from blog")
    List<Blog> selectAllBlog();

    @Select("select * from type where parent_id is null")
    @Results({
            @Result(property = "parentType",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectParentType"),column = "id"),
            @Result(property = "childType",many = @Many(select = "org.tean8.blog.dao.IQueryDao.selectChildType"),column = "id")
    })
    List<TypeVo> selectTypeVo();

    /**
     * 根据分类来获得博客列表
     * @param typeId
     * @return
     */
    @Select("select distinct * from blog where type_id=#{typeId} and status=1")
    List<Blog> selectBlogByType(@Param("typeId")int typeId);

    /**
     * 获得指定标签的博客列表
     * @param tagId
     * @return
     */
    @Select("select distinct * from blog where id in(select blog_id from blog_tag where tag_id =#{tagId}) and status=1")
    List<Blog> selectBlogByTag(@Param("tagId")int tagId);

    /**
     * 根据id获得分类
     * @param id
     * @return
     */
    @Select("select * from type where id=#{id}")
    Type selectType(@Param("id")int id);



    /**
     * 根据id获得标签
     * @param id
     * @return
     */
    @Select("select * from tag where id=#{id}")
    Tag selectTag(int id);

    /**
     * 获得指定博客id的阅读数量
     * @param id
     * @return
     */
    @Select("select count(1) from read_history where blog_id=#{id}")
    int selectBlogReadCount(@Param("id")int id);

    /**
     * 获得指定博客的评论数量
     * @param id
     * @return
     */
    @Select("select count(1) from comment where blog_id=#{id}")
    int selectBlogCommentCount(@Param("id")int id);

    /**
     * 获得所有博客
     * @return
     */
    @Select("select * from blog where status=1")
    /**
     *  private int id;
     *     private String title;
     *     private String content;
     *     private Date date;
     *     private int typeId;
     *     private String picLink;
     *     private int status;
     *     private int commentCount;
     */
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "title",column = "title"),
            @Result(property = "content",column = "content"),
            @Result(property = "date",column = "date"),
            @Result(property = "typeId",column = "type_id"),
            @Result(property = "picLink",column = "pic_link"),
            @Result(property = "status",column = "status"),
            @Result(property = "commentCount",column = "id",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectBlogCommentCount")),
    })
    List<Blog> selectAllBlogShow();

    /**
     * 根据id获得博客
     * @param id
     * @return
     */
    @Select("select * from blog where id=#{id}")
    Blog selectBlogById(@Param("id") int id);

    /**
     * 获得所有分类
     * @return
     */
    @Select("select * from type")
    List<Type> selectAllType();

    /**
     * 获得所有标签
     * @return
     */
    @Select("select * from tag")
    /**
     *  private int id;
     *     private String title;
     *     private String info;
     *     private String status;
     *     private int articleCount;
     */
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "title",column = "title"),
            @Result(property = "info",column = "info"),
            @Result(property = "status",column = "status"),
            @Result(property = "articleCount",column = "id",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectArticleCountByTag")),
    })
    List<Tag> selectAllTag();

    /**
     * 获得所有父分类
     * @return
     */
    @Select("select * from type where parent_id is null")
    List<Type> selectAllParentType();

    /**
     * 根据父分类id获得子分类
     * @param parentId
     * @return
     */
    @Select("select * from type where parent_id=#{id}")
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "parentId",column = "parent_id"),
            @Result(property = "title",column = "title"),
            @Result(property = "info",column = "info"),
            @Result(property = "articleCount",column = "id",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectArticleCountByChildTypeId")),
    })
    List<Type> selectChildType(@Param("id")int parentId);


    @Select("select * from type where parent_id=#{parentId}")
    List<Type> _selectChildType(@Param("parentId")int parentId);
    /**
     * 获得最新的指定数量的评论列表
     * @param n
     * @return
     */
    @Select("select * from comment order by date desc limit #{n}")
    /**
     *  private int id;
     *     private int blogId;
     *     private String content;
     *     private String date;
     *     private int typeId;
     */
    @Results({
            @Result(property = "id",column = "id"),
            @Result(property = "blogId",column = "blog_id"),
            @Result(property = "content",column = "content"),
            @Result(property = "date",column = "date"),
            @Result(property = "typeId",column = "blog_id",one = @One(select = "org.tean8.blog.dao.IQueryDao.selectTypeIdByBlogId")),
    })
    List<Comment> selectNewComment(@Param("n") int n);

    /**
     * 获得指定博客的评论列表
     * @param id
     * @return
     */
    @Select("select * from comment where blog_id=#{id}")
    List<Comment> selectCommentByBlogId(@Param("id")int id);

    /**
     * 获得指定博客的标签列表
     * @param blogId
     * @return
     */
    @Select("select * from tag where id in(select tag_id from blog_tag where blog_id =#{blogId})")
    List<Tag> selectBlogTag(@Param("blogId") int blogId);

    /**
     * 获得指定博客的分类
     * @param id
     * @return
     */
    @Select("select * from type where id=(select type_id from blog where id=#{id})")
    Type selectBlogType(@Param("id")int id);

    /**
     * 获得博客数量
     * @return
     */
    @Select("select count(1) from blog where status=1")
    int blogCount();

    @Select("select count(1) from tag")
    int tagCount();

    @Select("select count(1) from type")
    int typeCount();

    @Select("select count(1) from read_history")
    int readCount();
}
