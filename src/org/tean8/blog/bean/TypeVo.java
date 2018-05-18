package org.tean8.blog.bean;

import java.util.List;

public class TypeVo {

    private Type parentType;
    private List<Type> childType;

    public TypeVo() {
    }

    public Type getParentType() {
        return parentType;
    }

    public void setParentType(Type parentType) {
        this.parentType = parentType;
    }

    public List<Type> getChildType() {
        return childType;
    }

    public void setChildType(List<Type> childType) {
        this.childType = childType;
    }

    public TypeVo(Type parentType, List<Type> childType) {
        this.parentType = parentType;
        this.childType = childType;
    }
}
