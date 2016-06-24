var httpRequeset = null;

function getXMLHttpRequest() {
   return new XMLHttpRequest();
}

function sendRequest(method, url, params, callback){
   httpRequest = getXMLHttpRequest();

   var httpMethod = method ? method : "GET";
   if(httpMethod != "GET" && httpMethod != "POST"){
      httpMethod = "GET";
   }
   
   var httpParams = (params == null||params=="")?null:params;
   var httpUrl = url;
   
   if(httpMethod == "GET" && httpParams !=null){
      httpUrl = httpUrl + "?" + httpParams;
   }
   
   httpRequest.open(httpMethod, httpUrl, true);
   httpRequest.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=utf-8");
   httpRequest.onreadystatechange = callback;
   httpRequest.send(httpMethod=="POST"?httpParams:null);
}