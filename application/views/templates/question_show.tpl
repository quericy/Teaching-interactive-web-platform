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
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title" style="color:#999;">
                        <a href="<{$smarty.const._site_domain}>question_list">提问列表</a>
                        > 查看问题
                    </h5>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <div class="row container-fluid">
                            <div class="pull-left">
                                <div class="row container-fluid">
                                    <h4 style="color:#000;"><{$question_arr.title}></h4>
                                </div>
                                <div class="row container-fluid">
                                    提问者:&nbsp;<{$question_arr.user_name}>
                                    &nbsp;•&nbsp;
                                    提问时间:&nbsp;<{$question_arr.sub_time|date_format:'%Y-%m-%d %H:%M:%S'}>
                                </div>
                            </div>
                            <div class="pull-right">
                                <img src="<{$question_arr.user_logo_uri}>" border="0"
                                     style="max-width: 72px; max-height: 72px;">
                            </div>
                        </div>
                        <hr/>
                        <div class="row container-fluid" style="color:#000;">
                            <{$question_arr.content}>
                        </div>
                    </div>
                </div>
                <div class="panel-footer">
                    <div class="row container-fluid">
                        <span class="pull-right"><{$question_arr.answer_count}>条答复</span>
                    </div>
                </div>
            </div>
            <!--答复begin-->
            <div class="panel panel-default">
                <{if empty($answer_list)}>
                <div class="panel-body">
                    <div class=" center">目前尚无回复</div>
                </div>
                <{else}>
                <div class="list-group">
                    <{foreach  from=$answer_list item=val key=key}>
                    <div class="list-group-item">
                        <div class="row container-fluid">
                            <div class=" pull-left">
                                <img src="<{$val.user_logo_uri}>" width="48" height="48" style="margin-right: 5px;"/>
                            </div>
                            <div class="">
                                <{$val.user_name}>
                                <{if $val.answer_type=='1'}>
                                <span class="badge" style="color:#fff;background-color:#337ab7">教师</span>
                                <{/if}>
                                &nbsp;•&nbsp;
                                <{$val.sub_time|date_format:'%Y-%m-%d %H:%M:%S'}>
                                <br/>

                                <div style="color:#000;"><{$val.content}></div>

                            </div>
                            <div class=" pull-right">
                                <span class="badge alert-info"><{$key+1}>#</span>

                            </div>
                        </div>
                    </div>
                    <{/foreach}>

                </div>
                <{/if}>
            </div>
            <!--答复end-->
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
                    <{foreach  from=$recent_question_list item=val key=key}>
                    <a href="<{$smarty.const._site_domain}>question_show/index/<{$val.qid}>" class="list-group-item">
                        <{$val.title|truncate:15:'...'}>
                        <span class="badge"><{$val.answer_count}></span>
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