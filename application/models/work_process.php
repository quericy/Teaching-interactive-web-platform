<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/27 0027
 * Time: 0:07
 */
class Work_Process extends CI_Model
{
    private $table_name = 'work_process';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 获得一份作业对应的完成记录列表
     * @param $fields 查询字段
     * @param $page 页数
     * @param $per_page 每页条书
     * @return mixed
     */
    function get_work_process_list($wid, $page = 1, $per_page = 15)
    {
        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $this->db->join('user','user.uid=work_process.uid');
        $this->db->select('work_process.*,user.user_name')->where(array('wid' => $wid));
        $this->db->order_by('id asc');
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 符合条件的课件资料数量
     * @param $cond 指定条件
     * @return int 数量
     */
    function get_work_process_counts($cond)
    {
        $this->db->from($this->table_name);
        $this->db->where($cond);
        return $this->db->count_all_results();
    }

    /**
     * 获得某用户对某作业的完成情况
     * @param $wid 作业id
     * @param $uid 用户id
     * @return mixed
     */
    function get_one_user_process($wid, $uid)
    {
        $this->db->from($this->table_name)->where(array('wid' => $wid, 'uid' => $uid));
        $query = $this->db->get();
        return $this->security->xss_clean($query->row_array());
    }

    /**
     * 更新用户状态(用户每次提交时调用)
     * @param $wid 课件id
     */
    function change_one_user_process($wid)
    {
        $uid = $this->input->cookie('id', TRUE);
        $res_arr = $this->get_one_user_process($wid, $uid);
        if (empty($res_arr)) {//没有记录
            $this->add_one($wid, $uid);
        } else {
            $this->update_one($wid, $uid, array('status' => '1', 'submit_time' => time()));
        }
    }

    /**
     * 用户提交作业进程
     * @param $wid 作业id
     * @param $uid 用户id
     * @return object
     */
    function add_one($wid, $uid)
    {
        return $this->db->insert($this->table_name, array(
            'wid' => $wid,
            'uid' => $uid,
            'status' => '1',
            'submit_time' => time()
        ));
    }

    /**
     * 更新作业完成度信息
     * @param $id 作业完成度记录的id
     * @param $update_arr 更新数组
     */
    function update_one($id, $update_arr)
    {
        $this->db->where(array('id' => $id));
        $this->db->update($this->table_name, $update_arr);
    }
}