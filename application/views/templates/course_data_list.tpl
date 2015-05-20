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
<!--巨幕begin-->

<!--巨幕end-->


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