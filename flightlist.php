<?php
session_start();

$con=mysqli_connect("localhost","root","","airline_reservation");
if(!isset($con))
{
    die("Database Not Found");
}


if(isset($_REQUEST["u_sub"]))
{
    
 $id=$_POST['pnr'];

 if($id!='')
 {
   $query=mysqli_query($con ,"select * from flight_details where departure_date='".$id."'");
   $res=mysqli_fetch_row($query);
   $query0=mysqli_query($con ,"select * from flight_details where departure_date='".$id."'");
   $res0=mysqli_fetch_row($query0);
   $query1=mysqli_query($con ,"select * from flight_details where departure_date='".$id."'");
   $res1=mysqli_fetch_row($query1);

   if($res)
   {
    $_SESSION['user']=$id;
    header('location:flightcheck.php');
   }
   else
   {
    
    echo '<script>';
    echo 'alert("No Flight")';
    echo '</script>';
   }
if($res0)
   {
    $_SESSION['user']=$id;
    header('location:flightcheck.php');
   }
   else
   {
    
    echo '<script>';
    echo 'alert("No Flight")';
    echo '</script>';
   }


   
   if($res1)
   {
    $_SESSION['user']=$id;
    header('location:flightcheck.php');
   }
   else
   {
    
    echo '<script>';
    echo 'alert("No Flight")';
    echo '</script>';
   }
  }
 else
 {
     echo '<script>';
    echo 'alert("No Flight")';
    echo '</script>';
 
 }
}
?>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link type="text/css" rel="stylesheet" href="css/login.css"></link>
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css">
         <link rel="stylesheet" href="bootstrap/bootstrap-theme.min.css">
       <script src="bootstrap/jquery.min.js"></script>
        <script src="bootstrap/bootstrap.min.js"></script>

       
        <title></title>
        
        
        
    </head>
    <body  style="background-image:url('./images/inbg.jpg');" >
        <form id="index" action="flightlist.php" method="post">
            
            <div class="container-fluid">    
                <div class="row">
                  <div class="col-sm-12">
                        
                  </div>
                 </div>    
             
        
            
            
                <div  id="divtop">
                    <center>
                        <br> <br><br>
                            <div id="dmain"  > 
                               <center><img src="./images/irctc.jpg" width="180px" height="150px" ></center>
                                <br>
                                    <input type="text" id="u_id" name="pnr" class="form-control" style="width:300px; margin-left: 66px;" placeholder="YYYY-MM-DD"><br>
                                   
                                    <input type="submit" id="u_sub" name="u_sub" value="Check Flights" class="toggle btn btn-primary" style="width:100px; margin-left: 70px;"><br>
                                   
                             </div>
                     </div>
                    </div>
               </div>
            </div>  
            </div>
        </form>  
       </body>
</html>
