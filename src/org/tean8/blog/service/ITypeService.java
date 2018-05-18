package org.tean8.blog.service;

import org.tean8.blog.bean.Blog;
import org.tean8.blog.bean.Type;
import org.tean8.blog.bean.TypeVo;

import java.util.List;

public interface ITypeService {

    List<Type> _getChildType(int parentId);

    List<Type> getChildType(int parentId);

    boolean addParentType(Type type);

    List<Type> getParentType();

    Type getParentTypeByChildType(int typeId);

    List<Type> getTypeListByBlogId(Blog blog);

    /**
     * 获得主页的topvo
     * @return
     */
    List<TypeVo> selectTypeVo();

    /**
     * 添加分类
     * @param type
     * @return
     */
    boolean addType(Type type);

    /**
     * 删除分类
     * @param id
     * @return
     */
    boolean deleteType(int id);

    /**
     * 获得所有分类
     * @return
     */
    List<Type> selectAllType();

    /**
     * 根据id获得分类
     * @param id
     * @return
     */
    Type getType(int id);
}
