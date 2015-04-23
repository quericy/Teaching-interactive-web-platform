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

    function get_user_list()
    {

    }

    function get_user_count()
    {
        return $this->db->count_all($this->table_name);
    }
}

/* End of file user.php */
/* Location: ./application/models/user.php */