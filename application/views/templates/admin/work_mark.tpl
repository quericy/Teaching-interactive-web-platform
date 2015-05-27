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
                作业"<span class="text-danger"><{$work_title}></span>"的完成情况
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
                    <div class="show_file btn btn-default btn-sm" data-id="<{$val.id}>">点击查看</div>
                </td>

                <td class="text-center">
                    <div class="btn-group" role="group">
                        <div class="btn btn-success btn-sm">
                            <span class="glyphicon glyphicon-ok-circle"></span>
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
    //删除作业
    $(document).delegate('.del_btn', 'click', function () {
        var wid = $(this).data('wid');
        var title = $(this).data('title');
        my_dialog('确认删除', '确定要删除作业<span id="del_work_name" class="text-danger">' + title + '</span>吗?删除后将无法恢复!', {
            btn_text: '删除',
            btn_class: 'danger',
            show_cancel: true,
            call_back: function () {
                $.ajax({
                    type: 'post',
                    url: '<{$smarty.const._admin_domain}><{$controller_name}>/del/' + wid,
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
                                my_dialog('提示', '操作失败:' + return_arr.msg, false);
                                break;
                        }
                    }
                });
            }
        });
    });
</script>
</body>
</html>