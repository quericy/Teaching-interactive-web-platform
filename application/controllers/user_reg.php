<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/23 0023
 * Time: 21:39
 */

class User_Reg extends CI_Controller
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
        $this->assign_arr['web_title'] = '学生注册' . ' - ' . $sys_setting['web_name'];//站点名称
        $this->assign_arr['nav_show'] = '';
        $this->assign_arr['user_info'] = $this->common_cls->show_user_info();//登录信息展示
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('user_reg.tpl', $this->assign_arr);
    }

    /**
     * 验证码展示方法
     */
    public function get_varify_code()
    {
//        if(!isset($_SESSION)){
//            session_start();
//        }
//        var_dump($_SESSION['captcha']);
        $this->load->library('varify_code');
        $this->varify_code->get_image();
    }

    /**
     * 用户注册验证函数
     */
    public function user_reg_check()
    {
        $user_name = $this->input->post('user_name', true);
        $user_pwd = $this->input->post('user_pwd', true);
        $email = $this->input->post('email', true);
        $verify_code = $this->input->post('verify_code', true);
        if (!isset($_SESSION)) {
            session_start();
        }
        if(empty($_SESSION['captcha'])){
            echo $this->common_cls->json_output('-1', '验证码错误');
            return;
        }
        if(mb_strtoupper($_SESSION['captcha'])!==mb_strtoupper($verify_code)){
            $_SESSION['captcha']=null;//验证码错误直接失效
            echo $this->common_cls->json_output('-1', '验证码错误');
            return;
        }
        if(empty($user_name)||empty($user_pwd)||empty($email)){
            echo $this->common_cls->json_output('-2', '注册信息填写不完整');
            return;
        }
        if(strlen($user_pwd)<6){
            echo $this->common_cls->json_output('-2', '密码至少需要6个字符长度');
            return;
        }
        if (!preg_match('/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/',$email)){
            echo $this->common_cls->json_output('-2', '邮箱格式不正确');
            return;
        }
        $this->load->model('user','user_cls');
        if($this->user_cls->get_counts(array('user_name'=>$user_name))>0){
            echo $this->common_cls->json_output('-2', '用户名已存在');
            return;
        }
        //注册用户
        $this->user_cls->user_register($user_name,$user_pwd,$email,'1');
        echo $this->common_cls->json_output('1', '注册成功');
    }
}

/* End of file user_reg.php */
/* Location: ./application/controllers/user_reg.php */