<?php
// Validation
if(_VALID !='Yes')
{
	// Restricted access
	include_once($_SERVER['DOCUMENT_ROOT'] . '/404.php');
	exit();
}

// Get login status
function adminLogin($username, $password) {
	
		$resultArray = array(
		'ID' 		 => 0,
		'email'		 => '',
		'username'   => '',
		'password'   => '',
		'doubleStep' => false,
		'status' 	 => true,
		'message' 	 => ''
		);
	if($username != '' && $username !=' ' && $password != '' && $password != ' ') {
		// Filter values
		$username = $GLOBALS['mysqli']->real_escape_string($username);
		$password = $GLOBALS['mysqli']->real_escape_string($password);
		
		$sqlLogin = "
			SELECT adminID, adminEmail, adminUsername, adminPassword, adminSecurityEnabled 
			FROM sc_admins
			WHERE adminUsername = '$username' AND 
			adminPassword = '$password' AND 
			adminStatus   = '1'
			LIMIT 1
			";
		$queryLogin = $GLOBALS['mysqli']->query($sqlLogin);
		
		// Check log in
		if($queryLogin === FALSE) {
			// Query failed
			$resultArray['message'] = 'website.login.message.crash';
		} else {
			$countLogin = $queryLogin->num_rows;
			
			if($countLogin == 1) {
				// Get data
				$rowLogin = $queryLogin->fetch_assoc();
				
				$resultArray['ID'] 		 = $rowLogin['adminID'];
				$resultArray['email'] 	 = $rowLogin['adminEmail'];
				$resultArray['username'] = $rowLogin['adminUsername'];
				$resultArray['password'] = $rowLogin['adminPassword'];
				
				// Check double step
				if($rowLogin['adminSecurityEnabled'] == '1') {
					$resultArray['doubleStep'] = true;
				}
				
				$resultArray['status'] = true;
			} else {
				// Invalid log in
				$resultArray['message'] = 'website.login.message.wrong';
			}
		}
		
	} else {
		// Empty log in fields
		$resultArray['message'] = 'website.login.message.empty';
	}
	return $resultArray;
}

// Update last log
function adminUpdateLog($adminID) {
	if(strlen($adminID) < 21) {
		// Filter value
	$adminID = preg_replace('#[^0-9]#', '', $adminID);
	$adminIP = strip_tags($_SERVER['REMOTE_ADDR']);
	$adminIP = $GLOBALS['mysqli']->real_escape_string($IP);
	$sqlUpdate = "UPDATE sc_admins SET adminLoginIP='adminIP', adminLoginDate=now() WHERE adminID='$adminID' AND adminStatus='1' LIMIT 1";
	$queryUpdate = $GLOBALS['mysqli']->query($sqlUpdate);
	}
}

// Update admins security code
function adminUpdateSecurityCode($adminID, $code) {
	if ($adminID != '' && $code != '') {
		if(strlen($adminID) < 21 && strlen($code) == 6) {
			// Filter values
			$adminID = preg_replace('#[^0-9]#', '', $adminID);
			$code = preg_replace('#[^0-9]#', '', $code);
			$sqlUpdate = "UPDATE sc_admins SET adminSecurityCode='$code' WHERE adminID='$adminID' AND  adminSecurityEnabled='1' AND adminStatus='1' LIMIT 1";
			$queryUpdate = $GLOBALS['mysqli']->query($sqlUpdate);

			if ($queryUpdate === FALSE) {
				// Query error
				return false;
			} else {
				// Success
				return true;
			}
		}
	}

	return false;
}

?>