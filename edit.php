<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <title>Demo Options!</title>
  </head>
  <body>
    <h1>Demo Options!</h1>
     <div class="container">
     <form action="./edit.php" method="post">

    <label class="col-2"> Get user name</label>
            <input class="col-3" list="listNames"  id="loginNameJs" onkeyup="findPartName()" name="loginName">
            <datalist id="listNames">
              

            </datalist>
               
            <input class="btn btn-primary col-2" type="submit" value="Search">
     </form>

	    <?php
	     require_once "./DBfuncs/sqlConn.php";
	     require_once "./DBfuncs/sqlSts.php";
	     require_once "./util/optionSupport.php";

	    $conn=connectDB();
	    $query="SELECT DISTINCT(UserSecGroup) FROM tblprivileges order by UserSecGroup";
	    $arr1=getResultFromTable($conn,$query);

        
        if(isset($_POST["loginName"]))
        {
        	$loginName=$_POST["loginName"];
        	$query="SELECT * FROM tblusers where UserLoginName= '$loginName' ORDER BY UserLoginName";
        }
        else 
	         $query="SELECT * FROM tblusers ORDER BY UserLoginName";
	    
	    $arr=getResultFromTable($conn,$query);
	 
	    $query="SELECT SiteID FROM tlkpsite";
        $arrSiteID= getResultFromTable($conn,$query);
	    //table header
        echo<<<EOT
			<table class="table table-hover">
			 <thead>
			  <tr>
			    <th>UserLoginName</th>
			    <th>Privilege</th>
			    <th>SiteID</th>
			  </tr>
   			</thead>
   			<tbody>
EOT;

	    foreach ($arr as $record) {

	    	//for the first record:
	    	// reocrd['UserLoginName']="abbott" 
	    	// record['UserPW']="Hello"....
	    	$pv=$record['Privilege'];
	        $oStr=optionGen("securityId","securityName",$arr1,$pv);
	 

            $siteID=$record['fkSiteID'];
            $oStrID=optionGen("siteID","siteName",$arrSiteID,$siteID);
  
  			$name=$record['UserLoginName'];
  			echo "<tr>";
  			echo '<form action="./editUserHandler.php" method="post">';
  			//form
  			echo "<td>$name</td>";
             echo "<td>$oStr</td>";
             echo "<td>$oStrID</td>";
             echo "<td><button type=\"submit\" class=\"btn btn-primary\">Edit</button></td></form>";
             echo "</tr>";
	    }
    echo "</tbody></table>";
	    ?>
     
     </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script type="text/javascript" src="./javascript/superUser.js"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </body>
</html>