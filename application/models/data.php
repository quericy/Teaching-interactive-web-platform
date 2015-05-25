<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/11 0011
 * Time: 14:50
 */
class Data extends CI_Model
{
    private $table_name = 'data';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 符合条件的课件资料数量
     * @param $cond 指定条件
     * @return int 数量
     */
    function get_counts($cond)
    {
        $this->db->from($this->table_name);
        $this->db->where($cond);
        return $this->db->count_all_results();
    }

    /**
     * 获得课件资料列表
     * @param int $type 类型(1:课件,2:资料)
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 课件资料数据数组
     */
    function get_list($type, $page = 1, $per_page = 15)
    {
        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $this->db->join('admin', 'admin.tid=data.tid');
        $this->db->where(array('data.type' => '' . $type));
        $this->db->select('data.*,admin.user_name');
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获取最近几条记录
     * @param $top_count 最近的条数
     * @return mixed
     */
    function get_recent_list($top_count = 5)
    {
        $this->db->order_by('edit_time desc');
        $query = $this->db->get($this->table_name, $top_count, 0);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得一条课件资料记录
     * @param $fields 查询字段
     * @param $cond 条件
     * @return mixed
     */
    function get_one_data($fields, $cond)
    {
        $this->db->join('admin', 'admin.tid=data.tid');
        $this->db->select($fields . ',admin.user_name')->from($this->table_name)->where($cond);
        $query = $this->db->get();
        return $query->row_array();
    }

    /**
     * 添加一条课件资料记录
     * @param $data_arr
     * @return object
     */
    function add_one_data($data_arr)
    {
        return $this->db->insert($this->table_name, array(
            'tid' => $this->input->cookie('id', TRUE),
            'title' => $data_arr['title'],
            'type' => $data_arr['type'],
            'edit_time' => time(),
            'content' => $data_arr['content']
        ));

    }

    /**
     * 更新一条课件资料记录
     * @param $did 课件资料did
     * @param $data_arr
     * @return object
     */
    function update_one_data($did, $data_arr)
    {
        $update_arr = array(
            'tid' => $this->input->cookie('id', TRUE),
            'title' => $data_arr['title'],
            'type' => $data_arr['type'],
            'edit_time' => time(),
            'content' => $data_arr['content']
        );
        $this->db->where_in('did', $did);
        return $this->db->update($this->table_name, $update_arr);
    }

    /**
     * 删除课件资料
     * @param $did 课件资料id
     */
    function del_by_did($did)
    {
        /*******删除附件(待完成)**********/
        $this->db->delete($this->table_name, array('did' => $did));
    }

    /**
     * 获得课程资料记录中,不同教师tid的数量
     * @param $cond 筛选条件
     * @return int 教师数量
     */
    function get_tid_count($cond)
    {
        $this->db->select('tid')->distinct()->from($this->table_name)->where($cond);
        return $this->db->get()->num_rows();//返回get结果的行数
    }

}

/* End of file data.php */
/* Location: ./application/models/data.php */