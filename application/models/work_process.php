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
     * @param $cond 条件
     * @return mixed
     */
    function get_work_process_list($wid, $fields)
    {
        $this->db->select($fields)->from($this->table_name)->where(array('wid' => $wid));
        $this->db->order_by('id desc');
        $query = $this->db->get();
        return $this->security->xss_clean($query->result_array());
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
     * @param $wid 作业id
     * @param $uid 用户id
     * @param $update_arr 更新数组
     */
    function update_one($wid, $uid, $update_arr)
    {
        $this->db->where(array('uid' => $uid, 'wid' => $wid));
        $this->db->update($this->table_name, $update_arr);
    }
}