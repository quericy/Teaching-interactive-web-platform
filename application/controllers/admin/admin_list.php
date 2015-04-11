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
        $this->load->model('admin');
    }

    /**
     * 管理员列表
     * @param int $page 页数
     */
    public function index($page=1)
    {
        //每页10条数据
        $per_page=10;
        //获取管理员列表
        $admin_info_list=$this->admin->get_admin_list($page,$per_page);
        $assign_arr['admin_info_list']=$admin_info_list;
        //分页
        $this->load->library('page_cls');
        $assign_arr['page_string']= $this->page_cls->get_page_config($this,$this->admin->get_admin_count(),true,$per_page);
        //基本信息展示
        $assign_arr['web_title']='教师管理';
        $assign_arr['nav_show']='system';
        $this->smarty->view('admin/admin_list.tpl',$assign_arr);
    }

    public function del($tid)
    {
        $tid=intval($tid);
        $this->admin->del_admin_by_tid($tid);
        echo 1;
    }

}

/* End of file admin_list.php */
/* Location: ./application/controllers/admin/admin_list.php */
