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
    function get_admin_list($page=1,$per_page= 15){

        $offset=$per_page*($page-1);
        $offset=$offset>0?$offset:0;
        $query = $this->db->get('admin', $per_page,$offset);
        return $query->result_array();
    }
    function get_admin_count(){

        return $this->db->count_all('admin');
    }
}
/* End of file admin.php */
/* Location: ./application/models/admin.php */