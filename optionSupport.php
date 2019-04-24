<?php 

//    example #1 of using the following function to generate priviledge option: $query="SELECT DISTINCT(UserSecGroup) FROM tblprivileges order by UserSecGroup";
 //    example: $arr1=getResultFromTable($conn,$query);
// $pv=$record['Privilege'];
//  $oStr=optionGen("security","secuityLevel",$arr1,$pv);
 //       echo $ $oStr;
 //       
 //      
 //       example #2 of using the following function to generate siteID option field
 //        $query="SELECT SiteID FROM tlkpsite";
  //  $arrSiteID= getResultFromTable($conn,$query);
 //         $sID=$record["fkSiteID"];
 //         $oStr=optionGen("siteID","fkSiteID",$arrSiteID,$sID);
 //         echo $ $oStr; 
 //       
 //       
 function optionGen($id,$field,$arr,$selectedValue)
 {
   
   $optionStr= "<select id=\"$id\" name=\"$field\">";
               
   foreach ($arr as $item1)
     foreach ($item1 as $key => $value) 
        {
           if ($value==$selectedValue)
             $optionStr.= "<option value=\"$value\" selected>$value</option>";
           else
            $optionStr.= "<option value=\"$value\" >$value</option>";

        }
  $optionStr.=" </select>";
  return $optionStr;

    }
?>
