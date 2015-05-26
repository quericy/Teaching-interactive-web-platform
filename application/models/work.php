<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/26 0026
 * Time: 14:54
 */
class Work extends CI_Model
{
    private $table_name = 'work';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 获得作业列表
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 作业数据数组
     */
    function get_work_list($page = 1, $per_page = 15)
    {
        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $this->db->join('admin', 'admin.tid=work.tid');
        $this->db->select('work.*,admin.user_name');
        $this->db->order_by('wid desc');
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得当前系统的作业总数
     * @return int 作业计数
     */
    function get_work_count()
    {
        return $this->db->count_all($this->table_name);
    }

    /**
     * 获取最近的几条记录
     * @param $top_count 最近的条数
     * @return mixed
     */
    function get_recent_list($top_count = 5)
    {
        $this->db->order_by('wid desc');
        $query = $this->db->get($this->table_name, $top_count, 0);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得一条作业记录
     * @param $fields 查询字段
     * @param $cond 条件
     * @return mixed
     */
    function get_one_work($fields, $cond)
    {
        $this->db->join('admin', 'admin.tid=work.tid');
        $this->db->select($fields . ',admin.user_name')->from($this->table_name)->where($cond);
        $query = $this->db->get();
        return $query->row_array();
    }

    /**
     * 添加作业
     * @param $title 标题
     * @param $content 正文
     * @param $start_time 开始时间
     * @param $end_time 截止时间
     * @return $wid 插入数据库中的wid
     */
    function add_work($title, $content, $start_time, $end_time)
    {
        $this->db->insert($this->table_name, array(
            'title' => $title,
            'content' => $content,
            'tid' => $this->input->cookie('id', TRUE),
            'start_time' => $start_time,
            'end_time' => $end_time
        ));
        return $this->db->insert_id();
    }


    /**
     * 添加一条作业记录
     * @param $work_arr
     * @return object
     */
    function add_one_work($work_arr)
    {
        return $this->db->insert($this->table_name, array(
            'tid' => $this->input->cookie('id', TRUE),
            'title' => $work_arr['title'],
            'content' => $work_arr['content'],
            'start_time' => $work_arr['start_time'],
            'end_time' => $work_arr['end_time']
        ));

    }

    /**
     * 更新一条作业记录
     * @param $wid 作业wid
     * @param $work_arr
     * @return object
     */
    function update_one_work($wid, $work_arr)
    {
        $update_arr = array(
            'tid' => $this->input->cookie('id', TRUE),
            'title' => $work_arr['title'],
            'content' => $work_arr['content'],
            'start_time' => $work_arr['start_time'],
            'end_time' => $work_arr['end_time']
        );
        $this->db->where_in('wid', $wid);
        return $this->db->update($this->table_name, $update_arr);
    }

    /**
     * 删除作业
     * @param $wid 作业id
     */
    function del_by_wid($wid)
    {
        $this->db->delete($this->table_name, array('wid' => $wid));
    }

}