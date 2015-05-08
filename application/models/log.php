<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/8 0008
 * Time: 10:28
 */
class Log extends CI_Model
{
    private $table_name = 'log';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }


    /**
     * 查询一条日志记录
     * @param $fields 查询字段
     * @param $cond 条件
     * @return mixed
     */
    function get_one_log($fields, $cond)
    {
        $this->db->select($fields)->from($this->table_name)->where($cond);
        $query = $this->db->get();
        return $query->row_array();
    }

    /**
     * 获得日志列表
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 日志数据数组
     */
    function get_log_list($page = 1, $per_page = 15)
    {

        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $this->db->join('admin', 'admin.tid = log.tid');
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }


    /**
     * 获得当前系统的日志总数
     * @return int 管理员计数
     */
    function get_log_count()
    {
        return $this->db->count_all($this->table_name);
    }


    /**
     * 添加管理员
     * @param $user_name 用户名
     * @param $password 密码
     * @param $user_type 用户类型(2管理员,1普通教师)
     * @param $user_status 用户状态(1启用,0禁用)
     * @return bool
     */
    function add_admin($user_name, $password, $user_type, $user_status)
    {
        return $this->db->insert($this->table_name, array('user_name' => $user_name,
            'user_pwd' => $this->super_md5($password),
            'type' => $user_type,
            'status' => $user_status));
    }

    /**
     * 符合条件的管理员数量
     * @param $cond 指定条件
     * @return int 数量
     */
    function get_counts($cond)
    {
        $this->db->from($this->table_name);
        $this->db->where($cond);
        return $this->db->count_all_results();
    }
}
/* End of file admin.php */
/* Location: ./application/models/admin.php */