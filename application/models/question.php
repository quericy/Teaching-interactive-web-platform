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
     * @param $cond 指定条件
     * @return int 提问计数
     */
    function get_question_count($cond=null)
    {
        $this->db->from($this->table_name);
        if (!empty($cond)) $this->db->where($cond);
        return $this->db->count_all_results();
    }

    /**
     * 获取最近几条记录
     * @param $top_count 最近的条数
     * @return mixed
     */
    function get_host_list($top_count = 5)
    {
        $this->db->order_by('answer_count desc,sub_time desc');
        $query = $this->db->get($this->table_name, $top_count, 0);
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
     * 添加问题
     * @param $title 标题
     * @param $content 正文
     * @return $qid 插入数据库中的qid
     */
    function add_question($title, $content)
    {
        $this->db->insert($this->table_name, array(
            'title' => $title,
            'content' => $content,
            'uid' => $this->input->cookie('id', TRUE),
            'sub_time' => time(),
            'status' => '1'
        ));
        return $this->db->insert_id();
    }

    /**
     * 更新问题内容
     * @param $update_arr 更新数组
     * @param $cond 条件
     */
    function update_question($update_arr, $cond)
    {
        $this->db->where($cond);
        $this->db->update($this->table_name, $update_arr);
    }

    /**
     * 更新问题的回复计数(自增1)
     * @param int $qid 问题id
     */
    function update_answer_count($qid)
    {
        $this->db->where(array('qid' => $qid));
        $this->db->set('answer_count', 'answer_count+1', FALSE);
        $this->db->update($this->table_name);
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