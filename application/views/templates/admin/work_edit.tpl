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
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>bootstrap-datetimepicker.min.css"/>
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}>default.css"/>
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
        <li class="active">作业管理</li>
        <li class="active"><a href="<{$smarty.const._admin_domain}>work_list">作业列表</a></li>
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
                    <td class="text-center" style="width:100px;"><label>作业ID:</label></td>
                    <td class="text-left">
                        <{if isset($work_info)}><{$work_info.wid}><{else}>自动分配<{/if}>
                    </td>
                </tr>
                <tr>
                    <td class="text-center"><label for="title">作业名称:</label></td>
                    <td class="text-left">
                        <input id="title" type="text" class="form-control" placeholder="请输入作业名称"
                               value="<{if isset($work_info)}><{$work_info.title}><{/if}>"/>
                    </td>
                </tr>
                <tr>
                    <td class="text-center"><label>起止时间:</label></td>
                    <td class="text-left">
                        开始:
                        <div class="datetimepicker input-group date col-md-4">
                            <input id="start_time" class="form-control" size="16" type="text"  data-date-format="yyyy-mm-dd hh:ii" value="<{if isset($work_info)}><{$work_info.start_time}><{else}><{$smarty.now|date_format:'%Y-%m-%d %H:%M'}><{/if}>" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                        结束:
                        <div class="datetimepicker input-group date col-md-4">
                            <input id="end_time" class="form-control" size="16" type="text"  data-date-format="yyyy-mm-dd hh:ii" value="<{if isset($work_info)}><{$work_info.start_time}><{else}><{$smarty.now|date_format:'%Y-%m-%d %H:%M'}><{/if}>" readonly>
                            <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                        </div>
                    </td>
                </tr>
               
                <tr>
                    <td class="text-center"><label for="content_area">正文内容:</label></td>
                    <td id="area_td" class="text-left">
                        <textarea id="content_area" style="width:100%;"><{if isset($work_info)}><{$work_info.content}><{/if}></textarea>
                        <a id="show_editor_btn" style="display: none;" href="javascript:void(0)">点击使用高级编辑器</a>
                    </td>
                </tr>
            </table>

        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div id="save_btn"   class="btn btn-success"
                    data-wid="<{if isset($work_info)}><{$work_info.wid}><{else}>0<{/if}>">
                <span class="glyphicon glyphicon-floppy-disk"></span>保存
            </div>
            <a href="<{$smarty.const._admin_domain}>work_list"
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
        var wid = $(this).attr('data-wid');
        var title = $('#title').val();
        if (is_use_editor == '1') {
            var content_area = ue.getContent();
        } else {
            var content_area = $('#content_area').text();
        }
        //起止时间
        var start_time=$('#start_time').val();
        var end_time=$('#end_time').val();
        if(start_time==''||end_time==''){
            my_dialog('提示', '请选择开始和结束日期', false);
            return;
        }
        $('#save_btn').html('正在保存');
        $('#save_btn').attr('disabled', "disabled");
        $.ajax({
            type: 'post',
            url: '<{$smarty.const._admin_domain}><{$controller_name}>/save_work',
            data:{wid:wid,title:title,content_area:content_area,start_time:transdate(start_time),end_time:transdate(end_time)},
            success: function (res) {
                $('#save_btn').html('<span class="glyphicon glyphicon-floppy-disk"></span>保存');
                $('#save_btn').removeAttr('disabled');
                var return_arr = eval('(' + res + ')');
                switch (return_arr.status) {
                    case '1':
                        my_dialog('消息', return_arr.msg, {
                            btn_class: 'info',
                            call_back: function () {
                                location.href='<{$smarty.const._admin_domain}>work_list';
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
    });
    //时间戳转换
    function transdate(TimeStr){
        var date=new Date();
        date.setFullYear(TimeStr.substring(0,4));
        date.setMonth(TimeStr.substring(5,7)-1);
        date.setDate(TimeStr.substring(8,10));
        date.setHours(TimeStr.substring(11,13));
        date.setMinutes(TimeStr.substring(14,16));
        date.setSeconds(0);//秒数为0
        return Date.parse(date)/1000;
    }
    //时间控件初始化
    $('.datetimepicker').datetimepicker({
        language: 'zh-CN',
        format: 'yyyy-mm-dd hh:ii',
        todayBtn:  1,
        autoclose: 1,
        showMeridian: true,
        todayHighlight: 1,
        pickerPosition: "bottom-left",
        startDate:new Date()
    });
</script>
</body>
</html>