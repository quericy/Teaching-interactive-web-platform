<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * 自制适应bootstrap的前后台通用分页类
 * Created by PhpStorm.
 * User: 熠
 * Date: 2015/4/5 0005
 * Time: 19:54
 */
class Page_cls
{
    /**
     * 获得分页字符串
     * @param $this_obj this对象
     * @param $total_rows 总记录数
     * @param bool $is_admin 是否是后台分页(默认true)
     * @param int $per_page 每页记录数(默认15条)
     * @param int $uri_segment 当前页路由变量位置
     * @param string $suffix 分页链接后缀
     * @param string $base_url 分页链接(为空将使用默认指定)
     * @param int $num_links 当前页前后预留页数(默认3)
     * @return mixed
     */
    function get_page_config($this_obj, $total_rows, $is_admin = 0, $per_page = 15, $uri_segment = 3, $suffix = '', $base_url = '', $first_link_url = '', $num_links = 3)
    {
        //引入分页类和uri类
        $this_obj->load->library('pagination');
        $this_obj->load->library('uri');
        //必要参数
        $config['total_rows'] = $total_rows;
        $config['per_page'] = $per_page;
        $config['num_links'] = $num_links;
        //前后台路由处理
        if ($is_admin == true) {
            $config['uri_segment'] = 4;
            $config['base_url'] = base_url() . '/admin/' . $this_obj->uri->segment(2) . '/' . ($this_obj->uri->segment(3) ? $this_obj->uri->segment(3) : 'index') . '/';
        } else {
            if (!empty($suffix)) {
                $config['suffix'] = $suffix;//添加后缀
            } else {
                $config['suffix'] = null;
            }
            $config['uri_segment'] = $uri_segment;
            if (!empty($base_url)) {
                $config['base_url'] = $base_url;
            } else {
                $config['base_url'] = base_url() . '/' . $this_obj->uri->segment(1) . '/' . ($this_obj->uri->segment(2) ? $this_obj->uri->segment(2) : 'index') . '/';
            }
            if (!empty($first_link_url)) {
                $config['first_url'] = $first_link_url;
            }

        }
        //bootstrap样式设置
        $config['page_query_string'] = FALSE;
        $config['query_string_segment'] = '';
        $config['use_page_numbers'] = TRUE;

        $config['full_tag_open'] = '<!--分页begin--><ul class="pagination">';
        $config['full_tag_close'] = '</ul><!--分页end-->';

        $config['first_link'] = '&laquo; 首页';
        $config['first_tag_open'] = '<li class="prev page">';
        $config['first_tag_close'] = '</li>';

        $config['last_link'] = '末页 &raquo;';
        $config['last_tag_open'] = '<li class="next page">';
        $config['last_tag_close'] = '</li>';

        $config['next_link'] = '下页 &rarr;';
        $config['next_tag_open'] = '<li class="next page">';
        $config['next_tag_close'] = '</li>';

        $config['prev_link'] = '&larr; 上页';
        $config['prev_tag_open'] = '<li class="prev page">';
        $config['prev_tag_close'] = '</li>';

        $config['cur_tag_open'] = '<li class="active"><a  href="#">';
        $config['cur_tag_close'] = '</a></li>';

        $config['num_tag_open'] = '<li class="page">';
        $config['num_tag_close'] = '</li>';

        $this_obj->pagination->initialize($config);
        return $this_obj->pagination->create_links();
    }
}