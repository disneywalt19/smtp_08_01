<?php

// Validation
if(_VALID !='Yes')
{// Restricted access
	include_once($_SERVER['DOCUMENT_ROOT'] . '/404.php');
	exit();
}

// Polish
$lang = array();
$lang['website.message.welcome'] = 'Witaj Swiecie!';

?>