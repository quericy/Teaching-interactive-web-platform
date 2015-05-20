<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/5 0005
 * Time: 11:39
 */

class setting extends CI_Model
{
    private $table_name='setting';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 查询一条设置
     * @param $key 设置键名
     * @return mixed
     */
    function get_setting($key)
    {
        if(!$this->is_exist($key)){
            $this->add_setting($key,'');//不存在时添加一条空的键记录
        }
        $this->db->select('value')->from($this->table_name)->where(array('key'=>$key));
        $query = $this->db->get();
        $res=$query->row_array();
        return $res['value'];
    }

    /**
     * 返回所有系统设置的数组
     * @return array 系统设置键值对数组
     */
    function get_all_setting()
    {
        $result_arr=$this->db->get($this->table_name)->result_array();
        $return_arr=array();
        foreach($result_arr as $each){
            $return_arr[$each['key']]=$each['value'];
        }
        return $return_arr;
    }

    /**
     * 添加一条设置记录
     * @param $key 设置键名
     * @param $value 设置键值
     */
    function add_setting($key,$value)
    {
        $this->db->insert($this->table_name,array('key'=>$key,'value'=>$value));
    }

    /**
     * 更新一条键记录
     * @param $key 设置键名
     * @param $value 设置键值
     */
    function update_setting($key,$value)
    {
        if(!$this->is_exist($key)){
            $this->add_setting($key,$value);//不存在时添加一条新的键记录
        }else{
            $this->db->update($this->table_name,array('value'=>''.$value),array('key'=>$key));
        }
    }

    /**
     * 查看是否键存在
     * @param $key 设置键名
     * @return bool true:已存在,false:不存在
     */
    function is_exist($key)
    {
        $this->db->select('value')->from($this->table_name)->where(array('key'=>$key));
        $query = $this->db->get();
        $res=$query->row_array();
        return empty($res)?false:true;
    }

}
/* End of file setting.php */
/* Location: ./application/models/setting.php */