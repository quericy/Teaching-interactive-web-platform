<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/**
 * CodeIgniter
 *
 * An open source application development framework for PHP 5.1.6 or newer
 *
 * @package		CodeIgniter
 * @author		ExpressionEngine Dev Team
 * @copyright	Copyright (c) 2008 - 2014, EllisLab, Inc.
 * @license		http://codeigniter.com/user_guide/license.html
 * @link		http://codeigniter.com
 * @since		Version 1.0
 * @filesource
 */

// ------------------------------------------------------------------------

/**
 * CodeIgniter Application Controller Class
 *
 * This class object is the super class that every library in
 * CodeIgniter will be assigned to.
 *
 * @package		CodeIgniter
 * @subpackage	Libraries
 * @category	Libraries
 * @author		ExpressionEngine Dev Team
 * @link		http://codeigniter.com/user_guide/general/controllers.html
 */
class CI_Controller {

	private static $instance;
//------------------------------------------------------------------------
//补善CI在IDE中的代码提示－开始
//------------------------------------------------------------------------
	/**
	 * @var CI_Loader
	 */
	var $load;
	/**
	 * @var CI_DB_active_record
	 */
	var $db;
	/**
	 * @var CI_Calendar
	 */
	var $calendar;
	/**
	 * @var Email
	 */
	var $email;
	/**
	 * @var CI_Encrypt
	 */
	var $encrypt;
	/**
	 * @var CI_Ftp
	 */
	var $ftp;
	/**
	 * @var CI_Hooks
	 */
	var $hooks;
	/**
	 * @var CI_Image_lib
	 */
	var $image_lib;
	/**
	 * @var CI_Language
	 */
	var $language;
	/**
	 * @var CI_Log
	 */
	var $log;
	/**
	 * @var CI_Output
	 */
	var $output;
	/**
	 * @var CI_Pagination
	 */
	var $pagination;
	/**
	 * @var CI_Parser
	 */
	var $parser;
	/**
	 * @var CI_Session
	 */
	var $session;
	/**
	 * @var CI_Sha1
	 */
	var $sha1;
	/**
	 * @var CI_Table
	 */
	var $table;
	/**
	 * @var CI_Trackback
	 */
	var $trackback;
	/**
	 * @var CI_Unit_test
	 */
	var $unit;
	/**
	 * @var CI_Upload
	 */
	var $upload;
	/**
	 * @var CI_URI
	 */
	var $uri;
	/**
	 * @var CI_User_agent
	 */
	var $agent;
	/**
	 * @var CI_Validation
	 */
	var $validation;
	/**
	 * @var CI_Xmlrpc
	 */
	var $xmlrpc;
	/**
	 * @var CI_Zip
	 */
	var $zip;
//------------------------------------------------------------------------
//补善CI在IDE中的代码提示—结束
//------------------------------------------------------------------------
	/**
	 * Constructor
	 */
	public function __construct()
	{
		self::$instance =& $this;

		// Assign all the class objects that were instantiated by the
		// bootstrap file (CodeIgniter.php) to local class variables
		// so that CI can run as one big super object.
		foreach (is_loaded() as $var => $class)
		{
			$this->$var =& load_class($class);
		}

		$this->load =& load_class('Loader', 'core');

		$this->load->initialize();
		
		log_message('debug', "Controller Class Initialized");
	}

	public static function &get_instance()
	{
		return self::$instance;
	}
}
// END Controller class

/* End of file Controller.php */
/* Location: ./system/core/Controller.php */