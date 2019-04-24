<?php
$dir=dirname(dirname(__FILE__));  
require_once $dir.'/DBfuncs/sqlConn.php';
//require_once("sqlSts.php");

if(isset($_GET["pUserName"]))
{
	$partName=$_GET["pUserName"];
	$conn=connectDB();
	$names=array(); //hold a list of names return from SQL
	$query="SELECT UserLoginName FROM tblusers WHERE UserLoginName like '$partName%' ORDER BY UserLoginName";
    $arr=getResultFromTable($conn,$query);  //arr['UserLoginName']="mis"....
    foreach ($arr as $record) {
    	 foreach ($record as $key => $value) {
    	 	array_push($names, $value);
    	 }
    	
    }
    $popStr=implode(" ",$names);  //php echp "major med minzt mis"
    
     echo $popStr;
}




function getResultFromTable($conn, $query)
{

	//get the content
	$arr=array();
	$result=$conn->query($query);
	if(!$result) die("Fatal Error on query");

	$rows=$result->num_rows;
	for($i=0;$i<$rows;$i++)
	{
		array_push($arr, $result->fetch_assoc());
    }
    
    $result->free();
    return $arr;

}

?>