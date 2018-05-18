<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <link rel="stylesheet" href="../css/layui.css">
    <link rel="stylesheet" href="../css/back.css">
    <link rel="stylesheet" href="../css/font-awesome.min.css">

    <script type="text/javascript" src="/js/jquery.min.js"></script>

    <script>
        $(function () {
            var blogId=${param.blogId};
                var url="";
                var data={
                    blogId:blogId
                };
            $.ajax({
                 url:url,
                data:data,
                dataType:"json",
                success:function (data) {
                     $("#title").text(data.title)
                    $("#content").text(data.content)

                }
                })
        })
    </script>

</head>
<body>
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
            <textarea class="layui-textarea layui-hide" name="articleContent" lay-verify="content" id="content"></textarea><div class="layui-layedit"><div class="layui-unselect layui-layedit-tool"><i class="layui-icon layedit-tool-b" title="加粗" lay-command="Bold" layedit-event="b" "=""></i><i class="layui-icon layedit-tool-i" title="斜体" lay-command="italic" layedit-event="i" "=""></i><i class="layui-icon layedit-tool-u" title="下划线" lay-command="underline" layedit-event="u" "=""></i><i class="layui-icon layedit-tool-d" title="删除线" lay-command="strikeThrough" layedit-event="d" "=""></i><span class="layedit-tool-mid"></span><i class="layui-icon layedit-tool-left" title="左对齐" lay-command="justifyLeft" layedit-event="left" "=""></i><i class="layui-icon layedit-tool-center" title="居中对齐" lay-command="justifyCenter" layedit-event="center" "=""></i><i class="layui-icon layedit-tool-right" title="右对齐" lay-command="justifyRight" layedit-event="right" "=""></i><i class="layui-icon layedit-tool-link" title="插入链接" layedit-event="link" "=""></i><i class="layui-icon layedit-tool-unlink layui-disabled" title="清除链接" lay-command="unlink" layedit-event="unlink" "=""></i><i class="layui-icon layedit-tool-face" title="表情" layedit-event="face" "=""></i><i class="layui-icon layedit-tool-image" title="图片" layedit-event="image"><input type="file" name="file"></i><i class="layui-icon layedit-tool-code" title="插入代码" layedit-event="code"></i></div><div class="layui-layedit-iframe"><iframe id="LAY_layedit_2" name="LAY_layedit_2" textarea="content" frameborder="0" style="height: 280px;"></iframe></div></div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">分类 <span style="color: #FF5722; ">*</span> </label>
        <div class="layui-input-inline">
            <select name="articleParentCategoryId" id="articleParentCategoryId" lay-filter="articleParentCategoryId" required="">
                <option value="" selected="">一级分类</option> <option value="1">Java</option>
                <option value="10">计算机科学</option>
                <option value="15">其他技术</option>


            </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="一级分类" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="" class="layui-select-tips">一级分类</dd><dd lay-value="1" class="">Java</dd><dd lay-value="10" class="">计算机科学</dd><dd lay-value="15" class="">其他技术</dd></dl></div>
        </div>
        <div class="layui-input-inline">
            <select name="articleChildCategoryId" id="articleChildCategoryId">
                <option value="" selected="">二级分类</option> </select><div class="layui-unselect layui-form-select"><div class="layui-select-title"><input type="text" placeholder="二级分类" value="" readonly="" class="layui-input layui-unselect"><i class="layui-edge"></i></div><dl class="layui-anim layui-anim-upbit"><dd lay-value="" class="layui-select-tips">二级分类</dd></dl></div>
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">标签</label>
        <div class="layui-input-block">
            <input type="checkbox" name="articleTagIds" lay-skin="primary" title="Java" value="1" onchange="chk()"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>Java</span><i class="layui-icon"></i></div>
            <input type="checkbox" name="articleTagIds" lay-skin="primary" title="算法" value="2" onchange="chk()"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>算法</span><i class="layui-icon"></i></div>
            <input type="checkbox" name="articleTagIds" lay-skin="primary" title="数据结构" value="3" onchange="chk()"><div class="layui-unselect layui-form-checkbox" lay-skin="primary"><span>数据结构</span><i class="layui-icon"></i></div>



        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <input type="radio" name="articleStatus" value="1" title="发布" checked=""><div class="layui-unselect layui-form-radio layui-form-radioed"><i class="layui-anim layui-icon"></i><span>发布</span></div>
            <input type="radio" name="articleStatus" value="0" title="草稿"><div class="layui-unselect layui-form-radio"><i class="layui-anim layui-icon"></i><span>草稿</span></div>
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
</body>
</html>