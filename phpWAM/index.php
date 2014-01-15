<?php

/*
 * phpWAM main file serving all requests.
 * 
 */

// Define our application directory
define('phpWAM_DIR', dirname(__FILE__) . '/');
// Define SMARTY_DIR
define('SMARTY_DIR', phpWAM_DIR . 'classes/Smarty/');

// Define permissions
define('CAN_LIST_ALL', 1);
define('CAN_EDIT_USERS', 2);
define('CAN_EDIT_REQUESTS', 4);
define('CAN_EDIT_SELF_PROJECTS', 8);
define('CAN_APPROVE_REQUEST', 16);

// Loading configuration
require phpWAM_DIR . 'config.php';

// Class autoloader function
function cbs_autoloader($class) {
    if ($class == "Smarty") {
        include 'classes/Smarty/Smarty.class.php';
    } elseif ($class == "adLDAP") {
        include 'classes/adLDAP/adLDAP.php';
    } elseif (strpos($class, "Smarty") === false) {
        include 'classes/' . $class . '.class.php';
    }
}

spl_autoload_register('cbs_autoloader');

// Starting the session
session_start();

// Checking if user already logged in
if (!isset($_SESSION['username'])) {
    $loginh = new login($LDAP_CONFIG, $DB_CONFIG);
     if ($loginh->authFrom_IIS_AUTHUSER($_SERVER['AUTH_USER'])) {
         $_SESSION = array_merge($_SESSION, $loginh->getUserDetails());
     } else { die('Authentication failed - Unknown user or server is not supporting Windows Authentication.');}
}

// Instanciating main class.
$wam = new wam($DB_CONFIG);

// set the current action
$_page = isset($_REQUEST['page']) ? $_REQUEST['page'] : 'dashboard';
$_action = isset($_REQUEST['action']) ? $_REQUEST['action'] : '';

switch ($_page) {
    case 'setup':
        $wam->ni("setup");
        break;
    case 'parse':
        $wam->ni("parse");
        var_dump($_REQUEST);
        break;
    case 'dashboard':
    default:
        $wam->ni("dashboard");
        var_dump($_SESSION);
        break;
}
