<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>管理后台-<{$web_title}></title>
    <!-- Bootstrap -->
    <link type="text/css" rel="stylesheet" href="<{$smarty.const._site_css}>bootstrap.min.css"/>
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
                    <div style="width: 160px;margin: 0 auto;">
                        <canvas id="sys_status_1" width="150" style="margin:5px auto;text-align: center"></canvas>
                        <h4 class="text-muted text-center">作业完成情况</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div style="width: 160px;margin: 0 auto;">
                        <canvas id="sys_status_2" width="150" style="margin:5px auto;text-align: center"></canvas>
                        <h4 class="text-muted text-center">用户类型分布</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div style="width: 160px;margin: 0 auto;">
                        <canvas id="sys_status_3" width="150" style="margin:5px auto;text-align: center"></canvas>
                        <h4 class="text-muted text-center">资料类型分布</h4>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div style="width: 160px;margin: 0 auto;">
                        <canvas id="sys_status_4" width="150" style="margin:5px auto;text-align: center"></canvas>
                        <h4 class="text-muted text-center">系统资源状况</h4>
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
                    <canvas id="UserInfoChart" height="250"></canvas>
                </div>
                <div class="panel-footer">标识颜色:<span class="label label-default">教师</span>&nbsp;&nbsp;<span class="label label-primary">学生</span></div>
            </div>
        </div>
        <div class="col-md-6 col-sm-10">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">系统信息</h3>
                </div>
                <div class="panel-body">

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
                data: [65, 59, 90, 81, 56, 55, 40]
            },
            {
                fillColor: "rgba(51,122,183,0.5)",
                strokeColor: "rgba(51,122,183,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [28, 48, 40, 19, 96, 27, 100]
            }
        ]
    };
    var sys_1_data = [
        {
            label: '已完成',
            value: 30,
            color: "#F7464A"
        },
        {
            label: '未完成',
            value: 50,
            color: "#E2EAE9"
        }
    ]
    var sys_2_data = [
        {
            label: '学生',
            value: 90,
            color: "#69D2E7"
        },
        {
            label: '教师',
            value: 20,
            color: "#E2EAE9"
        }
    ]
    var sys_3_data = [
        {
            label: '课件',
            value: 30,
            color: "#97BBCD"
        },
        {
            label: '资料',
            value: 40,
            color: "#F38630"
        },
        {
            label: '答疑',
            value: 20,
            color: "#E0E4CC"
        }
    ]
    var sys_4_data = [
        {
            label: '已使用',
            value: 20,
            color: "#337AB7"
        },
        {
            label: '未使用',
            value: 80,
            color: "#E2EAE9"
        }
    ]
    var ctx = get_canvas('UserInfoChart');
    var sys_1_ctx = get_canvas('sys_status_1');
    var sys_2_ctx = get_canvas('sys_status_2');
    var sys_3_ctx = get_canvas('sys_status_3');
    var sys_4_ctx = get_canvas('sys_status_4');
    new Chart(ctx).Line(lineChartData, {scaleShowLabels : true, animation: Modernizr.canvas,animationSteps:120,scaleFontColor : "#767C8D"});
    new Chart(sys_1_ctx).Doughnut(sys_1_data);
    new Chart(sys_2_ctx).Doughnut(sys_2_data);
    new Chart(sys_3_ctx).Doughnut(sys_3_data);
    new Chart(sys_4_ctx).Doughnut(sys_4_data);
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