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
     * 删除课件资料
     * @param $did 课件资料id
     */
    function del_by_did($did)
    {
        /*******删除附件(待完成)**********/
        $this->db->delete($this->table_name, array('did' => $did));
    }


}

/* End of file data.php */
/* Location: ./application/models/data.php */