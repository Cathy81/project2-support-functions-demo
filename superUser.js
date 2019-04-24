function findPartName () {
	
	var dataList=document.getElementById("loginNameJs");
	var partName=dataList.value;
	if(partName.length>=1)
	{
		var xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
         var strNames= this.responseText;
                var arrNames=strNames.split(" ");
                var opt='';
                for (var name of arrNames)
                {
                  opt +='<option value="'+name+'">';
                  
                 }
                 document.getElementById("listNames").innerHTML=opt;  
                }
        };
	xhttp.open("GET", "./util/userSearch.php?pUserName="+partName, true);
	xhttp.send();
	}
}