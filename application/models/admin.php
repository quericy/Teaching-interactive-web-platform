<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/5 0005
 * Time: 16:16
 */
class Admin extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 获得管理员列表
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 教师数据数组
     */
    function get_admin_list($page = 1, $per_page = 15)
    {

        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $query = $this->db->get('admin', $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得管理员总数
     * @return int 管理员计数
     */
    function get_admin_count()
    {
        return $this->db->count_all('admin');
    }

    /**
     * 删除管理员
     * @param $tid 管理员tid
     */
    function del_admin_by_tid($tid)
    {
        $this->db->delete('admin', array('tid' => $tid));
    }

    /**
     * 更改管理员状态
     * @param $tid_arr 管理员tid数组
     * @param $status 状态(1启用,0禁用)
     */
    function change_admin_status($tid_arr, $status)
    {
        $this->db->where_in('tid', $tid_arr);
        $this->db->update('admin', array('status' => $status));
    }

    function add_admin()
    {


    }

    /**
     * 符合条件的管理员数量
     * @param $cond 指定条件
     * @return int 数量
     */
    function get_counts($cond)
    {
        $this->db->from('admin');
        $this->db->where($cond);
        return $this->db->count_all_results();
    }
}
/* End of file admin.php */
/* Location: ./application/models/admin.php */