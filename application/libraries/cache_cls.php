<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 共有常用缓存类
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/5/20 0020
 * Time: 15:30
 */
class cache_cls
{
    private $CI;

    public function __construct()
    {
        $this->CI =& get_instance();
        $this->CI->load->driver('cache', array('adapter' => 'file'));
    }

    /**
     * 取缓存
     * @param $key 键
     * @return mixed 值
     */
    function get($key)
    {
        return $this->CI->cache->get($key);
    }

    /**
     * 存缓存
     * @param $key 键
     * @param $value 值
     * @param int $cache_time 缓存时间
     */
    function set($key, $value, $cache_time = 600)
    {
        $this->CI->cache->save($key, $value, $cache_time);
    }

    /**
     * 删除缓存
     * @param $key 键
     */
    function del($key)
    {
        $this->CI->cache->delete($key);
    }

    /**
     * 取得系统设置缓存
     * @return mixed
     */
    function get_sys_cache()
    {
        $sys_cache = $this->get('sys_setting');
        if (empty($sys_cache)) {
            $CI =& get_instance();
            $CI->load->model('setting', 'setting_cls');
            $sys_arr = $CI->setting_cls->get_all_setting();
            $this->set('sys_setting', $sys_arr);
            return $sys_arr;
        } else {
            return $sys_cache;
        }
    }

    /**
     * 获取统计数据缓存概览
     * @return mixed
     */
    function get_count_statistics()
    {
        $sys_cache = $this->get('count_statistics');
        if (empty($sys_cache)) {
            $CI =& get_instance();
            $CI->load->model('work_process', 'work_process_cls');
            $work_statistics_arr = $CI->work_process_cls->work_statistics();
            $count_statistics['upload_work_count'] = $work_statistics_arr['upload_work_count'];//未批改作业
            $count_statistics['mark_work_count'] = $work_statistics_arr['mark_work_count'];//已批改作业
            $count_statistics['work_process_count'] = $work_statistics_arr['all_work_count'];//所有上交的作业
            $CI->load->model('work', 'work_cls');
            $count_statistics['all_work_count'] = $CI->work_cls->get_work_count();//布置的作业总数

            $CI->load->model('user', 'user_cls');
            $count_statistics['user_count'] = $CI->user_cls->get_user_count();//用户数量
            $CI->load->model('admin', 'admin_cls');
            $count_statistics['admin_count'] = $CI->admin_cls->get_admin_count();//教师数量
            $CI->load->model('data', 'data_cls');
            $count_statistics['course_count'] = $CI->data_cls->get_counts(array('type' => 1));//课件数量
            $count_statistics['data_count'] = $CI->data_cls->get_counts(array('type' => 2));//资料数量
            $CI->load->model('question', 'question_cls');
            $count_statistics['question_count'] = $CI->question_cls->get_question_count();//提问总数量
            $count_statistics['open_question_count'] = $CI->question_cls->get_question_count(array('status' => '1'));//开启的提问数量
            $count_statistics['close_question_count'] = $CI->question_cls->get_question_count(array('status' => '0'));//关闭的提问数量
            $CI->load->model('answer', 'answer_cls');
            $count_statistics['answer_count'] = $CI->answer_cls->get_answer_count();//回复总数量

            $count_statistics['cache_time_stamp'] = time();//缓存生成时间戳
            $count_statistics['cache_time'] = date('Y-m-d H:i:s', time());//缓存生成时间

            $this->set('count_statistics', $count_statistics, 600);//缓存10min
            return $count_statistics;
        } else {
            return $sys_cache;
        }
    }

}