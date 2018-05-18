<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %><html>
 <head> 
  <meta charset="utf-8"> 
  <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ --> 
  <link rel="shortcut icon" href="/img/logo.png"> 
  <title>
        风吟博客后台
            
        - 链接列表
    </title> 
  <link rel="stylesheet" href="../css/layui.css">
  <link rel="stylesheet" href="../css/back.css">
  <link rel="stylesheet" href="../css/font-awesome.min.css">
  <style>
        /*覆盖 layui*/

        .layui-table {
            margin-top: 0;
        }

        .layui-btn {
            margin: 2px 0!important;
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
      <span class="layui-breadcrumb" lay-separator="/"> <a href="/admin">首页</a> <a><cite>链接列表</cite></a> </span> 
     </blockquote> 
     <table class="layui-table"> 
      <colgroup> 
       <col width="100"> 
       <col width="50&quot;"> 
       <col width="100"> 
       <col width="100"> 
       <col width="50"> 
       <col width="50"> 
       <col width="100"> 
       <col width="50"> 
      </colgroup> 
      <thead> 
       <tr> 
        <th>名称</th> 
        <th>URL</th> 
        <th>联系方式</th> 
        <th>创建时间</th> 
        <th>Order</th> 
        <th>状态</th> 
        <th>操作</th> 
        <th>ID</th> 
       </tr> 
      </thead> 
      <tbody> 
       <tr> 
        <td> 言曌博客</td> 
        <td> <a href="http://liuyanzhao.com" target="_blank">http://liuyanzhao.com</a> </td> 
        <td> 你好，我的丘丘是847064370</td> 
        <td> 2017年10月07日</td> 
        <td> 1</td> 
        <td> 显示 </td> 
        <td> <a href="link.jsp/edit/1" class="layui-btn layui-btn-mini">编辑</a>
         <a href="/LinkController?method=deleteLink&id=${link.id}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a> </td>
        <td>1</td> 
       </tr> 
       <c:forEach var="link" items="${link_list}">
       <tr>
        <td> ${link.name}</td>
        <td> <a href="${link.url}" target="_blank">${link.url}</a> </td>
        <td> ${link.lxfs}</td>
        <td> ${link.date}</td>
        <td> ${link._order}</td>
        <td> 显示 </td> 
        <td> <a href="link.jsp/edit/6" class="layui-btn layui-btn-mini">编辑</a>
         <a href="/LinkController?method=deleteLink&id=${link.id}" class="layui-btn layui-btn-danger layui-btn-mini" onclick="return confirmDelete()">删除</a> </td>
        <td>${link.id}</td>
       </tr>
       </c:forEach>
      </tbody> 
     </table> 
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

    </script> 
  <script>
    //给文本编辑器的iframe引入代码高亮的css
    $("iframe").contents().find("head").append("<link rel=\"stylesheet\" href=\"/css/highlight.css\">\n");

</script>  
 </body>
</html>