<?php

// Validation
if(_VALID !='Yes')
{// Restricted access
	include_once($_SERVER['DOCUMENT_ROOT'] . '/404.php');
	exit();
}

// English
$lang = array();
$lang['website.message.welcome'] = 'Hello world!';

# Errors traffic
$lang['website.traffic.ip.invalid'] = 'Your IP address is not valid in order to navigate further.';
$lang['website.traffic.urlfrom.invalid'] = 'Something went wrong, please try again later';
$lang['website.traffic.crash'] = 'We sorry, right now we make some updates. Please come back later. Thank you!// Something goes wrong';
# Forms
# Labels
$lang['website.forms.label.username'] = 'Username';
$lang['website.forms.label.password'] = 'Password';
$lang['website.forms.label.remember.me'] = 'Remember me';
$lang['website.forms.label.password.forgot'] = 'I forgot my password';
$lang['website.forms.label.securitycode'] = 'Security code';
# Buttons
$lang['website.forms.button.login'] = 'Log in';
$lang['website.forms.button.done'] = 'Done';
# Log in
$lang['website.login.title'] = 'Log in';
$lang['website.login.message.empty'] = 'Please enter your log in information.';
$lang['website.login.message.crash'] = 'Something went wrong, please try again later.';
$lang['website.login.message.wrong'] = 'Wrong log in data, please try again.';
# Emails
# Admin security code
$lang['email.subject.admin.security.code'] = 'Double step authentification code';
$lang['email.subject.admin.message.1'] = 'Use this code for your log in: ';
# Admin
$lang['website.admin.panel'] = 'Admin Panel';

?>