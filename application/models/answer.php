<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/25 0025
 * Time: 16:15
 */
class Answer extends CI_Model
{
    private $table_name = 'answer';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 获得回答列表
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 提问数据数组
     */
    function get_answer_list($page = 1, $per_page = 15)
    {
        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $this->db->order_by('id desc');
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得当前系统的回答总数
     * @return int 提问计数
     */
    function get_answer_count()
    {
        return $this->db->count_all($this->table_name);
    }

    /**
     * 获得符合条件的回答列表
     * @param  $cond 条件
     * @param  $order 排序
     * @param  $page 页数(可选)
     * @param  $per_page 每页条数(可选)
     * @return mixed
     */
    function get_list($cond = null, $order=null,$page = null, $per_page = null)
    {
        if (!empty($page) && !empty($per_page)) {
            $offset = $per_page * ($page - 1);
            $offset = $offset > 0 ? $offset : 0;
        }
        $this->db->join('admin', 'admin.tid=answer.tid', 'left outer');
        $this->db->join('user', 'user.uid=answer.uid', 'left outer');
        if (!empty($cond)) $this->db->where($cond);
        $this->db->select('answer.*,admin.user_name as t_name,user.user_name as u_name');
        if(!empty($order))$this->db->order_by($order);
        if (!empty($page) && !empty($per_page)) {
            $query = $this->db->get($this->table_name, $per_page, $offset);
        } else {
            $query = $this->db->get($this->table_name);
        }
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 添加回复
     * @param $qid 回复所属问题qid
     * @param $content 回复内容
     * @param $add_time 回复时间
     * @return object
     */
    function add_reply($qid, $content, $add_time)
    {
        $this->load->library('user_agent');
        $user_agent = $this->agent->agent_string();
        $id = intval($this->input->cookie('id', TRUE));
        $type = $this->input->cookie('type', TRUE);
        if ($type == '1' || $type == '2') {
            $id_key = 'tid';
        } else {
            $id_key = 'uid';
        }
        $this->load->model('question', 'question_cls');
        $this->question_cls->update_answer_count($qid);//更新问题回复计数
        return $this->db->insert($this->table_name, array(
            'qid' => $qid,
            'content' => $content,
            'sub_time' => $add_time,
            'UA' => $user_agent,
            $id_key => $id
        ));
    }

    /**
     * 删除回复
     * @param $id 回复id
     */
    function del_answer_by_id($id)
    {
        $this->db->delete($this->table_name, array('id' => $id));
    }

}