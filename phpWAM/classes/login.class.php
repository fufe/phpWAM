<?php

class login {

    var $ldap_config = array();
    var $ldaph = null;
    var $username = null;
    var $displayname = null;
    var $domain = null;
    var $userdetails = array();
    var $dbconfig = array();
    var $dbh = null;

    public function __construct($config = array(), $dbconfig = array()) {
        $this->ldap_config = $config;
        try {
            $this->ldaph = new adLDAP($this->ldap_config);
        } catch (adLDAPException $e) {
            die($e);
        }

        $this->dbconfig = $dbconfig;
        try {
            $this->dbh = new db_sqlsrv($this->dbconfig);
        } catch (Exception $e) {
            die($e);
        }
    }

    function authFrom_IIS_AUTHUSER($auth_user) {
        if ($auth_user != '') {
            $details = explode('\\', $auth_user);
            if (strtoupper($details[0]) == strtoupper($this->ldap_config['domain'])) {
//                $userinfo = $this->ldaph->user()->infoCollection($details[1], array("*"));
//                if ($userinfo) {
//                    $this->userdetails['username'] = $details[1];
//                    $this->userdetails['domain'] = $details[0];
//                    $this->userdetails['displayname'] = $userinfo->displayname;
////                    $this->userdetails['isitscheduleadmin'] = $this->checkIfUserIsAdmin($details[1]);
//                }
                if ($this->getUserDetailsFromDB($details[1]))
                    return TRUE;
                else
                    return FALSE;
            } else {
                $this->userdetails = null;
                return FALSE;
            }
            return TRUE;
        } else {
            $this->userdetails = null;
        }
        return FALSE;
    }

    private function getUserDetailsFromDB($guid) {
        if ($userdetails = $this->dbh->getUserDetails($guid)) {
            $this->userdetails = $userdetails;
            return TRUE;
        } else {
            return FALSE;
        }
    }

    public function getUserDetails() {
        return $this->userdetails;
    }

}
