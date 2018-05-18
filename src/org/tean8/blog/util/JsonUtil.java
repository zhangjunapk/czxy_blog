package org.tean8.blog.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import java.util.Collection;

public class JsonUtil {
    public static String convertObject(Object object){
        if(object.getClass().isArray()||object instanceof Collection){
            return JSONArray.fromObject(object).toString();
        }
        return JSONObject.fromObject(object).toString();
    }
}
