package org.tean8.blog;

import com.github.pagehelper.PageInfo;
import org.tean8.blog.bean.BlogVo;
import org.tean8.blog.bean.Tag;
import org.tean8.blog.bean.Type;
import org.tean8.blog.bean.TypeVo;
import org.tean8.blog.controller.ArticleController;
import org.tean8.blog.controller.JsonController;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.service.BlogServiceImpl;
import org.tean8.blog.service.TagServiceImpl;
import org.tean8.blog.service.TypeServiceImpl;
import org.tean8.blog.util.JdbcUtils;

import java.io.FileOutputStream;
import java.io.IOException;

public class Content {
    public static void main(String[] args) throws IOException {

        new ArticleController().modifyUser();
        new JsonController().getParentType();

        PageInfo<BlogVo> blogVoByPage = new BlogServiceImpl().getBlogVoByPage(1, 2);
        for (BlogVo blogVo : blogVoByPage.getList()) {
            System.out.println(blogVo.getBlog().getTitle());
        }
        System.out.println("------------");
        System.out.println("第"+blogVoByPage.getPageNum()+"页"+"共"+blogVoByPage.getPages()+"页");


    }
}
