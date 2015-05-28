<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理后台-<{$web_title}></title>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>bootstrap.min.css"/>
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}>default.css"/>
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._admin_css}>index.css"/>
    <!--IE8 css查询修复begin-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
    <!--IE8 css查询修复end-->
    <!--图表控件begin-->
    <script src="<{$smarty.const._site_js}>Chart.min.js"></script>
    <!--[if lte IE 8]>
    <script src="<{$smarty.const._site_js}>excanvas.js"></script>
    <![endif]-->
    <script src="<{$smarty.const._site_js}>modernizr.min.js"></script>
    <!--图表控件end-->
</head>
<body>
<{include file="admin/nav.tpl"}>
<div class="content">
    <ol class="breadcrumb">
        <li class="active">管理后台</li>
        <li class="active">仪表板</li>
        <li>后台概览</li>
    </ol>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">系统状态</h3>
        </div>
        <div class="panel-body">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="sys_div" class="sys_div">
                        <canvas id="sys_status_1" class="sys_canvas" width="150"></canvas>
                        <h4 class="text-muted text-center">作业完成情况</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="sys_div">
                        <canvas id="sys_status_2" class="sys_canvas" width="150"></canvas>
                        <h4 class="text-muted text-center">用户类型分布</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="sys_div">
                        <canvas id="sys_status_3" class="sys_canvas" width="150"></canvas>
                        <h4 class="text-muted text-center">资源类型分布</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="sys_div">
                        <canvas id="sys_status_4" class="sys_canvas" width="150"></canvas>
                        <h4 class="text-muted text-center">提问答疑状况</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-sm-10">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">活跃用户</h3>
                </div>
                <div class="panel-body">
                    <div class="user_info_chart_canvas">
                        <canvas id="UserInfoChart" height="200"></canvas>
                    </div>
                </div>
                <div class="panel-footer">标识颜色:&nbsp;&nbsp;<span class="label label-default">教师</span>&nbsp;&nbsp;<span
                            class="label label-primary">学生</span></div>
            </div>
        </div>
        <div class="col-md-6 col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">系统信息</h3>
                </div>
                <h5>&nbsp;&nbsp;当前系统共有:</h5>
                <table class="table table-striped info_tips_table">
                    <tr>
                        <td>用户:</td>
                        <td>教师<span class="label label-success"><{$count_cache.admin_count}></span>人</td>
                        <td>学生<span class="label label-success"><{$count_cache.user_count}></span>人</td>
                    </tr>
                    <tr>
                        <td>作业:</td>
                        <td>发布<span class="label label-success"><{$count_cache.all_work_count}></span>份</td>
                        <td>上交<span class="label label-success"><{$count_cache.work_process_count}></span>份</td>
                    </tr>
                    <tr>
                        <td>课件资料:</td>
                        <td>课件<span class="label label-success"><{$count_cache.course_count}></span>份</td>
                        <td>资料<span class="label label-success"><{$count_cache.data_count}></span>份</td>
                    </tr>
                    <tr>
                        <td>答疑:</td>
                        <td>提问<span class="label label-success"><{$count_cache.question_count}></span>条</td>
                        <td>回复<span class="label label-success"><{$count_cache.answer_count}></span>条</td>
                    </tr>
                </table>
                <div class="panel-footer">
                    <div class="text-right">缓存生成时间:<code><{$count_cache.cache_time}></code></div>
                </div>
            </div>
        </div>
    </div>

</div>
<script type="text/javascript">
    var lineChartData = {
        labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        datasets: [
            {
                fillColor: "rgba(119,119,119,0.5)",
                strokeColor: "rgba(119,119,119,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                data: [12, 8, 15, 6, 13, 9, 7]
            },
            {
                fillColor: "rgba(51,122,183,0.5)",
                strokeColor: "rgba(51,122,183,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [2, 1, 3, 1, 0, 2, 3]
            }
        ]
    };
    var sys_1_data = [
        {
            label: '未批改',
            value: <{$count_cache.upload_work_count}>,
            color: "#F7464A"
        },
        {
            label: '已批改',
            value:  <{$count_cache.mark_work_count}>,
            color: "#E2EAE9"
        }
    ]
    var sys_2_data = [
        {
            label: '学生',
            value: <{$count_cache.user_count}>,
            color: "#69D2E7"
        },
        {
            label: '教师',
            value: <{$count_cache.admin_count}>,
            color: "#E2EAE9"
        }
    ]
    var sys_3_data = [
        {
            label: '课件',
            value: <{$count_cache.course_count}>,
            color: "#97BBCD"
        },
        {
            label: '资料',
            value: <{$count_cache.data_count}>,
            color: "#F38630"
        },
        {
            label: '提问',
            value: <{$count_cache.question_count}>,
            color: "#E0E4CC"
        }
    ]
    var sys_4_data = [
        {
            label: '开启的提问',
            value: <{$count_cache.open_question_count}>,
            color: "#337AB7"
        },
        {
            label: '关闭的提问',
            value: <{$count_cache.close_question_count}>,
            color: "#E2EAE9"
        },
        {
            label: '答疑回复',
            value: <{$count_cache.answer_count}>,
            color: "#E0E4CC"
        }
    ]
    new Chart(get_canvas('UserInfoChart')).Line(lineChartData, {scaleShowLabels : true, animation: Modernizr.canvas,animationSteps:120,scaleFontColor : "#767C8D"});
    new Chart(get_canvas('sys_status_1')).Doughnut(sys_1_data);
    new Chart(get_canvas('sys_status_2')).Doughnut(sys_2_data);
    new Chart(get_canvas('sys_status_3')).Doughnut(sys_3_data);
    new Chart(get_canvas('sys_status_4')).Doughnut(sys_4_data);
    //根据id获取canvas画布(兼容IE8)
    function get_canvas(canvas_id) {
        // var ctx = document.getElementById("introChart").getContext("2d");
        var canvas = document.getElementById(canvas_id);
        if (typeof window.G_vmlCanvasManager != "undefined") {
            var canvas = window.G_vmlCanvasManager.initElement(canvas);
            var ctx = canvas.getContext("2d");
        } else {
            var ctx = canvas.getContext("2d");
        }
        return ctx;
    }
</script>
<{include file="admin/footer.tpl"}>
</body>
</html>