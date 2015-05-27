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
    <div class="panel panel-default" style="min-width: 355px;">
        <div class="panel-heading">
            <h3 class="panel-title">答疑列表</h3>
        </div>
        <table id="answer_table" class="table table-striped table-hover table-condensed">
            <tr>
                <th class="text-center"><input id="all_check" type="checkbox"></th>
                <th class="text-left">ID</th>
                <th class="text-center">回复人</th>
                <th class="text-center">类型</th>
                <th class="text-center">回复正文</th>
                <th class="text-center">回复时间</th>
                <th class="text-center">操作</th>
            </tr>
            <{foreach  from=$answer_info_list item=val key=key}>
            <tr>
                <td class="text-center"><input class="item_check" type="checkbox" data-id="<{$val.id}>"></td>
                <td class="text-left"><{$val.id}></td>
                <td class="text-center"><{$val.user_name}></td>
                <td class="text-center">
                    <{if $val.answer_type=='1'}>
                    <span class="alert-danger">教师回复</span>
                    <{else}>
                    <span class="alert-success">学生回复</span>
                    <{/if}>
                </td>
                <td class="text-center">
                    <a target="_blank" title="<{$val.content}>"
                       href="<{$smarty.const._site_domain}>answer_show/index/<{$val.qid}>">
                        <{$val.content|truncate:30:'...'}>
                    </a>
                </td>
                <td class="text-center">
                    <{if !empty($val.sub_time)}>
                    <{$val.sub_time|date_format:'%Y-%m-%d %H:%M:%S'}>
                    <{else}>
                    暂无记录
                    <{/if}>
                </td>

                <td class="text-center">
                    <div class="btn-group" role="group">
                        <a href="#" class="del_btn btn btn-default btn-sm"
                           data-id="<{$val.id}>" data-title="<{$val.content|truncate:20:'...'}>">
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
        var id = $(this).data('id');
        var title = $(this).data('title');
        my_dialog('确认删除', '确定要删除回复<span class="text-danger">' + title + '</span>吗?删除后将无法恢复!', {
            btn_text: '删除',
            btn_class: 'danger',
            show_cancel: true,
            call_back: function () {
                $.ajax({
                    type: 'post',
                    url: '<{$smarty.const._admin_domain}><{$controller_name}>/del/' + id,
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