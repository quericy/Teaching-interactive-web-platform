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
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}><{$controller_name}>.css"/>
    <!--IE8 css query-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
    <!-- UEditor -->
    <script type="text/javascript" src="<{$smarty.const._site_third_party}>ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="<{$smarty.const._site_third_party}>ueditor/ueditor.all.min.js"></script>
</head>
<body>
<{include file="admin/nav.tpl"}>
<div class="content">
    <ol class="breadcrumb">
        <li class="active"><a href="<{$smarty.const._admin_domain}>">管理后台</a></li>
        <li class="active">课件资料</li>
        <li class="active"><a href="<{$smarty.const._admin_domain}>data_list">资料管理</a></li>
        <li><{$web_title}></li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <{if $is_edit=='1'}><span class="glyphicon glyphicon-edit"></span><{else}><span
                    class="glyphicon glyphicon-plus"></span><{/if}>
                <{$web_title}>
            </h3>
        </div>
        <div class="panel-body">

            <table id="edit_table" class="table table-striped table-hover table-condensed">
                <tr>
                    <td class="text-center" style="width:100px;"><label>资料ID:</label></td>
                    <td class="text-left">
                        <{if isset($data_info)}><{$data_info.did}><{else}>自动分配<{/if}>
                    </td>
                </tr>
                <tr>
                    <td class="text-center"><label for="title">资料名称:</label></td>
                    <td class="text-left">
                        <input id="title" type="text" class="form-control" placeholder="请输入资料名称"
                               value="<{if isset($data_info)}><{$data_info.title}><{/if}>"/>
                    </td>
                </tr>
                <tr>
                    <td class="text-center"><label>类型:</label></td>
                    <td class="text-left">
                        &nbsp;
                        <span><input type="radio" name="data_type" value="1">&nbsp;课件</span>
                        &nbsp;&nbsp;&nbsp;
                        <span><input type="radio" name="data_type" value="2" checked>&nbsp;资料</span>
                    </td>
                </tr>
                <!--<tr>
                    <td class="text-center"><label for="data_file">附件:</label></td>
                    <td class="text-left">
                        <input id="data_file" type="file" class="form-control"/>
                    </td>
                </tr>-->
                <tr>
                    <td class="text-center"><label for="content_area">正文内容:</label></td>
                    <td id="area_td" class="text-left">
                        <textarea id="content_area" style="width:100%;"><{if isset($data_info)}><{$data_info.content}><{/if}></textarea>
                        <a id="show_editor_btn" style="display: none;" href="javascript:void(0)">点击使用高级编辑器</a>
                    </td>
                </tr>
            </table>

        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <button id="save_btn" type="button" class="btn btn-success"
                    data-did="<{if isset($data_info)}><{$data_info.did}><{else}>0<{/if}>">
                <span class="glyphicon glyphicon-floppy-disk"></span>保存
            </button>
            <a href="<{$smarty.const._admin_domain}>data_list"
               onclick="if(confirm('确定放弃编辑返回列表页面?')==false)return false;" class="btn btn-primary">
                取消
            </a>
        </div>
    </div>
</div>


<{include file="admin/footer.tpl"}>
<script type="text/javascript">
    var ua_str = navigator.userAgent;
    var is_use_editor = '1';
    var ue;//编辑器对象
    if (ua_str.match(/Android/i) || ua_str.match(/Windows Phone/i) || ua_str.match(/iPhone/i) || ua_str.match(/iPod/i) || ua_str.match(/iPad/i)) {
        is_use_editor = '0';//移动端访问,默认不显示编辑器
    }
    if (is_use_editor == '1') {
        //初始化编辑器
        ue = UE.getEditor('content_area', {
            initialFrameHeight: 220
        });
    } else {
        $('#show_editor_btn').css('display', 'block');//移动端显示"点击使用高级编辑器"按钮
    }
    //点击显示高级编辑器
    $(document).delegate('#show_editor_btn', 'click', function () {
        if(is_use_editor=='0'){
            $('#show_editor_btn').css('display', 'none');
            is_use_editor='1';
            ue = UE.getEditor('content_area', {
                initialFrameHeight: 220
            });
            ue.setShow();
        }
    });
    //保存按钮ajax请求
    $(document).delegate('#save_btn', 'click', function () {
        var did = $(this).attr('data-did');
        var title = $('#title').val();
        if (is_use_editor == '1') {
            var content_area = ue.getContent();
        } else {
            var content_area = $('#content_area').text();
        }
        var data_type = 1;
        $("input[name='data_type']").each(function () {
            if (this.checked == true) {
                data_type = $(this).val();
            }
        });
        $('#save_btn').html('正在保存');
        $('#save_btn').attr('disabled', "disabled");
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._admin_domain}><{$controller_name}>/save_data',
            data:{did:did,title:title,data_type:data_type,content_area:content_area},
            success: function (res) {
                $('#save_btn').html('<span class="glyphicon glyphicon-floppy-disk"></span>保存');
                $('#save_btn').removeAttr('disabled');
                switch (res) {
                    case '1':
                        my_dialog('消息', '资料内容保存成功!', {
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
                        my_dialog('提示', '系统繁忙,请重试!', false);
                        break;
                    case '-2':
                        my_dialog('提示', '请输入资料名称!', false);
                        break;
                    case '-3':
                        my_dialog('提示', '修改的资料不存在!', false);
                        break;
                    default :
                        my_dialog('提示', '操作失败', false);
                        break;
                }
            }
        });
    });
</script>
</body>
</html>