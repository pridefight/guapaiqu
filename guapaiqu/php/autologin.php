<?php
require_once  "guapai-config.php";

	// Check if the cookie exists
    if(isSet($_COOKIE["guapaiqucookie"]))
    {
	    parse_str($_COOKIE["guapaiqucookie"]);
	    $mysqli=new mysqli(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME);
        $result = $mysqli->query("SELECT uid FROM LoginInfo where uid = '$usr' and passwd = '$hash'");
        if($result->num_rows > 0)
        {
	      $_SESSION['uid'] = $usr;
    	}
		$mysqli->close();
	}

?>