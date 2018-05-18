package org.tean8.blog.service;

import org.tean8.blog.bean.ReadHistory;

public interface IReadHistoryService {

    /**
     * 添加阅读记录
     * @param readHistory
     * @return
     */
    boolean addReadHistory(ReadHistory readHistory);

    /**
     * 获得指定博客id的阅读数量
     * @param blogId
     * @return
     */
    int getReadCount(int blogId);


}
