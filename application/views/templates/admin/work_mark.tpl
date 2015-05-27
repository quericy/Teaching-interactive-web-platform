<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理后台-<{$web_title}></title>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>iCheck_square_blue.css"/>
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}>default.css"/>
    <!--IE8 css query-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
</head>
<body>
<{include file="admin/nav.tpl"}>
<div class="content">
    <ol class="breadcrumb">
        <li class="active"><a href="<{$smarty.const._admin_domain}>">管理后台</a></li>
        <li class="active">作业管理</li>
        <li class="active"><a href="<{$smarty.const._admin_domain}>work_list">作业列表</a></li>
        <li><{$web_title}></li>
    </ol>
    <div class="panel panel-default" style="min-width: 450px;">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="glyphicon glyphicon-check"></span>作业批改:"<span class="text-danger"><{$work_title}></span>"的完成情况
            </h3>
        </div>
        <table id="admin_table" class="table table-striped table-hover table-condensed">
            <tr>
                <th class="text-center"><input id="all_check" type="checkbox" disabled="disabled"></th>
                <th class="text-center">学生</th>
                <th class="text-center">完成时间</th>
                <th class="text-center">状态</th>
                <th class="text-center">分数</th>
                <th class="text-center">批改时间</th>
                <th class="text-center">上传作业</th>
                <th class="text-center">操作</th>
            </tr>
            <{foreach from=$work_info_list item=val key=key}>
            <tr>
                <td class="text-center"><input class="item_check" type="checkbox" data-id="<{$val.id}>"
                                               disabled="disabled"></td>
                <td class="text-center"><{$val.user_name}></td>
                <td class="text-center">
                    <{$val.submit_time|date_format:'%Y-%m-%d %H:%M:%S'}>
                </td>
                <td class="text-center">
                    <{if $val.status=='1'}>
                    <span class="alert-danger">已上交</span>
                    <{else}>
                    <span class="alert-success">已批阅</span>
                    <{/if}>
                </td>
                <td class="text-center">
                    <{if empty($val.score)}>
                    --
                    <{else}>
                    <span class="text-danger"><{$val.score}></span>
                    <{/if}>
                    分

                </td>
                <td class="text-center">
                    <{if empty($val.score)}>
                    --
                    <{else}>
                    <span class="text-danger"><{$val.score_time|date_format:'%Y-%m-%d %H:%M:%S'}></span>
                    <{/if}>
                </td>
                <td class="text-center">
                    <div class="show_file btn btn-default btn-sm"
                         data-uid="<{$val.uid}>" data-wid="<{$val.wid}>">点击查看
                    </div>
                </td>

                <td class="text-center">
                    <div class="btn-group" role="group">
                        <div class="check_work_btn btn btn-success btn-sm"
                             data-id="<{$val.id}>" data-user-name="<{$val.user_name}>">
                            <span class="glyphicon glyphicon-ok-sign"></span>
                            打分
                        </div>
                    </div>
                </td>
            </tr>
            <{/foreach}>
        </table>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="pull-left">
                &nbsp;&nbsp;
            </div>
            <nav class="pull-right">
                <{$page_string}>
            </nav>
        </div>
    </div>

</div>

<{include file="admin/footer.tpl"}>
<script type="text/javascript">
    //批改作业
    $(document).delegate('.check_work_btn', 'click', function () {
        var id = $(this).data('id');
        var user_name = $(this).data('user-name');
        var check_dialog_html = '对学生<span class="text-danger">' + user_name + '</span>的本次作业评分:<br/>';
        check_dialog_html += '<div class="input-group"><div class="input-group-addon"><span class="glyphicon glyphicon-tower"></span></div><input id="score_input" class="form-control" type="text" placeholder="作业得分"/></div>';
        my_dialog('信息', check_dialog_html, {
            btn_text: '打分',
            btn_class: 'success',
            btn_class: 'success',
            show_cancel: true,
            call_back: function () {
                var score_text = $('#score_input').val().trim();
                if (score_text == '' || !score_reg(score_text)) {
                    my_dialog('提示', '输入的分数不合法', false);
                    return false;
                }
                $.ajax({
                    type: 'post',
                    url: '<{$smarty.const._admin_domain}><{$controller_name}>/mark/' + id,
                    data:{score:score_text},
                    success: function (res) {
                        var return_arr = eval('(' + res + ')');
                        switch (return_arr.status) {
                            case '1':
                                my_dialog('消息', return_arr.msg, {
                                    btn_class: 'info',
                                    call_back: function () {
                                        location.reload();
                                    },
                                    cancel_call_back: function () {
                                        location.reload();
                                    }
                                });
                                break;
                            case '-1':
                                my_dialog('消息', return_arr.msg + '!&nbsp;&nbsp;');
                                break;
                            case '-2':
                                my_dialog('消息', return_arr.msg + '!&nbsp;&nbsp;');
                                break;
                            default :
                                my_dialog('错误', '服务器繁忙&nbsp;&nbsp;');
                                break;
                        }
                    }
                });
                return true;
            }
        })

    });
    //整数小数判断
    function score_reg(str) {
        var reg = /^[0-9]+([.]{1}[0-9]{1,2})?$/;
        if (reg.test(str)) {
            return true;
        } else {
            return false;
        }
    }
    //trim修复(IE)
    String.prototype.trim = function () {
        return this.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
    }
</script>
</body>
</html>