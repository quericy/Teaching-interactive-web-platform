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
        <li class="active">课件资料</li>
        <li><{$web_title}></li>
    </ol>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">课件资料统计汇总</h3>
        </div>
        <div class="panel-body">
            <label>课件数量</label>
            <div class="progress">
                <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0"
                     aria-valuemin="0" aria-valuemax="100"
                     style="min-width: 5em;width: <{($course_count/$all_counts*100)|string_format:'%.2f'}>%">
                    <span><{$course_count}>份(<{($course_count/$all_counts*100)|string_format:'%.2f'}>%)</span>
                </div>
            </div>

            <label>资料数量</label>
            <div class="progress">
                <div class="progress-bar progress-bar-success progress-bar-striped active" role="progressbar"
                     aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                     style="min-width: 5em;width:<{($data_count/$all_counts*100)|string_format:'%.2f'}>%">
                    <span><{$data_count}>份(<{($data_count/$all_counts*100)|string_format:'%.2f'}>%)</span>
                </div>
            </div>

            <label>提交课件的教师</label>
            <div class="progress">
                <div class="progress-bar progress-bar-danger progress-bar-striped active" role="progressbar"
                     aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                     style="min-width: 5em;width: <{($course_tid_count/$all_teachers*100)|string_format:'%.2f'}>%">
                    <span><{$course_tid_count}>人(<{($course_tid_count/$all_teachers*100)|string_format:'%.2f'}>%)</span>
                </div>
            </div>

            <label>提交资料的教师</label>
            <div class="progress">
                <div class="progress-bar progress-bar-warning progress-bar-striped active" role="progressbar"
                     aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"
                     style="min-width: 5em;width: <{($data_tid_count/$all_teachers*100)|string_format:'%.2f'}>%">
                    <span><{$data_tid_count}>人(<{($data_tid_count/$all_teachers*100)|string_format:'%.2f'}>%)</span>
                </div>
            </div>
        </div>
    </div>

</div>


<{include file="admin/footer.tpl"}>
<script type="text/javascript">


</script>
</body>
</html>