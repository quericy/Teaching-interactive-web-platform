<div class=" panel panel-default">
    <div class="panel-body">
        <{if isset($user_info['is_login'])&&$user_info['is_login']=='true'}>
        <div class="row container-fluid">
            <div class="pull-left" style="margin-right: 10px;">
                <img src="<{$user_info['user_logo_uri']}>" alt="bar Identicon"
                     style="border:#fff 1px solid;border-radius: 2px;"/>
            </div>
            <div class="pull-left">
                <label><{$user_info['user_name']}></label>
                <br/>
                <{if $user_info['user_type']=='1'}>
                <div class="badge">教师</div>
                <{else}>
                <{if $user_info['user_type']=='2'}>
                <div class="badge">管理员</div>
                <{else}>
                <div class="badge">学生</div>
                <{/if}>
                <{/if}>
            </div>
        </div>
    <hr/>
        <div class="row container-fluid">
            本次登录:
            <{if empty($user_info['login_time'])}>
            --
            <{else}>
            <{$user_info['login_time']|date_format:'%Y-%m-%d %H:%M:%S'}>
            <{/if}>
            <br/>
            上次登录:
            <{if empty($user_info['last_login_time'])}>
            从未登录
            <{else}>
            <{$user_info['last_login_time']|date_format:'%Y-%m-%d %H:%M:%S'}>
            <{/if}>
        </div>
        <{else}>
        <label>教学互动平台</label>
    <hr/>
        <div class="center">
            <a href="<{$smarty.const._site_domain}>user_reg" class="btn btn-default">现在注册</a>
        </div>
        <p></p>

        <div class="center">
            <p>已注册同学请<a href="<{$smarty.const._site_domain}>user_login">登录</a></p>
        </div>
        <{/if}>
    </div>
</div>