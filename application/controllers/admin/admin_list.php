<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * 后台教师管理控制器
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/3/31
 * Time: 17:55
 */
class Admin_list extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        $this->smarty->assign('web_title','教师管理');
        $this->smarty->assign('nav_show','system');
        $admin_info_list=array(1,2,3,4,5);
        $this->smarty->assign('admin_info_list',$admin_info_list);
        $this->smarty->view('admin/admin_list.tpl');
    }

}

/* End of file admin_list.php */
/* Location: ./application/controllers/admin/admin_list.php */
