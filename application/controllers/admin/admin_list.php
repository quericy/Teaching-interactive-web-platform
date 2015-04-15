<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

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
    public function index($page = 1)
    {
        //每页10条数据
        $per_page = 10;
        //获取管理员列表

        $admin_info_list = $this->admin->get_admin_list($page, $per_page);
        $assign_arr['admin_info_list'] = $admin_info_list;
        //分页
        $this->load->library('page_cls');
        $assign_arr['page_string'] = $this->page_cls->get_page_config($this, $this->admin->get_admin_count(), true, $per_page);
        //基本信息展示
        $assign_arr['web_title'] = '教师管理';
        $assign_arr['nav_show'] = 'system';
        $this->smarty->view('admin/admin_list.tpl', $assign_arr);
    }

    /**
     * 添加管理员
     */
    public function add()
    {


    }

    /**
     * 修改管理员
     * @param $tid 管理员tid
     */
    public function edit($tid)
    {

    }
    /**
     * 删除管理员
     * @param $tid 管理员tid
     */
    public function del($tid)
    {
        /****权限判断*****/

        /****权限判断*****/
        $tid = intval($tid);
        $this->admin->del_admin_by_tid($tid);
        echo 1;
    }

    /**
     * 启用/禁用管理员
     * @param $status 状态(1启用,0禁用)
     */
    public function status_change($status)
    {
        /****权限判断*****/

        /****权限判断*****/
        $tid_str = $this->input->post('tid_str', true);
        $tid_arr = explode(',', $tid_str);
        if (empty($tid_str) || count($tid_arr) == 0) {
            echo -1;
            return;
        }
        foreach ($tid_arr as $k => $v) {
            $tid_arr[$k] = intval($v);
        }
        $status = $status == '1' ? 1 : 0;
        $this->admin->change_admin_status($tid_arr, $status);

        echo 1;
    }
}

/* End of file admin_list.php */
/* Location: ./application/controllers/admin/admin_list.php */
