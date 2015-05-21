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
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">课件列表</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            Cras justo odio
                        </a>
                        <a href="#" class="list-group-item">Dapibus ac facilisis inDapibus ac facilisis in<span
                                    class="pull-right" style="color:#ccc;">2015-03-23</span></a>
                        <a href="#" class="list-group-item">Morbi leo risus</a>
                        <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                        <a href="#" class="list-group-item">Vestibulum at eros</a>
                    </div>
                </div>
            </div>
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">资料列表</h3>
                </div>
                <div class="panel-body">
                    <div class="list-group">
                        <a href="#" class="list-group-item">
                            Cras justo odio
                        </a>
                        <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                        <a href="#" class="list-group-item">Morbi leo risus</a>
                        <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                        <a href="#" class="list-group-item">Vestibulum at eros</a>
                    </div>
                </div>
            </div>
        </div>
        <!--左侧列表end-->
        <!--右侧列表begin-->
        <div class="col-md-4">
            <div class=" panel panel-default">
                <div class="panel-body">
                    <label>教学互动平台</label>
                    <hr/>
                    <div class="center">
                        <div class=" btn btn-default">现在注册</div>
                    </div>
                    <p></p>

                    <div class="center">
                        <p>已注册同学请<a href="#">登录</a></p>
                    </div>
                </div>
            </div>
            <div class=" panel panel-default">
                <div class="panel-heading">
                    <h5 class="panel-title">最新发布</h5>
                </div>
                <div class="list-group">
                    <a href="#" class="list-group-item">
                        Cras justo odio
                    </a>
                    <a href="#" class="list-group-item">Dapibus ac facilisis in</a>
                    <a href="#" class="list-group-item">Morbi leo risus</a>
                    <a href="#" class="list-group-item">Porta ac consectetur ac</a>
                    <a href="#" class="list-group-item">Vestibulum at eros</a>
                </div>

            </div>
        </div>
        <!--右侧列表end-->
    </div>
</div>
<!--列表end-->
<div id="footer" class="row">
    <div  >
        <div class="center">
            教学互动平台 Version: 1.0.0
        </div>
        <p class="pull-right">© 2015 Powered By chenyi	 ,All Rights Reserved.</p>
    </div>
</div>

<script src="<{$smarty.const._site_js}>jquery.min.js"></script>
<script src="<{$smarty.const._site_js}>bootstrap.min.js"></script>
<script src="<{$smarty.const._site_js}>smoothscroll.js"></script>
<script src="<{$smarty.const._site_js}>jquery.smoove.min.js"></script>
<script type="text/javascript">
    //平滑滚动
    $('.smooth-div > div').click(function (event) {
        event.preventDefault();
        var target = $(this).find('>a').prop('hash');
        $('html, body').animate({
            scrollTop: $(target).offset().top
        }, 500);
    });
    if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.match(/8./i) == "8.") {
        //IE8 不调用渐显
    } else {
        //元素渐显
        $('.plan').smoove({
//            offset  : '15%',
//            moveY   : '100px'
        });
        $('.smoove-up-div').smoove({
            moveY: '100px'
        });
    }

</script>
</body>
</html>