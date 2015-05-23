<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><{$web_title}></title>
    <!--ueditor-->
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <script src="<{$smarty.const._site_third_party}>ueditor/ueditor.parse.js"></script>
    <link href="<{$smarty.const._site_third_party}>/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css"
          rel="stylesheet" type="text/css"/>
    <script type="text/javascript"
            src="<{$smarty.const._site_third_party}>/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
    <!-- Bootstrap -->
    <link href="<{$smarty.const._site_css}>bootstrap.min.css" rel="stylesheet">
    <link href="<{$smarty.const._site_css}>default.css" rel="stylesheet">
    <!--IE8 css query-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
</head>
<body>
<{include file="header.tpl"}>
<!--列表begin-->
<div id="list" class="container">
    <div class="row">
        <!--左侧列表begin-->
        <div class="col-md-8">
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title" style="color:#999;">
                        <a href="<{$smarty.const._site_domain}>course_data_list"><{if $course_data_arr.type=='1'}>课件<{else}>资料<{/if}>列表</a>
                        > 查看<{if $course_data_arr.type=='1'}>课件<{else}>资料<{/if}>
                    </h5>
                </div>
                <div class="panel-body" style="min-height: 700px;">
                    <div class="row">
                        <h4 class="left col-sm-10" style="color:#000;"><{$course_data_arr.title}></h4>
                    </div>
                    <div class="row">
                        <p class="left col-sm-10">
                            <{$course_data_arr.user_name}>&nbsp;&nbsp;
                            最后编辑于:<{$course_data_arr.edit_time|date_format:'%Y-%m-%d %H:%M:%S'}>&nbsp;&nbsp;

                        </p>
                    </div>

                    <hr/>
                    <div id="page_content" style="width: 100%;overflow-x: auto;">
                        <{$course_data_arr.content}>
                    </div>
                </div>
            </div>
        </div>
        <!--左侧列表end-->
        <!--右侧列表begin-->
        <div class="col-md-4">
            <{include file="user_pannel.tpl"}>
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title"><span class="glyphicon glyphicon-fire" style="color:#999;"></span>&nbsp;最新发布
                    </h5>
                </div>
                <div class="list-group">
                    <{foreach  from=$recent_data_list item=val key=key}>
                    <a href="<{$smarty.const._site_domain}>course_data/index/<{$val.did}>" class="list-group-item">
                        <{$val.title|truncate:15:'...'}>
                        <{if $val.type=='1'}>
                        <span class="badge alert-info">课件</span>
                        <{else}>
                        <span class="badge alert-success">资料</span>
                        <{/if}>
                    </a>
                    <{/foreach}>
                </div>

            </div>
        </div>
        <!--右侧列表end-->
    </div>
</div>
<!--列表end-->
<{include file="footer.tpl"}>
<script type="text/javascript">
    uParse('#page_content');
</script>
</body>
</html>