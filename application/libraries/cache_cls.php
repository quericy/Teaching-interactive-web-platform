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
            $this->set('sys_setting',$sys_arr);
            return $sys_arr;
        } else {
            return $sys_cache;
        }
    }

}