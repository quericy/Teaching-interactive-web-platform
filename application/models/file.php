<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/27 0027
 * Time: 15:32
 */
class File extends CI_Model
{
    private $table_name = 'file';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 添加一个作业附件记录
     * @param $wid 作业id
     * @param $uid 用户id
     * @return object
     */
    function add_one($wid, $uid, $file_name, $size)
    {
        return $this->db->insert($this->table_name, array(
            'wid' => $wid,
            'uid' => $uid,
            'file_name' => $file_name,
            'size' => $size,
            'add_time' => time()
        ));
    }


    /**
     * 获得一份作业对应的完成记录列表
     * @param $wid 作业题目id
     * @param string $uid 学生id(为空表示不筛选学生)
     * @return mixed
     */
    function get_work_file_list($wid, $uid='')
    {
        $cond_arr['wid']=$wid;
        if(!empty($uid))$cond_arr['uid']=$uid;
        $this->db->select('*')->from($this->table_name)->where($cond_arr);
        $this->db->order_by('fid desc');
        $query = $this->db->get();
        return $this->security->xss_clean($query->result_array());
    }

}