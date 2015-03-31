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
                <div class="col-md-3 col-sm-6">1

                </div>
                <div class="col-md-3 col-sm-6">2

                </div>
                <div class="col-md-3 col-sm-6">3

                </div>
                <div class="col-md-3 col-sm-6">4

                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-sm-10">
            <div class="panel panel-success">
                <div class="panel-heading">
                    <h3 class="panel-title">用户数量</h3>
                </div>
                <div class="panel-body">

                    <canvas id="introChart" height="250" width="auto"></canvas>

                </div>
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

    // var ctx = document.getElementById("introChart").getContext("2d");
    var canvas = document.getElementById("introChart");
    if (typeof window.G_vmlCanvasManager != "undefined") {
        var canvas = window.G_vmlCanvasManager.initElement(canvas);
        var ctx = canvas.getContext("2d");
    } else {
        var ctx = canvas.getContext("2d");
    }

    var lineChartData = {
        labels: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
        datasets: [
            {
                fillColor: "rgba(220,220,220,0.5)",
                strokeColor: "rgba(220,220,220,1)",
                pointColor: "rgba(220,220,220,1)",
                pointStrokeColor: "#fff",
                data: [65, 59, 90, 81, 56, 55, 40]
            },
            {
                fillColor: "rgba(151,187,205,0.5)",
                strokeColor: "rgba(151,187,205,1)",
                pointColor: "rgba(151,187,205,1)",
                pointStrokeColor: "#fff",
                data: [28, 48, 40, 19, 96, 27, 100]
            }
        ]
    };
    new Chart(ctx).Line(lineChartData, {scaleShowLabels : true, animation: Modernizr.canvas,animationSteps:120,scaleFontColor : "#767C8D"});

</script>
<{include file="admin/footer.tpl"}>
</body>
</html>