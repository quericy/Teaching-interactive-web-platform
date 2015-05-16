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
        $power_reset_pwd = $this->input->post('check_name', true);
        $power_reset_pwd = $this->input->post('check_pwd', true);
        $auto_login = $this->input->post('auto_login', true);
        sleep(2);
        echo -1;

    }


}

/* End of file login.php */
/* Location: ./application/controllers/admin/login.php */