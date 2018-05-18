package org.tean8.blog.service;

import org.tean8.blog.bean.Blog;
import org.tean8.blog.bean.Type;
import org.tean8.blog.bean.TypeVo;
import org.tean8.blog.dao.IDeleteDao;
import org.tean8.blog.dao.IInsertDao;
import org.tean8.blog.dao.IQueryDao;
import org.tean8.blog.dao.IUpdateDao;
import org.tean8.blog.util.JdbcUtils;

import java.util.ArrayList;
import java.util.List;

public class TypeServiceImpl implements ITypeService {


    @Override
    public List<Type> _getChildType(int parentId) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Type> types = mapper._selectChildType(parentId);
        JdbcUtils.release();
        return types;
    }

    @Override
    public List<Type> getChildType(int parentId) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Type> types = mapper.selectChildType(parentId);
        JdbcUtils.release();
        return types;
    }

    @Override
    public boolean addParentType(Type type) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.isnertParentType(type);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public List<Type> getParentType() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Type> types = mapper.selectAllParentType();
        JdbcUtils.release();
        return types;
    }

    @Override
    public Type getParentTypeByChildType(int typeId) {
        return null;
    }

    @Override
    public List<Type> getTypeListByBlogId(Blog blog) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Type> result=new ArrayList<>();
        Type type = mapper.selectParentType(blog.getTypeId());

        Type childType = mapper.selectType(blog.getTypeId());
        result.add(type);
        result.add(childType);
        return result;
    }

    /**
     * 获得主页的Type
     * @return
     */
    @Override
    public List<TypeVo> selectTypeVo() {
        List<TypeVo> typeVos = JdbcUtils.getMapper(IQueryDao.class).selectTypeVo();
        JdbcUtils.release();
        return typeVos;
    }

    @Override
    public boolean addType(Type type) {
        IInsertDao mapper = JdbcUtils.getMapper(IInsertDao.class);
        mapper.insertType(type);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public boolean deleteType(int id) {
        IDeleteDao mapper = JdbcUtils.getMapper(IDeleteDao.class);
        mapper.deleteType(id);
        JdbcUtils.commitAndClose();
        return true;
    }

    @Override
    public List<Type> selectAllType() {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        List<Type> types = mapper.selectAllType();
        JdbcUtils.release();
        return types;
    }

    @Override
    public Type getType(int id) {
        IQueryDao mapper = JdbcUtils.getMapper(IQueryDao.class);
        Type type = mapper.selectType(id);
        JdbcUtils.release();
        return type;
    }
}
