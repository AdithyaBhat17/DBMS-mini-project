<?php
session_start();
$_SESSION['user_id'] = 1;
$_SESSION['user_name']='arjun';
?>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
	</head>
<div class="background">
<?php 
include 'css/style.css' ; 
$servername = "localhost:3306";
$username = "root";
$password = "";

// Create connection
$conn = new mysqli($servername, $username, $password);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
/*echo "Connected successfully to mysql";*/
$sql = "SELECT * FROM mobiledb.processor";
$result = $conn->query($sql);
if($result == false) {
   /* echo "Query fiailed";*/
    die("Query failed");
}
/*
{  
 /*if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) {
        
        echo "id: " . $row["PROCESSOR_ID"] . ",PROCESSOR_NAME:" . $row["PROCESSOR_NAME"] . ",VENDOR:" . $row["P_VENDOR"] . "<br>" ;
    }
} else {
    echo "0 results";
}
*/

$conn->close();
//die("Testing ended");
// define variables and set to empty values
$name = $email = $gender = $comment = $website = "";

if(!isset($_REQUEST['uname'])) {
?>

   <div id="aa" style="white-space:nowrap">
   	  <div id="image" style="display:inline;">
        <img src="icon.png"/>
    </div>
      <div id="texts" style="display:inline; white-space:nowrap;">SMARTPHONE ALLEY</div>
      
      </div>
 
      <p id="cc" align="center">
      Looking for a smartphone?<br>
      we are here to help!
      </p>   
     
  <div class="login-page">
  		<div class="form">
    		<form class="login-form" method="post" action="" >
      			<input type="text" placeholder="username" name="uname" required />
      			<input type="password" placeholder="password" name="psw" required />
      			<input type="submit" value="LOGIN"/>
      			<p class="message">Not registered? <a href="signup.php">Create an account</a></p>
    		</form>
  		</div>
	</div>


 <?php
} else {
    try {
        $pdo = new PDO("mysql:host=localhost;dbname=mobiledb", 'root', '');
        
        // execute the stored procedure
        $sql = 'select  validateUser(:name,:psw)';
        $stmt = $pdo->prepare($sql);
        
        $stmt->bindParam(':name', $_REQUEST['uname'], PDO::PARAM_STR);        
        $stmt->bindParam(':psw', $_REQUEST['psw'], PDO::PARAM_STR);
        $r =$stmt->execute();
        
        $r = $stmt->fetch(PDO::FETCH_NUM);
        $stmt->closeCursor();
        //var_dump($r);
        
        //echo "<script>alert('Invalid User name or password, please retry');document.location='first.php'</script>";
        $uid = (int)$r[0];
        
       if($uid > 0) {
            $username = $_REQUEST['uname'];
            $_SESSION['user_id'] = $uid;
            //var_dump($uid);
            //echo "<script>alert('Invalid User name or password, please retry');document.location='first.php'</script>";
            $_SESSION['user_name'] = $_REQUEST['uname'];
            echo "<script>document.location='login.php'</script>";
        } else {
            $_SESSION['user_id'] = 0;
            $_SESSION['user_name'] = 'Unknown';
            unset($_REQUEST['uname']);
            echo "<script>alert('Invalid User name or password, please retry');document.location='first.php'</script>";
            
        }
        printf("%d\n",$uid);
        //var_dump($uid);
        // execute the second query to get values from OUT parameter
        //var_dump($r);
    } catch (PDOException $pe) {
        die("Error occurred:" . $pe->getMessage());
    }
}
 ?>        
     
      
 </div>
 	
</html>  
