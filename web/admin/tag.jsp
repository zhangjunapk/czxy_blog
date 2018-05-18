<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/15
  Time: 21:21
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

        - 标签列表
    </title>
    <link rel="stylesheet" href="./css/layui.css">
    <link rel="stylesheet" href="./css/back.css">
    <link rel="stylesheet" href="./css/font-awesome.min.css">
    <script type="text/javascript" src="/layer/layer.js"></script>
    <script type="text/javascript" src="/js/jquery-3.3.1.min.js"></script>
    <link rel="stylesheet" href="/layer/theme/default/layer.css">

    <script>
        function modifyAlert(id) {
            layer.open({
                type: 1,
                area: ['600px', '360px'],
                shadeClose: false, //点击遮罩关闭
                width:500,
                height:300,
                anime:5,
                content: "<iframe src='/admin/tag_edit.jsp?tagId="+id+"'></iframe>"
            });
        }
    </script>


    <style>
        /*覆盖 layui*/
        .layui-input-block {
            margin: 0px 10px;
        }

        .layui-table {
            margin-top: 0;
        }

        .layui-col-md4 {
            padding: 10px;
        }

        .layui-col-md8 {
            padding: 10px;
        }

        .layui-btn {
            margin: 2px 0 !important;
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
            <li class="layui-nav-item"><a href="javascript:;">新建</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="article_insert.html">文章</a>
                    </dd>
                    <dd>
                        <a href="page_insert.html">页面</a>
                    </dd>
                    <dd>
                        <a href="category_insert.html">分类</a>
                    </dd>
                    <dd>
                        <a href="tag_insert.html">标签</a>
                    </dd>
                    <dd>
                        <a href="notice_insert.html">公告</a>
                    </dd>
                    <dd>
                        <a href="link_insert.jsp">链接</a>
                    </dd>
                </dl>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"><a href="javascript:;"> <img src="./images/20171006225356181.jpg"
                                                                    class="layui-nav-img"> admin</a>
                <dl class="layui-nav-child">
                    <dd>
                        <a href="user.html/profile/1">基本资料</a>
                    </dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="/admin/logout">退了</a></li>
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
                <span class="layui-breadcrumb" lay-separator="/"> <a
                        href="/admin">首页</a> <a><cite>标签列表</cite></a> </span>
            </blockquote>
            <div class="layui-row">
                <div class="layui-col-md4">
                    <form class="layui-form" method="post" id="myForm" action="ArticleController?method=addTag">
                        <div class="layui-form-item">
                            <div class="layui-input-block">
                                <strong>添加标签</strong>
                            </div>
                            <div class="layui-input-block">
                                名称
                                <span style="color: #FF5722; ">*</span>
                                <input type="text" name="title" placeholder="请输入标签名称" autocomplete="off"
                                       class="layui-input" required>
                            </div>
                            <br>
                            <div class="layui-input-block">
                                标签描述
                                <input type="text" name="info" placeholder="请输入标签描述" autocomplete="off"
                                       class="layui-input">
                            </div>
                            <br>
                            <div class="layui-input-block">
                                <button class="layui-btn" lay-filter="formDemo" type="submit">添加</button>
                            </div>
                        </div>
                    </form>
                    <blockquote class="layui-elem-quote layui-quote-nm">
                        温馨提示：
                        <ul>
                            <li>1、标签名必选，建议不要太长</li>
                            <li>2、标签名勿重复</li>
                        </ul>
                    </blockquote>
                </div>
                <div class="layui-col-md8" style="border: 1px solid #FF5722;">
                    <table class="layui-table">
                        <colgroup>
                            <col width="200">
                            <col width="100">
                            <col width="50">
                            <col width="100">
                            <col width="50">
                        </colgroup>
                        <thead>
                        <tr>
                            <th>名称</th>
                            <th>文章数</th>
                            <th>状态</th>
                            <th>操作</th>
                            <th>ID</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="tag" items="${tag_list}">
                            <tr>
                                <td><a href="/TypeTagServlet?method=show&cz=tag&typeTagId=${tag.id}&pageNum=1" target="_blank">${tag.title}</a></td>
                                <td><a href="/TypeTagServlet?method=show&cz=type&typeTagId=${tag.id}&pageNum=1" target="_blank" lay-data="{sort:true}">${tag.articleCount}</a></td>
                                <td> ${tag.status} </td>
                                <td><a href="javascript:void(0)" onclick="modifyAlert(${tag.id})"
                                       class="layui-btn layui-btn-mini">编辑</a>
                                    <a href="/ArticleController?method=deleteTag&tagId=${tag.id}"
                                       class="layui-btn layui-btn-danger layui-btn-mini"
                                       onclick="return confirmDelete()">删除</a></td>
                                <td>${tag.id}</td>
                            </tr>
                        </c:forEach>

                        <tr>
                            <td><a href="/tag/2" target="_blank">算法</a></td>
                            <td><a href="/tag/2" target="_blank" lay-data="{sort:true}">0</a></td>
                            <td> 显示</td>
                            <td><a href="javascript:void(0)" onclick="modifyAlert()"
                                   class="layui-btn layui-btn-mini">编辑</a>
                                <a href="tag.html/delete/2" class="layui-btn layui-btn-danger layui-btn-mini"
                                   onclick="return confirmDelete()">删除</a></td>
                            <td>2</td>
                        </tr>

                        </tbody>
                    </table>
                    <blockquote class="layui-elem-quote layui-quote-nm">
                        温馨提示：
                        <ul>
                            <li>如果该标签包含文章，将不可删除</li>
                        </ul>
                    </blockquote>
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
