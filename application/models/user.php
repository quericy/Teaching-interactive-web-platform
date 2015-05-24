<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/23 0023
 * Time: 23:31
 */
class User extends CI_Model
{

    private $table_name = 'user';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 用户密码自定义md5加密函数
     * @param $pwd_str 待加密的字符串
     * @return string 加密后字符串
     */
    function user_md5($pwd_str)
    {
        return md5(md5($pwd_str) . 'user_key');
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

    /**
     * 用户密码重置
     * @param $uid 用户ID
     */
    function reset_user_pwd($uid)
    {
        //获得默认密码
        $this->load->model('setting', 'setting_cls');
        $reset_pwd = $this->setting_cls->get_setting('reset_pwd');
        if (empty($reset_pwd)) $reset_pwd = '123456';

        $this->db->where_in('uid', $uid);
        $this->db->update($this->table_name, array('user_pwd' => $this->user_md5($reset_pwd)));
    }

    /**
     * 更改用户状态
     * @param $uid_arr 用户uid数组
     * @param $status 状态(1启用,0禁用)
     */
    function change_user_status($uid_arr, $status)
    {
        $this->db->where_in('uid', $uid_arr);
        $this->db->update($this->table_name, array('status' => $status));
    }

    /**
     * 用户登录验证函数
     * @param $user_name 用户名
     * @param $user_pwd 密码
     */
    function user_login($user_name, $user_pwd)
    {
        $this->db->select('uid,user_name,email,status,login_time,login_ip')->from($this->table_name);
        $this->db->where(array('user_name' => $user_name, 'user_pwd' => $this->user_md5($user_pwd)));
        return $this->db->get()->row_array();
    }

    /**
     * 更新学生登录时间和ip
     * @param $uid 学生id
     * @param $time 时间
     * @param $ip id
     * @return object
     */
    function update_login_time($uid, $time, $ip)
    {
        $update_arr = array(
            'login_time' => $time,
            'login_ip' => $ip
        );
        $this->db->where_in('uid', $uid);
        return $this->db->update($this->table_name, $update_arr);
    }

    /**
     * 符合条件的学生数量
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
     * 用户注册函数
     * @param $user_name 用户名
     * @param $password 密码
     * @param $email 邮箱
     * @param $user_status 用户状态
     * @return object
     */
    function user_register($user_name, $password, $email, $user_status)
    {
        return $this->db->insert($this->table_name, array('user_name' => $user_name,
            'user_pwd' => $this->user_md5($password),
            'email' => $email,
            'status' => $user_status));
    }
}

/* End of file user.php */
/* Location: ./application/models/user.php */