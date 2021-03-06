<?php

/**
 * Database access configuration.
 */
$DB_CONFIG = array(
    'db_engine' => 'sqlsrv',
    'db_server' => 'DC01\\SQLEXPRESS',
    'db_database' => 'phpWAM',
    'db_username' => 'sa',
    'db_password' => 'Password55'
);

/**
 * LDAP access configuration
 * Example:
 *     'domain_controllers' => array ('192.168.56.2'),      //array of the DCs in your network
 *     'account_suffix' => '@capsule.corp',                 //should be in '@fqdn' format
 *     'base_dn' => 'OU=CapsuleUsers, dc=capsule, dc=corp', //in LDAP dn form, where your users reside
 *     'admin_username' => 'phpWAM.admin',                  //a valid user in the domain
 *     'admin_password' => 'Password55',                    //password of the user
 *     'domain' => 'CAPSULE'                                //the domain's name, in full UPPERCASE form
 */
$LDAP_CONFIG = array(
    'domain_controllers' => array('192.168.56.99'),
    'account_suffix' => '@capsule.corp',
    'base_dn' => 'OU=CapsuleUsers, dc=capsule, dc=corp',
    'admin_username' => 'phpWAM.admin',
    'admin_password' => 'Password55',
    'domain' => 'CAPSULE'
);

// Setting timezone to avoid php warnings.
date_default_timezone_set('Europe/Budapest');
