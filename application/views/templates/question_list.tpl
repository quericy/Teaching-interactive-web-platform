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
                        <span class="glyphicon glyphicon-comment" style="color:#999;"></span>&nbsp;提问列表
                    </h3>
                </div>
                    <div class="list-group" style="min-height:600px;">
                        <{foreach  from=$question_info_list item=val key=key}>
                        <a href="<{$smarty.const._site_domain}>question_show/index/<{$val.qid}>" class="list-group-item">

                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                <tr>
                                    <td width="48" valign="top" align="center">
                                        <img src="<{$val.user_logo_uri}>" border="0"  style="max-width: 48px; max-height: 48px;">
                                    </td>
                                    <td width="10"></td>
                                    <td width="auto" valign="middle">
                                        <span>
                                            <a href="<{$smarty.const._site_domain}>question_show/index/<{$val.qid}>">
                                                <{$val.title|truncate:30:"..."}>
                                            </a>
                                        </span>
                                        <div></div>
                                        <span><{$val.user_name}>&nbsp;•&nbsp;<{$val.sub_time|date_format:'%Y-%m-%d %H:%M:%S'}> </span>
                                    </td>
                                    <td width="70" align="right" valign="middle">
                                        <div class="badge">18</div>
                                    </td>
                                </tr>

                            </table>

                            <!--<{$val.title|truncate:30:"..."}>
                            <{if !empty($val.sub_time)}>
                            <span class="pull-right"
                                  style="color:#ccc;"><{$val.sub_time|date_format:'%Y-%m-%d %H:%M:%S'}></span>
                            <{/if}>-->
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
                    <h5 class="panel-title"><span class="glyphicon glyphicon-fire" style="color:#999;"></span>&nbsp;最新问题
                    </h5>
                </div>
                <div class="list-group">
                    <!--<{foreach  from=$recent_data_list item=val key=key}>
                    <a href="<{$smarty.const._site_domain}>course_data/index/<{$val.did}>" class="list-group-item">
                        <{$val.title|truncate:15:'...'}>
                        <{if $val.type=='1'}>
                        <span class="badge alert-info">课件</span>
                        <{else}>
                        <span class="badge alert-success">资料</span>
                        <{/if}>
                    </a>
                    <{/foreach}>
                    -->
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