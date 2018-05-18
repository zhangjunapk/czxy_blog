<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ZhangJun
  Date: 2018/5/14
  Time: 17:34
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

        - 新建文章
    </title>
    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/back.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">
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
                </dl> </li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item"> <a href="javascript:;"> <img src="../images/20171006225356181.jpg" class="layui-nav-img"> admin</a>
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
                <span class="layui-breadcrumb" lay-separator="/"> <a href="/admin">首页</a> <a href="article.html">文章列表</a> <a><cite>添加文章</cite></a> </span>
            </blockquote>
            <form class="layui-form" method="post" id="myForm" action="/ArticleController?method=addArticle">
                <div class="layui-form-item">
                    <label class="layui-form-label">标题 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-block">
                        <input type="text" name="articleTitle" lay-verify="title" id="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">内容 <span style="color: #FF5722; ">*</span></label>
                    <div class="layui-input-block">
                        <textarea class="layui-textarea layui-hide" name="articleContent" lay-verify="content" id="content"></textarea>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">分类 <span style="color: #FF5722; ">*</span> </label>
                    <div class="layui-input-inline">
                        <select name="articleParentCategoryId" id="articleParentCategoryId" lay-filter="articleParentCategoryId" required>
                            <option value="" selected="">一级分类</option> <option value="1">Java</option>
                            <option value="10">计算机科学</option>
                            <option value="15">其他技术</option>
                            <c:forEach var="typeVo" items="${type_list}">
                                <option value="${typeVo.parentType.id}">${typeVo.parentType.title}</option>
                            </c:forEach>

                        </select>
                    </div>
                    <div class="layui-input-inline">
                        <select name="articleChildCategoryId" id="articleChildCategoryId">
                            <option value="" selected>二级分类</option> </select>
                    </div>
                </div>
                <div class="layui-form-item" pane="">
                    <label class="layui-form-label">标签</label>
                    <div class="layui-input-block">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary" title="Java" value="1" onchange="chk()">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary" title="算法" value="2" onchange="chk()">
                        <input type="checkbox" name="articleTagIds" lay-skin="primary" title="数据结构" value="3" onchange="chk()">

                        <c:forEach var="tag" items="${tag_list}">
                            <input type="checkbox" name="tagId" lay-skin="primary" title="${tag.title}" value="${tag.id}" onchange="chk()">
                        </c:forEach>

                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">状态</label>
                    <div class="layui-input-block">
                        <input type="radio" name="articleStatus" value="1" title="发布" checked>
                        <input type="radio" name="articleStatus" value="0" title="草稿">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary" onclick="getCateIds()">重置</button>
                    </div>
                </div>
                <blockquote class="layui-elem-quote layui-quote-nm">
                    温馨提示：
                    <br> 1、文章内容的数据表字段类型为MEDIUMTEXT,每篇文章内容请不要超过500万字
                    <br> 2、写文章之前，请确保标签和分类存在，否则可以先新建；请勿刷新页面，博客不会自动保存
                    <br> 3、插入代码前，可以点击
                    <a href="http://liuyanzhao.com/code-highlight.html" target="_blank">代码高亮</a>,将代码转成HTML格式
                </blockquote>
            </form>
        </div>
    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 --> © 风吟博客 - 后台
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/layui.all.js"></script>
<script src="../js/back.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function() {
        var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;


        //上传图片,必须放在 创建一个编辑器前面
        layedit.set({
            uploadImage: {
                url: '/uploadFile' //接口url
                ,type: 'post' //默认post
            }
        });

        //创建一个编辑器
        var editIndex = layedit.build('content',{
                height:350,
            }
        );

        //自定义验证规则
        form.verify({
            title: function (value) {
                if (value.length < 5) {
                    return '标题至少得5个字符啊';
                }
            }
            , pass: [/(.+){6,12}$/, '密码必须6到12位']
            , content: function (value) {
                layedit.sync(editIndex);
            }
        });

        layedit.build('content', {
            tool: [
                'strong' //加粗
                ,'italic' //斜体
                ,'underline' //下划线
                ,'del' //删除线

                ,'|' //分割线

                ,'left' //左对齐
                ,'center' //居中对齐
                ,'right' //右对齐
                ,'link' //超链接
                ,'unlink' //清除链接
                ,'face' //表情
                ,'image' //插入图片
                ,'code'
            ]
        });

        layui.use('code', function(){ //加载code模块
            layui.code();
        });

        //二级联动
        form.on("select(articleParentCategoryId)",function () {
            var articleParentCategoryId = $("#articleParentCategoryId").val();

         /*   if(articleParentCategoryId==0) {
                optionstring += "<option name='childCategory' value='1'>Java</option>";
            }

            if(articleParentCategoryId==1) {
                optionstring += "<option name='childCategory' value='2'>Java基础</option>";
            }
*/
            $.ajax({
                url:"/ArticleController?method=getChildType",
                dataType:"json",
                data:{
                    parentId:articleParentCategoryId
                },
                success:(function (data) {
                    $("#articleChildCategoryId").html("<option value=''selected>二级分类</option>");
                    $(data).each(function () {
                        $("#articleChildCategoryId").append("<option value='"+this.id+"'>"+this.title+"</option>");
                    })

                }),
                error:(function (a,b,c) {
                    alert(a+":"+b+":"+c)
                })
            })



            //$("#articleChildCategoryId").html("<option value=''selected>二级分类</option>"+optionstring);
            form.render('select'); //这个很重要
        })

//end
    });
    //        window.onbeforeunload = function() {
    //            return "确认离开当前页面吗？未保存的数据将会丢失";
    //        }



</script>
<script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<Link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>
</body>
</html>