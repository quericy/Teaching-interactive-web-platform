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
        <li class="active">答疑管理</li>
        <li><{$web_title}></li>
    </ol>
    <div class="alert alert-info alert-dismissible fade in" role="alert">
        <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>
        问题默认为开启状态,问题关闭后将视为已解决,所有人不能再回答此问题.
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">提问列表</h3>
        </div>
        <table id="question_table" class="table table-striped table-hover table-condensed">
            <tr>
                <th class="text-center"><input id="all_check" type="checkbox"></th>
                <th class="text-left">ID</th>
                <th class="text-left">提问人</th>
                <th class="text-center">问题</th>
                <th class="text-center">提交时间</th>
                <th class="text-center">状态</th>
                <th class="text-center">操作</th>
            </tr>
            <{foreach  from=$question_info_list item=val key=key}>
            <tr>
                <td class="text-center"><input class="item_check" type="checkbox" data-qid="<{$val.qid}>"></td>
                <td class="text-left"><{$val.qid}></td>
                <td class="text-left"><{$val.user_name}></td>
                <td class="text-center"><{$val.title}></td>
                <td class="text-center">
                    <{if !empty($val.sub_time)}>
                    <{$val.sub_time|date_format:'%Y-%m-%d %H:%M:%S'}>
                    <{else}>
                    暂无记录
                    <{/if}>
                </td>
                <td class="text-center"><{if $val.status==1}><span class="alert-success">可回复</span><{else}><span
                        class="alert-danger">已关闭</span><{/if}>
                </td>
                <td class="text-center">
                    <div class="btn-group" role="group">
                        <a href="<{$smarty.const._site_domain}>question_show/index/<{$val.qid}>" target="_blank" class="btn btn-primary btn-sm">查看
                        </a>
                        <a href="#" class="del_btn btn btn-default btn-sm"
                           data-qid="<{$val.qid}>" data-title="<{$val.title}>">
                            删除
                        </a>
                    </div>
                </td>
            </tr>
            <{/foreach}>
        </table>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="pull-left">
                <div class="btn-group dropup" style="margin-top: 20px">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"
                            aria-expanded="false">
                        批量操作&nbsp;<span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a id="status_on" href="#">开启问题</a></li>
                        <li class="divider"></li>
                        <li><a id="status_off" href="#">关闭问题</a></li>
                    </ul>
                </div>
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
    //删除问题
    $(document).delegate('.del_btn', 'click', function () {
        var qid = $(this).data('qid');
        var title = $(this).data('title');
        my_dialog('确认删除', '确定要删除问题<span class="text-danger">' + title + '</span>吗?删除后将无法恢复!', {
            btn_text: '删除',
            btn_class: 'danger',
            show_cancel: true,
            call_back: function () {
                $.ajax({
                    type: 'post',
                    url: '<{$smarty.const._admin_domain}><{$controller_name}>/del/' + qid,
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
                            default :
                                my_dialog('提示', '操作失败:'+return_arr.msg, false);
                                break;
                        }
                    }
                });
            }
        });
    });
    //批量启用
    $(document).delegate('#status_on', 'click', function () {
        change_status(1);
    });
    //批量禁用
    $(document).delegate('#status_off', 'click', function () {
        change_status(0);
    });
    //更改问题状态
    function change_status(status) {
        var check_arr = new Array();
        $(".item_check:checkbox").each(function () {
            if (this.checked == true) {
                check_arr.push($(this).data('qid'));
            }
        });
        var qid_str = check_arr.join(',');
        if (qid_str == '') {
            my_dialog('提示', '请至少勾选一个问题', false);
            return;
        }
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._admin_domain}><{$controller_name}>/status_change/' + status,
            data:{qid_str:qid_str},
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
                        my_dialog('提示', return_arr.msg, false);
                        break;
                    default :
                        my_dialog('提示', '操作失败:'+return_arr.msg, false);
                        break;
                }
            }
        });
    }
    //多选框
    $('#all_check').on('ifChecked', function (event) {
        $('.item_check').iCheck('check');
    });
    $('#all_check').on('ifUnchecked', function (event) {
        $('.item_check').iCheck('uncheck');
    });
</script>
</body>
</html>