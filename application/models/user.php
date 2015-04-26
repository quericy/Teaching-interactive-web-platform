<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/23 0023
 * Time: 23:31
 */

class User extends CI_Model {

    private $table_name='user';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 用户列表
     * @param int $page 页数
     * @param int $per_page 每页数
     * @return mixed 用户数组
     */
    function get_user_list($page = 1, $per_page = 15)
    {
        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 用户总数统计
     * @return mixed 用户总数
     */
    function get_user_count()
    {
        return $this->db->count_all($this->table_name);
    }

    /**
     * 删除用户
     * @param $uid 用户uid
     */
    function del_user_by_uid($uid)
    {
        $this->db->delete($this->table_name, array('uid' => $uid));
    }
}

/* End of file user.php */
/* Location: ./application/models/user.php */