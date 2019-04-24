<?php 
$dir= dirname(dirname(__FILE__)); //get /project2
require_once $dir.'/DBfuncs/sqlConn.php';
require_once $dir.'/DBfuncs/sqlSts.php';
$security=$_GET['value'];
	 $conn=connectDB();
	 $query="SHOW FULL COLUMNS FROM tblprivileges";;
     $arr2=getResultFromTable($conn,$query);
     $comments=array();
     foreach($arr2 as $record) {                         
        array_push($comments,$record['Comment']);
     }
      array_shift($comments);
     array_shift($comments);

     $popContent=array();
     $popStr="<ul>";
     $query="SELECT ssnView, cnView, cnEdit, mtView, mtEdit, eaEdit, phEdit, bmEdit, rmView, amView, smEdit, gUpdates, ecApplication, emApplication, fpSearch FROM tblprivileges WHERE UserSecGroup='$security'";
      $arr3=getResultFromTable($conn,$query);
    
     foreach ($arr3 as $record) {
       $commentsIndex=0;                              
       foreach ($record as $key => $value) {
         if($value==1)
         {
       //   echo $commentsIndex." ".$comments[$commentsIndex]."<br>";  
          array_push($popContent,$comments[$commentsIndex]);
           $popStr.="<li>$comments[$commentsIndex]</li>";
            
          }
          $commentsIndex++;
       }
     }
     $popStr.="</ul>";
     echo $popStr;
?>