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
                        > 提出问题
                    </h5>
                </div>
                <div class="panel-body" style="min-height:600px;">
                    <div id="msg_tips"></div>
                    <div class="form-group">
                        <label for="question_title">问题标题:</label>

                        <div class="input-group">
                                <span class="input-group-addon"><span
                                            class="glyphicon glyphicon-tag"></span></span>
                            <input id="question_title" type="text" class="form-control">
                                <span class="input-group-addon">
                                    <span class="glyphicon glyphicon-question-sign"
                                          data-toggle="tooltip" data-placement="top"
                                          title="请简略叙述疑问概要"></span>
                                </span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="question_content">问题正文:</label>
                            <textarea id="question_content" class=" form-control"
                                      style="width:100%;max-width:100%;min-height: 300px;"
                                      placeholder="请在此处填写详细的需要答疑的问题信息"></textarea>
                    </div>
                    <input id="submit_btn" type="button" class="btn btn-success" value="提交"/>
                </div>
            </div>
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
    $(document).ready(function () {
        //提示工具栏
        $('[data-toggle="tooltip"]').tooltip();
    });
    //提交按钮触发函数
    $(document).delegate('#submit_btn', 'click', function () {
        $('#msg_tips').html('');//隐藏提示
        var question_title = $('#question_title').val().trim();
        var question_content = $('#question_content').val().trim();
        if (question_title == '' || question_content == '') {
            my_dialog('提示', '问题的标题和内容不能为空!', false);
            return;
        }
        //提交回复内容
        $('#submit_btn').html('正在提交');
        $('#submit_btn').attr('disabled', "disabled");
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._site_domain}><{$controller_name}>/submit_question/',
            data:{question_title:question_title,question_content:question_content},
            success: function (res) {
                $('#submit_btn').html('提交');
                $('#submit_btn').removeAttr('disabled');
                var return_arr = eval('(' + res + ')');
                switch (return_arr.status) {
                    case '1':
                        //清空输入内容
                        $('#question_title').val('');
                        $('#question_content').val('');
                        //顶部提示
                        $('#msg_tips').html('<div class="alert alert-success fade in" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong><span class="glyphicon glyphicon-ok-sign"></span>消息：</strong>'+return_arr.msg+'</div>');
                        $('#msg_tips').fadeIn(1000);
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