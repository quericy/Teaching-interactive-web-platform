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
        $this->db->select('log.*,admin.user_name');
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
     * 添加日志记录
     * @param $content 日志内容
     * @param $type 模块名称
     * @return object
     */
    function add_log($content, $type)
    {
        return $this->db->insert($this->table_name, array('content' => $content,
            'type' => $type,
            'tid' => 1,//管理员id(需要登录模块)
            'log_time' => time()
        ));
    }

    /**
     * 符合条件的日志数量
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