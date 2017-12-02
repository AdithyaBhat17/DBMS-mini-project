<?php
session_start();
$_SESSION['abc'] = 1;
$_SESSION['model']="";
?>
<html>
<head>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>
	
	</head>
<body class="background">
<?php 
include 'css/style.css' ; 

foreach($_REQUEST as $key => $value)
{
}

try {
    $pdo = new PDO("mysql:host=localhost;dbname=mobiledb", 'root', '');
    // execute the stored procedure
    
    $_SESSION['abc'] = $key;
    
    $sql = 'select m.e_commerce,m.model_id,m.brand_id,m.price,m.popularity,b.brand_name,m.model_name,s.p_camera,s.s_camera,s.ram,s.rom,s.screen_size,o.os_name,o.os_version,s.battery,p.processor_name,p.p_vendor,p.gpu,p.no_of_cores,m.img 
    from brand b,model m,specifications s,processor p,operating_system o 
    where b.brand_id=m.brand_id and b.brand_id=s.brand_id and s.model_id=m.model_id and s.os_id=o.os_id and s.processor_id=p.processor_id and s.model_id=' .$key .'';

    $stmt = $pdo->prepare($sql);
    
    $r =$stmt->execute();
    $models = $stmt->fetchAll(PDO::FETCH_ASSOC);
    //var_dump($models);
    $model = $models[0];
    $_SESSION['model']=$model;
    //var_dump($model);
    //$conn->close();
    
    //var_dump($models);
    //var_dump($models[9]['model_name']);
    // while ($row = $stmt->fetch(PDO::FETCH_NUM, PDO::FETCH_ORI_NEXT)) {
    //     $data = $row[0] . ":" . $row[1]  . "\n";
    //    print $data;
    //  var_dump($data);
    //}
    
    /* if($uid > 0) {
     $username = $_REQUEST['uname'];
     
     }*/
    //var_dump($uid);
    // execute the second query to get values from OUT parameter
    //var_dump($r);
} catch (PDOException $pe) {
    die("Error occurred:" . $pe->getMessage());
}
?>

   <div id="aa" style="white-space:nowrap">
   	  <div id="image" style="display:inline;">
        <img src="icon.png"/>
    </div>
      <div id="texts" style="display:inline; white-space:nowrap;">SMARTPHONE ALLEY</div>
      <div id="texts" style="display:inline;position:relative;top:-15;left:250; font-size:18px">User : <?php echo $_SESSION['user_name'];?></div>
      <a id="texts" style="display:inline;position:relative;top:-15;left:300;font-size:18px" href="first.php">LOGOUT</a>
    </div>
    <h4 align=center><a href="login.php" style="font-family : Nexa Bold;text-align:center;font-size:15px;color:#D8D8D8;position:relative;top:-10;left:10;">Not satified? Try changing your budget here</a></h4>
    
    
    <div style="position:relative;top:10;left :500;">
    <?php echo '<img src="' . $model['img'] . '" width="20%" height="60%"/>' ?> 
    <a href ="wishlist.php" ><button style="background:#424A60;position:relative; ;font-family:Nexa;font-size:11px;width:12%;height:5%;">
     ADD TO WISHLIST</button></a>
     </div>
     
     <section style="position: relative;top:30;left:200;width:70%;font-color:white;">
    <h5 style="font-family: TT Norms;font-size:20px;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Brand :<span style="float:right;"> <?php echo $model['brand_name'] ?></span></h5>
    
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60;background:white;border-radius:5px;padding:6px;">Model :<span style="float:right;"> <?php echo $model['model_name'] ?></span></h5>
   
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Price :<span style="float:right;"> <?php echo $model['price'] ?></span></h5>
      
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Primary Camera (MPs) :<span style="float:right;"> <?php echo $model['p_camera'] ?></span></h5>
    
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60;background:white;border-radius:5px;padding:6px;">Secondary Camera (MPs) :<span style="float:right;"> <?php echo $model['s_camera'] ?></span></h5>
    
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">RAM :<span style="float:right;"> <?php echo $model['ram'] ?></span></h5>
   
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Memory (internal) :<span style="float:right;"> <?php echo $model['rom'] ?></span></h5>
   
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Screen Size (inches) :<span style="float:right;"> <?php echo $model['screen_size'] ?></span></h5>
   
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">OS :<span style="float:right;"> <?php echo $model['os_name'] ?></span></h5>
    
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Battery (mAh) :<span style="float:right;"> <?php echo $model['battery'] ?></span></h5>
   
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Processor :<span style="float:right;"> <?php echo $model['p_vendor']; echo $model['processor_name'] ?></span> </h5>
  
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60; background:white;border-radius:5px;padding:6px;">GPU :<span style="float:right;"> <?php echo $model['gpu'] ?></span></h5>
  
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60 ;background:white;border-radius:5px;padding:6px;">Processor cores :<span style="float:right;"> <?php echo $model['no_of_cores'] ?></span></h5>
   
    <h5 style="font-size:20px;font-family: TT Norms;color:#424A60  ;background:white;border-radius:5px;padding:6px;">Popularity :<span style="float:right;"> <?php echo $model['popularity'] ?></span></h5>
    
    </section>
       </body>
       </html>