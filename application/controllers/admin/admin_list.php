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

    public function index($page=1)
    {
        $per_page=10;
        $this->smarty->assign('web_title','教师管理');
        $this->smarty->assign('nav_show','system');

        $this->load->model('admin');
        $admin_info_list=$this->admin->get_admin_list($page,$per_page);

        $this->smarty->assign('admin_info_list',$admin_info_list);





        $this->load->library('page_cls');
        $this->smarty->assign('page_string', $this->page_cls->get_page_config($this,$this->admin->get_admin_count(),true,$per_page));
        $this->smarty->view('admin/admin_list.tpl');
    }

}

/* End of file admin_list.php */
/* Location: ./application/controllers/admin/admin_list.php */
