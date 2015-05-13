<!--顶部导航begin-->
<div class="navbar navbar-default" style="margin-bottom: 0;" role="navigation">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">导航栏</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a href="<{$smarty.const._admin_domain}>"><span class="navbar-brand"><span class="glyphicon glyphicon-home"></span>&nbsp;管理后台</span></a>
    </div>

    <div class="navbar-collapse collapse" style="height: 1px;">
        <ul id="main-menu" class="nav navbar-nav navbar-right">
        <!--左侧导航预留位置-->
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-user" style="position:relative;top: 3px;"></span>
                    管理员
                    <i class="glyphicon glyphicon-triangle-bottom"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">个人信息</a></li>
                    <li><a href="#">设置</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" href="<{$smarty.const._admin_domain}>login/out">退出</a></li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!--顶部导航end-->
<!--左侧边栏begin-->
<div class="sidebar-nav">
    <ul>
        <li><a href="#" data-target=".dashboard-menu" class="nav-header <{if $nav_show!='dashboard'}>collapsed<{/if}>" data-toggle="collapse">
                <i class="glyphicon glyphicon-scale"></i>&nbsp;仪表板<i class="fa-collapse glyphicon"></i>
            </a></li>
        <li><ul class="dashboard-menu nav nav-list collapse <{if $nav_show=='dashboard'}>in<{/if}>">
                <li><a href="<{$smarty.const._admin_domain}>"><span class="glyphicon glyphicon-triangle-right"></span> 后台概览</a></li>
                <li><a href="<{$smarty.const._site_domain}>" target="_blank"><span class="glyphicon glyphicon-triangle-right"></span> 前台站点</a></li>
            </ul></li>

        <li><a href="#" data-target=".work-menu" class="nav-header <{if $nav_show!='work'}>collapsed<{/if}>" data-toggle="collapse">
                <i class="glyphicon glyphicon-edit"></i>&nbsp;作业管理<i class="fa-collapse glyphicon"></i><span class="label label-info">+3</span>
            </a></li>
        <li><ul class="work-menu nav nav-list collapse <{if $nav_show=='work'}>in<{/if}>">
                <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span> 作业列表</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span> 添加作业</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span> 完成情况</a></li>
            </ul></li>

        <li><a href="#" data-target=".data-menu" class="nav-header <{if $nav_show!='data'}>collapsed<{/if}>" data-toggle="collapse">
                <i class="glyphicon glyphicon-folder-open"></i>&nbsp;课件资料<i class="fa-collapse glyphicon"></i>
            </a></li>
        <li><ul class="data-menu nav nav-list collapse <{if $nav_show=='data'}>in<{/if}>">
                <li><a href="<{$smarty.const._admin_domain}>course_list"><span class="glyphicon glyphicon-triangle-right"></span> 课件列表</a></li>
                <li><a href="<{$smarty.const._admin_domain}>data_list"><span class="glyphicon glyphicon-triangle-right"></span> 资料列表</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span> 文件上传</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span> 统计汇总</a></li>
            </ul></li>

        <li><a href="#" data-target=".answer-menu" class="nav-header <{if $nav_show!='answer'}>collapsed<{/if}>" data-toggle="collapse">
                <i class="glyphicon glyphicon-comment"></i>&nbsp;答疑管理<i class="fa-collapse glyphicon"></i>
            </a></li>
        <li><ul class="answer-menu nav nav-list collapse <{if $nav_show=='answer'}>in<{/if}>">
                <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span> 留言列表</a></li>
                <li><a href="#"><span class="glyphicon glyphicon-triangle-right"></span> 统计汇总</a></li>
            </ul></li>

        <li><a href="#" data-target=".system-menu" class="nav-header <{if $nav_show!='system'}>collapsed<{/if}>" data-toggle="collapse">
                <i class="glyphicon glyphicon-cog"></i>&nbsp;系统设置<i class="fa-collapse glyphicon"></i>
            </a></li>
        <li><ul class="system-menu nav nav-list collapse <{if $nav_show=='system'}>in<{/if}>">
                <li><a href="<{$smarty.const._admin_domain}>user_list"><span class="glyphicon glyphicon-triangle-right"></span> 学生管理</a></li>
                <li><a href="<{$smarty.const._admin_domain}>admin_list"><span class="glyphicon glyphicon-triangle-right"></span> 教师管理</a></li>
                <li><a href="<{$smarty.const._admin_domain}>sys_setting"><span class="glyphicon glyphicon-triangle-right"></span> 系统参数</a></li>
                <li><a href="<{$smarty.const._admin_domain}>log_list"><span class="glyphicon glyphicon-triangle-right"></span> 日志记录</a></li>
            </ul></li>
    </ul>
</div>
<!--左侧边栏end-->