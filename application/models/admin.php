<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/5 0005
 * Time: 16:16
 */
class Admin extends CI_Model
{
    private $table_name = 'admin';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 管理员密码自定义md5加密函数
     * @param string $pwd_str 待加密的字符串
     * @return string 加密后字符串
     */
    function super_md5($pwd_str)
    {
        $this->load->library('encrypt');
        return md5(md5($pwd_str) . 'admin_key');
    }

    /**
     * 查询一条管理员记录
     * @param $fields 查询字段
     * @param $cond 条件
     * @return mixed
     */
    function get_one_admin($fields, $cond)
    {
        $this->db->select($fields)->from($this->table_name)->where($cond);
        $query = $this->db->get();
        return $query->row_array();
    }

    /**
     * 获得管理员列表
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 教师数据数组
     */
    function get_admin_list($page = 1, $per_page = 15)
    {

        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }


    /**
     * 获得当前系统的管理员总数
     * @return int 管理员计数
     */
    function get_admin_count()
    {
        return $this->db->count_all($this->table_name);
    }

    /**
     * 删除管理员
     * @param $tid 管理员tid
     */
    function del_admin_by_tid($tid)
    {
        $this->db->delete($this->table_name, array('tid' => $tid));
    }

    /**
     * 更改管理员状态
     * @param $tid_arr 管理员tid数组
     * @param $status 状态(1启用,0禁用)
     */
    function change_admin_status($tid_arr, $status)
    {
        $this->db->where_in('tid', $tid_arr);
        $this->db->update($this->table_name, array('status' => $status));
    }

    /**
     * 更新管理员信息
     * @param $tid 管理员ID
     * @param $user_name 用户名
     * @param $password 密码
     * @param $user_type 用户类型(2管理员,1普通教师)
     * @param $user_status 用户状态(1启用,0禁用)
     * @return bool
     */
    function update_admin($tid, $user_name, $password, $user_type, $user_status)
    {
        //密码为空不更新密码
        if (strlen(trim($password)) == 0) {
            $update_arr = array(
                'user_name' => $user_name,
                'type' => $user_type,
                'status' => $user_status
            );
        } else {
            $update_arr = array(
                'user_name' => $user_name,
                'user_pwd' => $this->super_md5($password),
                'type' => $user_type,
                'status' => $user_status
            );
        }
        $this->db->where_in('tid', $tid);
        return $this->db->update($this->table_name, $update_arr);
    }

    /**
     * 添加管理员
     * @param $user_name 用户名
     * @param $password 密码
     * @param $user_type 用户类型(2管理员,1普通教师)
     * @param $user_status 用户状态(1启用,0禁用)
     * @return bool
     */
    function add_admin($user_name, $password, $user_type, $user_status)
    {
        return $this->db->insert($this->table_name, array('user_name' => $user_name,
            'user_pwd' => $this->super_md5($password),
            'type' => $user_type,
            'status' => $user_status));
    }

    /**
     * 符合条件的管理员数量
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
     * 教师登录验证函数
     * @param $user_name 用户名
     * @param $user_pwd 密码
     */
    function admin_login($user_name, $user_pwd)
    {
        $this->db->select('tid,user_name,email,type,status,login_time,login_ip')->from($this->table_name);
        $this->db->where(array('user_name' => $user_name, 'user_pwd' => $this->super_md5($user_pwd)));
        return $this->db->get()->row_array();
    }

}
/* End of file admin.php */
/* Location: ./application/models/admin.php */