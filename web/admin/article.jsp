<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/14
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link rel="shortcut icon" href="/img/logo.png">
    <title>
        风吟博客后台

        - 文章列表
    </title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/back.css">
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <style>
        /*覆盖 layui*/
        .layui-input {
            display: inline-block;
            width: 33.333% !important;
        }

        .layui-input-block {
            margin: 0px 10px;
        }


    </style>
</head>
<body>
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">
            <a href="/admin" style="color:#009688;"> 风吟博客后台 </a>
        </div>
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="/" target="_blank">前台</a></li>
            <li class="layui-nav-item"> <a href="javascript:;">新建</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="article.html/insert">文章</a>
                    </dd>
                    <dd>
                        <a href="page_insert.html">页面</a>
                    </dd>
                    <dd>
                        <a href="article_insert.html/insert">分类</a>
                    </dd>
                    <dd>
                        <a href="tag_insert.html">标签</a>
                    </dd>
                    <dd>
                        <a href="notice.jsp/insert">公告</a>
                    </dd>
                    <dd>
                        <a href="link_insert.jsp">链接</a>
                    </dd>
                </dl> </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"> <a href="javascript:;"> <img src="./images/20171006225356181.jpg" class="layui-nav-img"> admin</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="user.html/profile/1">基本资料</a>
                    </dd>
                </dl> </li>
            <li class="layui-nav-item"> <a href="/admin/logout">退了</a> </li>
        </ul>
    </div>



    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree" lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed"> <a class="" href="javascript:;">文章</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/ArticleController?method=showAllArticle">全部文章</a>
                        </dd>
                        <dd>
                            <a href="/ArticleController?method=writeArticlePage">写文章</a>
                        </dd>
                        <dd>
                            <a href="/ArticleController?method=getType">全部分类</a>
                        </dd>
                        <dd>
                            <a href="/ArticleController?method=getAllTag">全部标签</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="javascript:;">页面</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="page.html">全部页面</a>
                        </dd>
                        <dd>
                            <a href="page_insert.html">添加页面</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a class="" href="javascript:;"> 链接 </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/LinkController?method=getAll">全部链接</a>
                        </dd>
                        <dd>
                            <a href="/LinkController?method=addLinkPage">添加链接</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="javascript:;">公告</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/LinkController?method=getAll">全部公告</a>
                        </dd>
                        <dd>
                            <a href="/admin/notice_insert.html">添加公告</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="/CommentServlet?method=getComment"> 评论 </a> </li>
                <li class="layui-nav-item"> <a class="" href="javascript:;"> 用户 </a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="/UserServlet?method=showAllUser">全部用户</a>
                        </dd>
                        <dd>
                            <a href="/admin/user_insert.jsp">添加用户</a>
                        </dd>
                    </dl> </li>
                <li class="layui-nav-item"> <a href="javascript:;">设置</a>
                    <dl class="layui-nav-child">
                        <dd>
                            <a href="menu.html">菜单</a>
                        </dd>
                        <dd>
                            <a href="options.html">主要选项</a>
                        </dd>
                    </dl> </li>
            </ul>
        </div>
    </div>



    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
            <blockquote class="layui-elem-quote">
                <span class="layui-breadcrumb" lay-separator="/"> <a href="/admin">首页</a> <a><cite>文章列表</cite></a> </span>
            </blockquote>
            <div class="layui-tab layui-tab-card">
                <ul class="layui-tab-title">
                    <li class="layui-this">已发布(18)</li>
                    <li>草稿(0)</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <form id="articleForm" method="post">
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <input type="text" name="query" placeholder="请输入关键词" autocomplete="off" class="layui-input">
                                    <button class="layui-btn" lay-filter="formDemo" onclick="queryArticle()">搜索</button>
                                    <button class="layui-btn" lay-filter="formDemo" style="float: right;" onclick="confirmDeleteArticleBatch()">批量删除 </button>
                                </div>
                            </div>
                            <input type="hidden" name="currentUrl" id="currentUrl" value="">
                            <table class="layui-table">
                                <colgroup>
                                    <col width="50">
                                    <col width="50">
                                    <col width="300">
                                    <col width="200">
                                    <col width="200">
                                    <col width="50">
                                    <col width="150">
                                    <col width="100">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th><input type="checkbox" id="allSelect" onclick="javascript:DoCheck()"></th>
                                    <th>id</th>
                                    <th>标题</th>
                                    <th>所属分类</th>
                                    <th>所带标签</th>
                                    <td>order</td>
                                    <th>发布时间</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td><input type="checkbox" name="ids" value="19"></td>
                                    <td>19</td>
                                    <td> <a href="/article/19" target="_blank"> 测试顶戴克格勃</a></td>
                                    <td> <a href="/category/1" target="_blank">Java</a> &nbsp; <a href="/category/2" target="_blank">Java基础</a> &nbsp; </td>
                                    <td> <a href="/tag/1" target="_blank">Java</a> &nbsp; </td>
                                    <td>1</td>
                                    <td> 02月25日 16:06</td>
                                    <td> <a href="article.html/edit/19" class="layui-btn layui-btn-mini">编辑</a> <a href="#" onclick="deleteArticle(19)" class="layui-btn layui-btn-danger layui-btn-mini">删除</a> </td>
                                </tr>
                                <c:forEach var="blogVoAdmin" items="${blog_list}">

                                    <tr>
                                        <td><input type="checkbox" name="blogId" value="${blogVoAdmin.blog.id}"></td>

                                        <td>${blogVoAdmin.blog.id}</td>

                                        <td> <a href="/item?method=getItem&cz=type&typeTagId=${blogVoAdmin.blog.typeId}&BlogId=${blogVoAdmin.blog.id}&pageNum=1" target="_blank">${blogVoAdmin.blog.title}</a></td>

                                        <td>
                                            <c:forEach var="type" items="${blogVoAdmin.types}">
                                            <a href="/TypeTagServlet?method=show&cz=type&typeTagId=${type.id}&pageNum=1" target="_blank">${type.title}</a> &nbsp;
                                            </c:forEach>
                                        </td>

                                        <td>
                                            <c:forEach var="tag" items="${blogVoAdmin.tags}">
                                            <a href="/TypeTagServlet?method=show&cz=tag&typeTagId=${tag.id}&pageNum=1" target="_blank"> ${tag.title} </a> &nbsp;
                                            </c:forEach>
                                        </td>

                                        <td>1</td>

                                        <td> ${blogVoAdmin.blog.date}</td>

                                        <td> <a href="article.html/edit/15" class="layui-btn layui-btn-mini">编辑</a> <a href="/ArticleController?method=delete&blogId=${blogVoAdmin.blog.id}" onclick="deleteArticle(${blogVoAdmin.blog.id})" class="layui-btn layui-btn-danger layui-btn-mini">删除</a> </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </form>
                        <nav class="navigation pagination" role="navigation">
                            <div class="nav-links">
                                <a class="page-numbers current">1</a>
                            </div>
                        </nav>
                    </div>
                    <div class="layui-tab-item">
                        <table class="layui-table">
                            <colgroup>
                                <col width="50">
                                <col width="300">
                                <col width="200">
                                <col width="200">
                                <col width="200">
                                <col width="100">
                            </colgroup>
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>标题</th>
                                <th>所属分类</th>
                                <th>所带标签</th>
                                <th>发布时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 --> © 风吟博客 - 后台
    </div>
</div>
<script src="./js/jquery.min.js"></script>
<script src="./js/layui.all.js"></script>
<script src="./js/back.js"></script>
<script>


</script>
<script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<Link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>
</body>
</html>