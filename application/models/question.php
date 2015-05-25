<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/18 0018
 * Time: 14:30
 */

class Question extends CI_Model
{
    private $table_name = 'question';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    /**
     * 获得问题列表
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 提问数据数组
     */
    function get_question_list($page = 1, $per_page = 15)
    {
        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $this->db->join('user', 'user.uid=question.uid');
        $this->db->select('question.*,user.user_name');
        $this->db->order_by('sub_time desc');
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得当前系统的问题总数
     * @return int 提问计数
     */
    function get_question_count()
    {
        return $this->db->count_all($this->table_name);
    }

    /**
     * 获取最近几条记录
     * @param $top_count 最近的条数
     * @return mixed
     */
    function get_recent_list($top_count=5)
    {
        $this->db->order_by('sub_time desc');
        $query = $this->db->get($this->table_name, $top_count,0 );
        return $this->security->xss_clean($query->result_array());
    }
    /**
     * 获得一条提问记录
     * @param $fields 查询字段
     * @param $cond 条件
     * @return mixed
     */
    function get_one_data($fields, $cond)
    {
        $this->db->join('user', 'user.uid=question.uid');
        $this->db->select($fields . ',user.user_name')->from($this->table_name)->where($cond);
        $query = $this->db->get();
        return $query->row_array();
    }

    /**
     * 删除问题
     * @param $qid 问题qid
     */
    function del_question_by_qid($qid)
    {
        $this->db->delete($this->table_name, array('qid' => $qid));
    }

    /**
     * 更改问题状态
     * @param $qid_arr 问题qid数组
     * @param $status 状态(1开启,0关闭)
     */
    function change_question_status($qid_arr, $status)
    {
        $this->db->where_in('qid', $qid_arr);
        $this->db->update($this->table_name, array('status' => $status));
    }
}