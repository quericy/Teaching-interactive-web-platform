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
                <div id="reply_list" class="list-group">
                    <{if empty($answer_list)}>
                    <div id="no_reply_div" class="list-group-item">
                        <div class=" center">目前尚无回复</div>
                    </div>
                    <{else}>
                    <{foreach  from=$answer_list item=val key=key}>
                    <div id="no_reply_div" class="list-group-item" style="display:none;"></div>
                    <div class="list-group-item">
                        <div class="row container-fluid">
                            <div class="pull-left">
                                <img src="<{$val.user_logo_uri}>" width="48" height="48" style="margin-right: 5px;"/>
                            </div>
                            <div>
                                <{$val.user_name}>
                                <{if $val.answer_type=='1'}>
                                <span class="badge" style="color:#fff;background-color:#337ab7">教师</span>
                                <{/if}>
                                &nbsp;•&nbsp;
                                <{$val.sub_time|date_format:'%Y-%m-%d %H:%M:%S'}>
                                <br/>

                                <div style="color:#000;"><{$val.content}></div>
                            </div>
                            <div class="pull-right">
                                <span class="badge alert-info"><{$key+1}>#</span>
                            </div>
                        </div>
                    </div>
                    <{/foreach}>
                    <{/if}>
                </div>
            </div>
            <!--答复end-->
            <!--留言板begin-->
            <div class="panel panel-default">
                <div class="panel-body">
                    <{if $question_arr['status']=='1'}>
                    <{if isset($user_info['is_login'])&&$user_info['is_login']=='true'}>
                    <div class="col-md-12">
                        <div class="row">
                            <span class="pull-left">添加回复:</span>
                            <a href="#" class="pull-right"><span class="glyphicon glyphicon-arrow-up"></span>返回顶部</a>
                        </div>
                    </div>
                <hr/>
                    <textarea id="reply_area" class="form-control" style="width:100%;max-width:100%;min-height: 120px;"
                              placeholder="请尽量让自己的回复能够对别人有帮助"></textarea>
                <br/>
                <input id="reply_btn" type="button" class="btn btn-default" value="回复"/>
                    <{else}>
                    <div class="center">
                        您需要登录后才可以回复&nbsp;&nbsp;
                        <a href="<{$smarty.const._site_domain}>user_login">登录</a>
                        &nbsp;|&nbsp;
                        <a href="<{$smarty.const._site_domain}>user_reg">注册</a>
                    </div>
                    <{/if}>
                    <{else}>
                    <div class="col-md-12">
                        <div class="row">
                            <div class="center">该问题已经关闭,无法回复!</div>
                        </div>
                    </div>
                    <{/if}>
                </div>
            </div>
            <!--留言板end-->
        </div>
        <!--左侧列表end-->
        <!--右侧列表begin-->
        <div class="col-md-4">
            <{include file="user_pannel.tpl"}>
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title"><span class="glyphicon glyphicon-fire" style="color:#999;"></span>&nbsp;热门问题
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
    //回复按钮触发函数
    $(document).delegate('#reply_btn', 'click', function () {
        var reply_area = $('#reply_area').val().trim();
        if (reply_area == '') {
            my_dialog('提示', '回复内容不能为空!', false);
            return;
        }
        //提交回复内容
        $('#reply_btn').html('正在提交');
        $('#reply_btn').attr('disabled', "disabled");
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._site_domain}><{$controller_name}>/reply/',
            data:{qid:<{$qid}>,reply_text:reply_area},
            success: function (res) {
                $('#reply_btn').html('回复');
                $('#reply_btn').removeAttr('disabled');
                var return_arr = eval('(' + res + ')');
                switch (return_arr.status) {
                    case '1':
                        var data = return_arr.data;
                        var teacher_div = '';
                        if (data.answer_type == '1') {
                            teacher_div = '<span class="badge" style="color:#fff;background-color:#337ab7">教师</span>';
                        }
                        //隐藏暂无回复的提示框
                        $('#no_reply_div').css('display', 'none');
                        var html = '<div class="list-group-item" style="display:none"><div class="row container-fluid"><div class="pull-left"><img src="' + data.user_logo_uri + '" width="48" height="48" style="margin-right: 5px;"/></div><div>' + data.user_name + teacher_div + '&nbsp;&nbsp;•&nbsp;&nbsp;' + data.sub_date_time + '<br/><div style="color:#000;">' + reply_area + '</div></div><div class="pull-right"><span class="badge alert-success">new</span></div></div></div>';
                        $('#reply_area').val('');//清空输入框
                        $('#reply_list').append(html);
                        $('#reply_list .list-group-item:last').fadeIn(3000);//渐显
                        break;
                    case '-1':
                        my_dialog('提示', return_arr.msg + '!', false);
                        break;
                    case '-2':
                        my_dialog('提示', return_arr.msg + '!', false);
                        break;
                    case '-99':
                        my_dialog('提示', return_arr.msg + '!', false);
                        break;
                    default :
                        my_dialog('错误', '服务器繁忙,请稍后重试!', false);
                        break;
                }
            }
        });

    });
    //trim修复(IE)
    String.prototype.trim = function () {
        return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
    }
</script>
</body>
</html>