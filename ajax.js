/*
Example
Split a string into an array of substrings:

var str = "How are you doing today?";
var res = str.split(" ");
The result of res will be an array with the values:

How,are,you,doing,today?
*/



function loadIOs() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoIO5").innerHTML = xhttp.responseText;
      var araj = xhttp.responseText.split(";"); //separator
      var dlzka = araj.length
      //for (i = 0; i < dlzka; i++) {
        //text += "<li>" + fruits[i] + "</li>";
      //}
      document.getElementById("demoIO1").innerHTML = araj[0];
      document.getElementById("demoIO2").innerHTML = araj[1];
      document.getElementById("demoIO3").innerHTML = araj[2];
      document.getElementById("demoIO4").innerHTML = araj[3];
      document.getElementById("demoIO5").innerHTML = araj[4];
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?R=readAll", true);
  xhttp.send();
}



function loadIO1() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoIO1").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?IO1=read", true);
  xhttp.send();
}
 

function loadIO2() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoIO2").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?IO2=read", true);
  xhttp.send();
}
 

function loadIO3() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoIO3").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?IO3=read", true);
  xhttp.send();
}
 

function loadIO4() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoIO4").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?IO4=read", true);
  xhttp.send();
}
 

function loadIO5() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoIO5").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?IO5=read", true);
  xhttp.send();
}

function loadT1() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoT1").innerHTML = xhttp.responseText;
    }
  };
//  xhttp.open("GET", "ajax_info.txt", true);
  xhttp.open("GET", "/cgi-bin/jaroCGI?t1=read", true);
  xhttp.send();
}

function loadT2() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoT2").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?t2=read", true);
  xhttp.send();
}
 

function loadT3() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoT3").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?t3=read", true);
  xhttp.send();
}


function loadT4() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("demoT4").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "/cgi-bin/jaroCGI?t4=read", true);
  xhttp.send();
}
 

