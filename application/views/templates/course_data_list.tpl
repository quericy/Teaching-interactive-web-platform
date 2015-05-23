<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title><{$web_title}></title>
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
                    <h3 class="panel-title"><span class="glyphicon glyphicon-file" style="color:#999;"></span>&nbsp;课件列表
                    </h3>
                </div>
                <div class="panel-body" style="min-height:300px;">
                    <div class="list-group">
                        <{foreach  from=$course_info_list item=val key=key}>
                        <a href="<{$smarty.const._site_domain}>course_data/index/<{$val.did}>" class="list-group-item">
                            <{$val.title|truncate:30:"..."}>
                            <{if !empty($val.edit_time)}>
                            <span class="pull-right"
                                  style="color:#ccc;"><{$val.edit_time|date_format:'%Y-%m-%d %H:%M:%S'}></span>
                            <{/if}>
                        </a>
                        <{/foreach}>
                        <div class="pull-right">
                            <{$course_page_string}>
                        </div>
                    </div>
                </div>
            </div>
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><span class="glyphicon glyphicon-book" style="color:#999;"></span>&nbsp;资料列表
                    </h3>
                </div>
                <div class="panel-body" style="min-height:300px;">
                    <div class="list-group">
                        <{foreach  from=$data_info_list item=val key=key}>
                        <a href="<{$smarty.const._site_domain}>course_data/index/<{$val.did}>" class="list-group-item">
                            <{$val.title|truncate:25:"..."}>
                            <{if !empty($val.edit_time)}>
                            <span class="pull-right"
                                  style="color:#ccc;"><{$val.edit_time|date_format:'%Y-%m-%d %H:%M:%S'}></span>
                            <{/if}>
                        </a>
                        <{/foreach}>
                        <div class="pull-right">
                            <{$data_page_string}>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--左侧列表end-->
        <!--右侧列表begin-->
        <div class="col-md-4">
            <div class=" panel panel-default">
                <div class="panel-body">
                    <{if isset($user_info['is_login'])&&$user_info['is_login']=='true'}>
                <img src="<{$user_info['user_logo_uri']}>" alt="bar Identicon" />
                    <{else}>
                    <label>教学互动平台</label>
                    <hr/>
                    <div class="center">
                        <div class=" btn btn-default">现在注册</div>
                    </div>
                    <p></p>
                    <div class="center">
                        <p>已注册同学请<a href="<{$smarty.const._site_domain}>user_login">登录</a></p>
                    </div>
                    <{/if}>
                </div>
            </div>
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

</script>
</body>
</html>