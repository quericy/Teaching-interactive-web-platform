<?php
/**
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/30 0030
 * Time: 19:25
 */

class Lesson {

    private $table_name = 'lesson';//表名

    function __construct()
    {
        parent::__construct();
        $this->load->database();
    }

    /**
     * 获得课程列表
     * @param int $page 页数
     * @param int $per_page 每页条数(默认15)
     * @return mixed 课程数据数组
     */
    function get_lesson_list($page = 1, $per_page = 15)
    {
        $offset = $per_page * ($page - 1);
        $offset = $offset > 0 ? $offset : 0;
        $this->db->join('admin', 'admin.tid=lesson.tid');
        $this->db->select('lesson.*,admin.user_name');
        $this->db->order_by('lid desc');
        $query = $this->db->get($this->table_name, $per_page, $offset);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得当前系统的课程总数
     * @return int 课程计数
     */
    function get_lesson_count()
    {
        return $this->db->count_all($this->table_name);
    }

    /**
     * 获取最近的几条记录
     * @param $top_count 最近的条数
     * @return mixed
     */
    function get_recent_list($top_count = 5)
    {
        $this->db->order_by('lid desc');
        $query = $this->db->get($this->table_name, $top_count, 0);
        return $this->security->xss_clean($query->result_array());
    }

    /**
     * 获得一条课程记录
     * @param $fields 查询字段
     * @param $cond 条件
     * @return mixed
     */
    function get_one_lesson($fields, $cond)
    {
        $this->db->join('admin', 'admin.tid=lesson.tid');
        $this->db->select($fields . ',admin.user_name')->from($this->table_name)->where($cond);
        $query = $this->db->get();
        return $query->row_array();
    }

    /**
     * 添加课程
     * @param $title 标题
     * @param $content 正文
     * @return $lid 插入数据库中的lid
     */
    function add_lesson($title, $content)
    {
        $this->db->insert($this->table_name, array(
            'title' => $title,
            'content' => $content,
            'tid' => $this->input->cookie('id', TRUE),
            'sub_time'=>time()
        ));
        return $this->db->insert_id();
    }


    /**
     * 添加一条课程记录
     * @param $lesson_arr
     * @return object
     */
    function add_one_lesson($lesson_arr)
    {
        return $this->db->insert($this->table_name, array(
            'tid' => $this->input->cookie('id', TRUE),
            'title' => $lesson_arr['title'],
            'content' => $lesson_arr['content'],
            'sub_time' => time()
        ));

    }

    /**
     * 更新一条课程记录
     * @param $lid 课程lid
     * @param $lesson_arr
     * @return object
     */
    function update_one_lesson($lid, $lesson_arr)
    {
        $update_arr = array(
            'tid' => $this->input->cookie('id', TRUE),
            'title' => $lesson_arr['title'],
            'content' => $lesson_arr['content'],
            'sub_time' => time()
        );
        $this->db->where_in('lid', $lid);
        return $this->db->update($this->table_name, $update_arr);
    }

    /**
     * 删除课程
     * @param $lid 课程id
     */
    function del_by_lid($lid)
    {
        $this->db->delete($this->table_name, array('lid' => $lid));
    }

}