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
            <!--作业正文begin-->
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title" style="color:#999;">
                        <a href="<{$smarty.const._site_domain}>work_list">作业列表</a>
                        > 查看作业
                    </h5>
                </div>
                <div class="panel-body" style="min-height: 300px;">
                    <div class="row">
                        <h4 class="left col-sm-10" style="color:#000;"><{$work_arr.title}></h4>
                    </div>
                    <div class="row">
                        <p class="left col-sm-10">
                            <{$work_arr.user_name}>&nbsp;&nbsp;
                            开始时间:<{$work_arr.start_time|date_format:'%Y-%m-%d %H:%M'}>&nbsp;&nbsp;
                            截止时间:<{$work_arr.end_time|date_format:'%Y-%m-%d %H:%M'}>&nbsp;&nbsp;

                        </p>
                    </div>

                    <hr/>
                    <div id="page_content" style="width: 100%;overflow-x: auto;">
                        <{$work_arr.content}>
                    </div>
                </div>
            </div>
            <!--作业正文end-->
            <!--上传版块begin-->
            <div class="panel panel-default">
                <div class="panel-body">
                    <{if isset($user_info['is_login'])&&$user_info['is_login']=='true'}>
                    <{if isset($user_process_arr)}>
                    <!--已上传过作业-->
                    <div class="text-success"><span class="glyphicon glyphicon-ok-sign"></span>&nbsp;您已提交本次作业</div>

                    <{if $user_process_arr['status']=='2'}>
                    <div class="text-success"><span class="glyphicon glyphicon-ok-sign"></span>&nbsp;您的作业已经批改</div>
                <br/>
                    <div class="container-fluid">本次作业成绩:</div>
                    <div class="container-fluid">
                        <div class="text-danger container-fluid pull-left" style="font-size:30px;">
                            <{$user_process_arr['score']}>
                        </div>
                        <div class="pull-left" style="line-height: 60px;">分</div>
                    </div>
                    <div class="container-fluid">
                        批改时间:
                        <span class="has-warning">
                            <{$user_process_arr['score_time']|date_format:'%Y-%m-%d %H:%M:%S'}>
                        </span>
                    </div>
                    <{else}>
                    <div class="text-warning"><span class="glyphicon glyphicon-info-sign"></span>&nbsp;您的作业等待教师批改中</div>
                    <{/if}>
                    <{elseif $work_arr['end_time']>$smarty.now}>
                    <!--未上传过作业-->
                    提交作业
                    <{else}>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="center">该作业已经过了截止日期,不能再提交了!</div>
                        </div>
                    </div>
                    <{/if}>
                    <{else}>
                    <div class="center">
                        您需要登录后才可以提交作业&nbsp;&nbsp;
                        <a href="<{$smarty.const._site_domain}>user_login">登录</a>
                        &nbsp;|&nbsp;
                        <a href="<{$smarty.const._site_domain}>user_reg">注册</a>
                    </div>
                    <{/if}>

                </div>
            </div>
            <!--上传版块end-->
        </div>
        <!--左侧列表end-->
        <!--右侧列表begin-->
        <div class="col-md-4">
            <{include file="user_pannel.tpl"}>
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title"><span class="glyphicon glyphicon-fire" style="color:#999;"></span>&nbsp;最新布置
                    </h5>
                </div>
                <div class="list-group">
                    <{foreach  from=$recent_work_list item=val key=key}>
                    <a href="<{$smarty.const._site_domain}>work_show/index/<{$val.wid}>" class="list-group-item">
                        <{$val.title|truncate:15:'...'}>
                        <{if  $smarty.now>$val.end_time}>
                        <div class="badge">已经截止</div>
                        <{elseif $smarty.now|date_format:'%Y-%m-%d'==$val.end_time|date_format:'%Y-%m-%d'}>
                        <div class="badge alert-danger">即将截止</div>
                        <{else}>
                        <div class="badge alert-success">正在进行</div>
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