<?php

/*
 * Database class for MS SQL PDO object.
 * 
 */

class db_sqlsrv {

    // database object
    var $dbh = null;

    /**
     * class constructor
     */
    function __construct($config = array()) {
        // instantiate the pdo object
        try {
            $dsn = "{$config['db_engine']}:server={$config['db_server']};database={$config['db_database']}";
            $this->dbh = new PDO($dsn, $config['db_username'], $config['db_password']);
            $this->dbh->query('SET NAMES utf8');
        } catch (PDOException $e) {
            print "Error!: " . $e->getMessage();
            die();
        }
    }

    function getUserDetails($username) {
        $sth = $this->dbh->query("SELECT * FROM Users WHERE login='$username'");
        if ($sth == FALSE) {
            return FALSE;
        } else {
            return $sth->fetch(PDO::FETCH_ASSOC);
        }
    }
    
    function getUsers() {
        $sth = $this->dbh->query("SELECT ID,Name,Login FROM Users ORDER BY name");
        if ($sth == FALSE) {
            return FALSE;
        } else {
            return $sth->fetchAll(PDO::FETCH_ASSOC);
        }
    }

}
