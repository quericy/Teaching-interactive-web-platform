<div class=" panel panel-default">
    <div class="panel-body">
        <{if isset($user_info['is_login'])&&$user_info['is_login']=='true'}>
        <div class="row container-fluid">
            <img src="<{$user_info['user_logo_uri']}>" alt="bar Identicon" style="border:#fff 1px solid;border-radius: 2px;" />
            <label><{$user_info['user_name']}></label>
        </div>
        <{else}>
        <label>教学互动平台</label>
    <hr/>
        <div class="center">
            <div class=" btn btn-default">现在注册</div>
        </div>
        <p></p>
        <div class="center">
            <p>已注册同学请<a href="<{$smarty.const._site_domain}>user_login">登录</a></p>
        </div>
        <{/if}>
    </div>
</div>