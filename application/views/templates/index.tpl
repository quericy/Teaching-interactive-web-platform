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
    <link href="<{$smarty.const._site_css}>index.css" rel="stylesheet">
    <!--IE8 css query-->
    <script src="<{$smarty.const._site_js}>respond.min.js"></script>
</head>
<body>
<{include file="header.tpl"}>
<!--巨幕begin-->
<div id="main-slider" class="carousel">
    <div class="carousel-inner-fix">
        <div class="item active">
            <div class="container">
                <div class="carousel-content">
                    <h1>教学互动平台</h1>

                    <p class="lead">促进课后在线教学互动，提高教与学的效率。</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!--巨幕end-->
<!--功能栏begin-->
<div id="services">
    <div class="container">
        <div class="box first">
            <div class="row">
                <div class="col-md-4 col-sm-5 smooth-div">
                    <div class="center">
                        <a href="#UpCourseWare">
                            <span class="glyphicon  glyphicon-cloud-upload icon-md icon-color1"></span>
                            <h4>上传课件</h4>
                        </a>

                        <p>教师可以轻松上传课件到云端，并进行分类整理规划，以便教学使用。公开的课件可自由高速的下载和传阅，进一步提升教学效果。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 smooth-div">
                    <div class="center">
                        <a href="#UpCourseWare">
                            <span class="glyphicon glyphicon-folder-open icon-md icon-color2"></span>
                            <h4>教学资料</h4>
                        </a>

                        <p>教师不仅可以上传课件，还可发布教学资料，实时展现在网络之上。每一份详尽的教学资料，不仅可供学生参考查阅，也可分享交流心得体会。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 smooth-div">
                    <div class="center">
                        <a href="#WorkSection">
                            <span class="glyphicon glyphicon-edit icon-md icon-color3"></span>
                            <h4>发布作业</h4>
                        </a>

                        <p>教师可发布作业，规定任务要求和时限，批阅后的结果将反馈给学生。不仅能辅助教师检查作业完成情况，还有助于教师了解学生的知识掌握情况和学习效率。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 smooth-div">
                    <div class="center">
                        <a href="#main-slider">
                            <span class="glyphicon glyphicon-eye-open icon-md icon-color4"></span>
                            <h4>在线浏览</h4>
                        </a>

                        <p>学生可进行在线浏览课件,参考资料与作业，当有遗忘时可高效地进行查阅。同时，网站根据手机自动适配，当使用手机时，也能获得舒适的交互体验 。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 smooth-div">
                    <div class="center">
                        <a href="#WorkSection">
                            <span class="glyphicon glyphicon-level-up icon-md icon-color5"></span>
                            <h4>上交作业</h4>
                        </a>

                        <p>学生完成作业后，可将作业提交给教师。系统将自行统计学生的作业缴交情况，方便教学管理，也可督促学生及时完成学习任务。</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-5 smooth-div">
                    <div class="center">
                        <a href="#WorkSection">
                            <span class="glyphicon glyphicon-comment icon-md icon-color6"></span>
                            <h4>师生互动</h4>
                        </a>

                        <p>师生可以在线答疑，探讨问题和进行教学互动，通过沟通解决疑问和阻碍。即使教师不在线，也可通过留言板进行留言，教师会在稍后进行详细解答。</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--功能栏end-->
<!--课件资料栏begin-->
<div id="UpCourseWare">
    <div class="container">
        <div class="box center">
            <h2>课件资料</h2>

            <p class="lead">最新的课件和资料均由教师上传，同学们可自行查阅和下载。</p>

            <div id="pricing-table" class="row">
                <div class="col-sm-4 ">
                    <ul class="plan">
                        <li class="plan-name">最新课件</li>
                        <li><a href="">关于某课题的课件</a></li>
                        <li><a href="">关于某课题的课件</a></li>
                        <li><a href="">关于某课题的课件</a></li>
                        <li><a href="">关于某课题的课件</a></li>
                        <li><a href="">关于某课题的课件</a></li>
                        <li><a href="">关于某课题的课件</a></li>
                        <li><a href="">关于某课题的课件</a></li>
                        <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">更多</a></li>
                    </ul>
                </div>
                <div class="col-sm-4">
                    <ul class="plan featured">
                        <li class="plan-name">课件资料</li>
                        <li class="plan-price"><span class="glyphicon  glyphicon-cloud-upload"></span>上传</li>
                        <li>
                            <h1><a class="btn  btn-lg btn-primary" href="#" role="button">教师课件</a></h1>
                        </li>
                        <li>
                            <h1><a class="btn  btn-lg btn-success" href="#" role="button">教学资料</a></h1>
                        </li>
                        <li class=""><br>注意: <br>课件和资料的上传均由教师操作，同学们如有疑问，可以在每个课件和资料下方留言。</li>
                    </ul>
                </div>
                <div class="col-sm-4 ">
                    <ul class="plan">
                        <li class="plan-name">最新资料</li>
                        <li><a href="">资料:课程设计资料列表</a></li>
                        <li><a href="">资料:课程设计资料列表</a></li>
                        <li><a href="">资料:课程设计资料列表</a></li>
                        <li><a href="">资料:课程设计资料列表</a></li>
                        <li><a href="">资料:课程设计资料列表</a></li>
                        <li><a href="">资料:课程设计资料列表</a></li>
                        <li><a href="">资料:课程设计资料列表</a></li>
                        <li class="plan-action"><a href="#" class="btn btn-primary btn-lg">更多</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<!--课件资料栏end-->
<!--作业栏begin-->
<div id="WorkSection" class="container box center">
    <div id="work-slider" class="carousel">
        <div class="carousel-inner-fix">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-sm-3 smoove-up-div">
                        <div>
                            <a href=""><span class="glyphicon glyphicon-edit work-slider-color1"></span></a>
                        </div>
                        <div class="stat-text">
                            <a href="">
                                <h3 class="work-border-bottom1">1236</h3>
                                <h6>已发布作业</h6>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-3 smoove-up-div">
                        <div>
                            <a href="">
                                <span class="glyphicon glyphicon-level-up work-slider-color2"></span>
                            </a>
                        </div>
                        <div class="stat-text">
                            <a href="">
                                <h3 class="work-border-bottom2">985</h3>
                                <h6>已上交作业</h6>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-3 smoove-up-div">
                        <div>
                            <a href=""><span class="glyphicon glyphicon-user work-slider-color3"></span></a>
                        </div>
                        <div class="stat-text">
                            <a href="">
                                <h3 class="work-border-bottom3">36</h3>
                                <h6>在线教师</h6>
                            </a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-sm-3 smoove-up-div">
                        <div>
                            <a href="">
                                <span class="glyphicon glyphicon-heart-empty work-slider-color4"></span>
                            </a>
                        </div>
                        <div class="stat-text">
                            <a href="">
                                <h3 class="work-border-bottom4">108</h3>
                                <h6>最新留言</h6>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--作业栏end-->
<{include file="footer.tpl"}>
<script type="text/javascript">

</script>
</body>
</html>