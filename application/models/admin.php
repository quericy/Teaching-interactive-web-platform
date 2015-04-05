<?php

/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/5 0005
 * Time: 16:16
 */
class Admin extends CI_Model
{
    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }
    function get_admin_list(){

        $query = $this->db->get('admin', 10);
        return $query->result_array();
    }
}
/* End of file admin.php */
/* Location: ./application/models/admin.php */