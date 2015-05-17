<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/3/26 0026
 * Time: 22:36
 */
class Login extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();
        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '教师登录';
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('admin/login.tpl', $this->assign_arr);
    }

    /**
     * 登录验证函数
     */
    public function login_check()
    {
        $user_name = $this->input->post('check_name', true);
        $user_pwd = $this->input->post('check_pwd', true);
        $auto_login = $this->input->post('auto_login', true);
        if(empty($user_name)||empty($user_pwd)){
            echo $this->common_cls->json_output('-2','输入信息不完整');
            return;
        }
        $auto_login=$auto_login=='1'?:'0';

        $this->load->model('admin','admin_cls');
        $user_arr=$this->admin_cls->admin_login($user_name,$user_pwd);
        if(empty($user_arr)){
            echo $this->common_cls->json_output('-1','账号或密码错误');
            return;
        }
        if($user_arr['status']=='0'){
            echo $this->common_cls->json_output('-1','账号被禁用');
            return;
        }

        echo $this->common_cls->json_output('1','ok');

       // echo -1;

    }


}

/* End of file login.php */
/* Location: ./application/controllers/admin/login.php */