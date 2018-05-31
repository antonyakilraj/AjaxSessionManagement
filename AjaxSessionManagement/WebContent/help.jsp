<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AJAX TRIAL</title>

<script type="text/javascript">

function sendInfo()
{  
 			var xhttp = new XMLHttpRequest();
	
	xhttp.onreadystatechange = function() {
	    if (xhttp.readyState == 4 && xhttp.status == 200) {
	    	document.getElementById("output_code").innerHTML=this.responseText;
	     //alert(this.responseText);	      
	    }
 	    else  if (xhttp.status == 500){
	    	document.getElementById("output_code").innerHTML='Session Expired';
	    } 
	   		
		  };
	   vl = document.getElementById("reqFor").value;
	   alert (vl);
	  xhttp.open("GET", "/AjaxSessionManagement/Trial?reqFor="+vl, true);
	  xhttp.send();
  }
</script>
<body>
	<h1>Session validation</h1>
	1) Click the button without value to create a session.
	2) Enter random data and click the button again to validate the session.
	                      Session time=10s
	<form name="ping">
		<input type="button" value="Ajax Call" onClick="sendInfo()">
	</form>

	<input type="text" name="reqFor" id="reqFor" />

	<div id="output_code"></div>
</body>
</html>