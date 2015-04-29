<?php
/**
 * 后台系统参数控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/29 0029
 * Time: 11:00
 */

class sys_setting extends CI_Controller
{
    private $assign_arr = array();

    public function __construct()
    {
        parent::__construct();

        $this->assign_arr['controller_name'] = $this->router->class;
        $this->assign_arr['web_title'] = '系统参数';
        $this->assign_arr['nav_show'] = 'system';
    }

    public function index()
    {
        //页面展示
        $this->smarty->view('admin/sys_setting.tpl', $this->assign_arr);
    }


}

/* End of file sys_setting.php */
/* Location: ./application/controllers/admin/sys_setting.php */