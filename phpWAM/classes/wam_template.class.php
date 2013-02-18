<?php

class wam_template extends Smarty {

    function __construct()
    {
        parent::__construct();

        $this->setTemplateDir(phpWAM_DIR . 'layout/templates/');
        $this->setCompileDir(phpWAM_DIR . 'var/templates_c/');
        $this->setConfigDir(phpWAM_DIR . 'var/configs/');
        $this->setCacheDir(phpWAM_DIR . 'var/cache/');

        // Caching disabled for development
        // $this->caching = Smarty::CACHING_LIFETIME_CURRENT;
        $this->assign('app_name', 'Work Assignment Manager');
    }
}
