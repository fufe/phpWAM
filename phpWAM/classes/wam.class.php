<?php

/**
 * Project: phpWAM
 * Author: FuFe
 * File: wam.class.php
 * Version: 1.0
 */

/**
 * phpWAM application library
 *
 */
class wam {

    // database object
    var $db = null;
    // smarty template object
    var $tpl = null;
    // error messages
    var $error = null;
    // theme path for includes
    var $themepath = null;

    /**
     * class constructor
     */
    function __construct($config = array()) {

        // instantiate the database object
        $this->db = new db_sqlsrv($config);
        $this->themepath = 'layout/themes/default';
        // instantiate the template object
        $this->tpl = new wam_template();
        $this->tpl->assign('themepath', $this->themepath);
    }

    function ni($func) {
        echo('Function ' . $func . ' is not yet implemented<br>');
    }

    function error($message) {
        echo('An error has been occured: ' . $message . '<br>');
    }

    function list_users() {
        if ($users = $this->db->getUsers()) {
            $this->tpl->assign('users', $users);
            $this->tpl->display('list_users.tpl');
        } else {
            $this->error("No users found");
        }
    }

}
