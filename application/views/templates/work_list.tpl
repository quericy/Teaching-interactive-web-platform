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
                    <h3 class="panel-title">
                        <span class="glyphicon glyphicon-comment" style="color:#999;"></span>&nbsp;作业列表
                    </h3>
                </div>
                <div class="list-group" style="min-height:600px;">
                    <{foreach  from=$work_info_list item=val key=key}>
                    <a href="<{$smarty.const._site_domain}>work_show/index/<{$val.wid}>" class="list-group-item">

                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tr>
                                <td width="48" valign="top" align="center">
                                    <img src="<{$val.user_logo_uri}>" border="0"
                                         style="max-width: 48px; max-height: 48px;">
                                </td>
                                <td width="10"></td>
                                <td width="auto" valign="middle">
                                        <span>
                                            <a href="<{$smarty.const._site_domain}>work_show/index/<{$val.wid}>">
                                                <{$val.title|truncate:30:"..."}>
                                            </a>
                                        </span>

                                    <div></div>
                                    <span>
                                        <{$val.user_name}>&nbsp;•&nbsp;
                                        <{$val.start_time|date_format:'%Y-%m-%d %H:%M'}>
                                        ~ <{$val.end_time|date_format:'%Y-%m-%d %H:%M'}>
                                    </span>
                                </td>
                                <td width="70" align="right" valign="middle">
                                    <{if  $smarty.now>$val.end_time}>
                                    <div class="badge">已经截止</div>
                                    <{elseif $smarty.now|date_format:'%Y-%m-%d'==$val.end_time|date_format:'%Y-%m-%d'}>
                                    <div class="badge alert-danger">即将截止</div>
                                    <{else}>
                                    <div class="badge alert-success">正在进行</div>
                                    <{/if}>
                                </td>
                            </tr>
                        </table>
                    </a>
                    <{/foreach}>
                    <div class="pull-right">
                        <{$page_string}>
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

</script>
</body>
</html>