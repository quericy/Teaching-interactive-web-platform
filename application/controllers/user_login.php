<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/22 0022
 * Time: 20:31
 */
class User_Login extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        //系统设置缓存
        $sys_setting = $this->cache_cls->get_sys_cache();
        $this->assign_arr['web_name'] = $sys_setting['web_name'];
        $this->assign_arr['cookie_time'] = $sys_setting['cookie_time'];
        $this->assign_arr['web_title'] = '课件资料' . ' - ' . $sys_setting['web_name'];//站点名称
        $this->assign_arr['nav_show'] = '';
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('user_login.tpl', $this->assign_arr);
    }

    public function user_login_check()
    {
        $user_name = $this->input->post('user_name', true);
        $user_pwd = $this->input->post('user_pwd', true);
        $auto_login = $this->input->post('auto_login', true);
        $ip = $this->input->ip_address();//登录的ip地址
        $now_time = time();
        if (empty($user_name) || empty($user_pwd)) {
            echo $this->common_cls->json_output('-2', '输入信息不完整');
            return;
        }
        $auto_login = $auto_login == '1' ?: '0';

        $this->load->model('user', 'user_cls');
        $user_arr = $this->user_cls->user_login($user_name, $user_pwd);
        if (empty($user_arr)) {
            echo $this->common_cls->json_output('-1', '用户名或密码错误');
            return;
        }
        if ($user_arr['status'] != '1') {
            echo $this->common_cls->json_output('-1', '账号被禁用');
            return;
        }
        $token_arr['id'] = $user_arr['uid'];
        $token_arr['user_name'] = $user_arr['user_name'];
        $token_arr['type'] = '0';//学生类型为0
        $token_arr['status'] = $user_arr['status'];
        $token_arr['last_login_time'] = $user_arr['login_time'];
        $token_arr['login_time'] = $now_time;
        $token_arr['login_ip'] = $ip;
        //生成token
        $token_arr['token'] = $this->common_cls->get_user_token($token_arr);
        $token_arr['auto_login'] = $auto_login;
        $cookie_time=$this->cache_cls->get_sys_cache();
        $token_arr['cookie_time']=$cookie_time['cookie_time'];
        //更新登录信息
        $this->user_cls->update_login_time($user_arr['uid'],$now_time,$ip);
        //输出登录成功信息
        echo $this->common_cls->json_output('1', 'ok', $token_arr);
    }

    /**
     * 退出登录
     */
    public function login_out()
    {
        $this->common_cls->login_out(_site_domain);
    }
}

/* End of file user_login.php */
/* Location: ./application/controllers/user_login.php */