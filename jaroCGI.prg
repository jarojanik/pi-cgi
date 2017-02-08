#define CRLF chr(13)+chr(10)
#define LF chr(10)

ANNOUNCE HB_GT_SYS
//REQUEST HB_GT_WIN_DEFAULT
REQUEST HB_GT_CGI

/*
Variable Name	Description
---------------------------
CONTENT_TYPE	The data type of the content. Used when the client is sending attached content to the server. For example file upload etc.
CONTENT_LENGTH	The length of the query information. It's available only for POST requests
HTTP_COOKIE	Return the set cookies in the form of key & value pair.
HTTP_USER_AGENT	The User-Agent request-header field contains information about the user agent originating the request. Its name of the web browser.
PATH_INFO	The path for the CGI script.
QUERY_STRING	The URL-encoded information that is sent with GET method request.
REMOTE_ADDR	The IP address of the remote host making the request. This can be useful for logging or for authentication purpose.
REMOTE_HOST	The fully qualified name of the host making the request. If this information is not available then REMOTE_ADDR can be used to get IR address.
REQUEST_METHOD	The method used to make the request. The most common methods are GET and POST.
SCRIPT_FILENAME	The full path to the CGI script.
SCRIPT_NAME	The name of the CGI script.
SERVER_NAME	The server's hostname or IP Address
SERVER_SOFTWARE	The name and version of the software the server is running.
*/

static lDetach:=.f.
//-----------------------------------------------------------------------------//
function main()
local cBody:=''		//telo cgi dat
local cOut:=''		//vystupny retazec
local cT1,cT2,cT3,cT4
local cLED,cR1,cR2,cR3,cR4,cRall
//-------------- cgi parameter sort -----------

hb_memowrit("/tmp/QUERY_STRING.txt",getEnv("QUERY_STRING"))

do case
case getEnv("QUERY_STRING")=="LED=zap"
//hb_processRun( xProg + ' ' + cParam, , @cStdOut, ,.F. )
hb_processRun( 'gpio write 25 1', , , ,lDetach )

case getEnv("QUERY_STRING")=="LED=vyp"
hb_processRun( 'gpio write 25 0', , , ,lDetach )

case getEnv("QUERY_STRING")=="r1=zap"
hb_processRun( 'gpio write 21 1', , , ,lDetach )

case getEnv("QUERY_STRING")=="r1=vyp"
hb_processRun( 'gpio write 21 0', , , ,lDetach )

case getEnv("QUERY_STRING")=="r2=zap"
hb_processRun( 'gpio write 22 1', , , ,lDetach )

case getEnv("QUERY_STRING")=="r2=vyp"
hb_processRun( 'gpio write 22 0', , , ,lDetach )

case getEnv("QUERY_STRING")=="r3=zap"
hb_processRun( 'gpio write 23 1', , , ,lDetach )

case getEnv("QUERY_STRING")=="r3=vyp"
hb_processRun( 'gpio write 23 0', , , ,lDetach )

case getEnv("QUERY_STRING")=="r4=zap"
hb_processRun( 'gpio write 24 1', , , ,lDetach )

case getEnv("QUERY_STRING")=="r4=vyp"
hb_processRun( 'gpio write 24 0', , , ,lDetach )

// ajax responses
//--------------- teploty ---------------
case getEnv("QUERY_STRING")=="t1=read"
cT1:=transform(Teplota1(), "999.999" )
cOut:='<div id="demoT1">'+alignRight(cT1)+'</div>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="t2=read"
cT2:=transform(Teplota2(), "999.999" )
cOut:='<div id="demoT2">'+alignRight(cT2)+'</div>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="t3=read"
cT3:=transform(Teplota3(), "999.999" )
cOut:='<div id="demoT3">'+alignRight(cT3)+'</div>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="t4=read"
cT4:=transform(Teplota4(), "999.999" )
cOut:='<div id="demoT4">'+alignRight(cT4)+'</div>'
outStd(cOut)
return nil

//------------ IO --------
/*
local cLED:=readLED()
local cR1 :=readR1()
local cR2 :=readR2()
local cR3 :=readR3()
local cR4 :=readR4()
*/
case getEnv("QUERY_STRING")=="IO1=read"
cLED:=readLED()
*cOut:='<div id="demoIO1">'+cLED+'</div>'
cOut:='<span id="demoIO1">'+cLED+'</span>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="IO2=read"
cR1:=readR1()
cOut:='<div id="demoIO2">'+'X'+cR1+'</div>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="IO3=read"
cR2:=readR2()
cOut:='<div id="demoIO3">'+cR2+'</div>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="IO4=read"
cR3:=readR3()
cOut:='<div id="demoIO4">'+cR3+'</div>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="IO5=read"
cR4:=readR4()
cOut:='<div id="demoIO5">'+cR4+'</div>'
outStd(cOut)
return nil

case getEnv("QUERY_STRING")=="R=readAll"
cRall:=readLED()+';'+readR1()+';'+readR2()+';'+readR3()+';'+readR4()
outStd(cRall)
return nil

otherwise
endcase

//build responde body
cBody+="<html>"
cBody+='<head>'
cBody+='<meta http-equiv="content-type" content="text/html" />'
cBody+='<meta charset="windows-1250">'
cBody+='<meta name="keywords" CONTENT="Automatizácia domácnosti">'
cBody+='<meta name="description" CONTENT="Automatizácia domácnosti s RASBERRYPI3">'
cBody+='<meta name="author" CONTENT="Jaroslav Janík">'
cBody+='<meta name="ROBOTS" CONTENT="ALL">'
cBody+='<title>Spojené štáty Kraèanské</title>' //windows-1250
cBody+='</head>'
cBody+='<body>'
cBody+="<center><h1>Dom Ketynky a Jara</h1></center>"
cBody+="<br>"
cBody+="<center>Spojené Štáty Kraèanské</center>"
cBody+="<br>"
//cBody+="<center>"+tabulka_teplot()+"</center>"+"<br>"
//cBody+="<br>"
//cBody+="<center>"+hb_memoread('tlacitkaLED.txt')+"</center>"+"<br>"
//cBody+="<center>"+hb_memoread('tlacitkaR1.txt')+"</center>"+"<br>"
//cBody+="<center>"+hb_memoread('tlacitkaR2.txt')+"</center>"+"<br>"
//cBody+="<center>"+hb_memoread('tlacitkaR3.txt')+"</center>"+"<br>"
//cBody+="<center>"+hb_memoread('tlacitkaR4.txt')+"</center>"+"<br>"
//cBody+="<br>"
//cBody+="<center>"+"LED: "+readLED()+"</center>"+"<br>"+LF
//cBody+="<center>"+"R1: "+readR1()+"</center>"+"<br>"+LF
//cBody+="<center>"+"R2: "+readR2()+"</center>"+"<br>"+LF
//cBody+="<center>"+"R3: "+readR3()+"</center>"+"<br>"+LF
//cBody+="<center>"+"R4: "+readR4()+"</center>"+"<br>"+LF
//cBody+="<br>"
//cBody+="<center>"+"whoami: "+readR2()+"</center>"+"<br>"
//cBody+="<center>"+velka_tabulka()+"</center>"+"<br>"
*cBody+=center(velka_tabulka())+"<br>"
cBody+=center(velka_tabulka_ajax())+"<br>"
cBody+=ajaxScripts()
*cBody+='<button type="button" onclick="loadDoc()">Reread Content</button>' //button

//zavola js funkciu, ktora znova vyziada stavy R1,E2,R3,R4,LED
cBody+=center('<button type="button" onclick="loadIOs()">Reread all IO</button>')

cBody+='</body>'
cBody+="</html>"

//build output
cOut+=cgiHeader() //cgi header 
cOut+=cBody

outStd(cOut)
*hb_memowrit("/tmp/jaroCGI.out",cOut)
*! whoami >/tmp/whoami.txt
return nil

//-----------------------------------------------------------------------------//
function ajaxScripts()
local cScrtipt:=''
cScrtipt+='<script>'
cScrtipt+=hb_memoread('ajax.js')
cScrtipt+='</script>'
return cScrtipt

//-----------------------------------------------------------------------------//
function cgiHeader()
local cHeader :='' 	//header
local cContentType 	//cgi header part
local cExpires 		//cgi header part
local cLocation 	//cgi header part
local cLastModified 	//cgi header part
local cContentLength    //cgi header part
local cSetCookie 	//cgi header part

//cgi header parts
cContentType:='text/html; charset=windows-1250' //A MIME string defining the format of the file being returned. Example is Content-type:text/html
*cContentType:='text/html' //A MIME string defining the format of the file being returned. Example is Content-type:text/html
cExpires:='01 Jan 1998 12:00:00 GMT'+"<br>" //The date the information becomes invalid. This should be used by the browser to decide when a page needs to be refreshed. A valid date string should be in the format 01 Jan 1998 12:00:00 GMT.
cLocation:='' //The URL that should be returned instead of the URL requested. You can use this filed to redirect a request to any file.
cLastModified :='' //The date of last modification of the resource.
cContentLength:=''//The length, in bytes, of the data being returned. The browser uses this value to report the estimated download time for a file.
cSetCookie:=''	//Set the cookie passed through the string

//build header
cHeader+=iif(!empty(cContentType),'Content-type: '+cContentType+CRLF+"<br>",'')
cHeader+=iif(!empty(cExpires),    'Expires: '+cExpires+"<br>",'')
cHeader+=iif(!empty(cLocation),   'Location: '+cLocation+"<br>",'')
cHeader+=iif(!empty(cLastModified),'Last-modified:  '+cLastModified+"<br>",'')
cHeader+=iif(!empty(cContentLength),'Content-length: '+cContentLength+"<br>",'')
cHeader+=iif(!empty(cSetCookie),  'Set-Cookie: '+cSetCookie+"<br>",'')
cHeader+=CRLF+CRLF
return cHeader

//-----------------------------------------------------------------------------//
function velka_tabulka_ajax()
local lanc:=hb_memoread('velka_tabulka.txt')
//-------read GPIO teploty
local cT1:=transform(Teplota1(), "999.999" )
local cT2:=transform(Teplota2(), "999.999" )
local cT3:=transform(Teplota3(), "999.999" )
local cT4:=transform(Teplota4(), "999.999" )
//-------read GPIO in-out
local cLED:=readLED()
local cR1 :=readR1()
local cR2 :=readR2()
local cR3 :=readR3()
local cR4 :=readR4()
//read humidity
local cHum := readHumidity()

//---------TEPLOTY
lanc := strtran(lanc, "###11###", "" )
lanc := strtran(lanc, "###21###", "" )
lanc := strtran(lanc, "###31###", "" )
lanc := strtran(lanc, "###41###", "" )
//---------
lanc := strtran(lanc, "###12###", "Teplota 1" )
lanc := strtran(lanc, "###22###", "Teplota 2" )
lanc := strtran(lanc, "###32###", "Teplota 3" )
lanc := strtran(lanc, "###42###", "Teplota 4" )
//---------
lanc := strtran(lanc, "###13###", '<div id="demoT1">'+alignRight(cT1)+'</div>' )
lanc := strtran(lanc, "###23###", '<div id="demoT2">'+alignRight(cT2)+'</div>' )
lanc := strtran(lanc, "###33###", '<div id="demoT3">'+alignRight(cT3)+'</div>' )
lanc := strtran(lanc, "###43###", '<div id="demoT4">'+alignRight(cT4)+'</div>' )
//---------
lanc := strtran(lanc, "###14###", center('<button type="button" onclick="loadT1()">Reread T1</button>') )
lanc := strtran(lanc, "###24###", center('<button type="button" onclick="loadT2()">Reread T2</button>') )
lanc := strtran(lanc, "###34###", center('<button type="button" onclick="loadT3()">Reread T3</button>') )
lanc := strtran(lanc, "###44###", center('<button type="button" onclick="loadT4()">Reread T4</button>') )

//---------RELE
lanc := strtran(lanc, "###51###", center(tlacitko('ON','/cgi-bin/jaroCGI?r1=zap')) )
lanc := strtran(lanc, "###52###", iif(val(cR1)==1,red(bold("R1:")),bold("R1:")) )
lanc := strtran(lanc, "###53###", '<div id="demoIO2">'+cR1+'</div>' )
lanc := strtran(lanc, "###54###", center(tlacitko('OFF','/cgi-bin/jaroCGI?r1=vyp')) )
//---------
lanc := strtran(lanc, "###61###", center(tlacitko('ON','/cgi-bin/jaroCGI?r2=zap')) )
lanc := strtran(lanc, "###62###", iif(val(cR2)==1,red(bold("R2:")),bold("R2:")) )
lanc := strtran(lanc, "###63###", '<div id="demoIO3">'+cR2+'</div>'  )
lanc := strtran(lanc, "###64###", center(tlacitko('OFF','/cgi-bin/jaroCGI?r2=vyp')) )
//---------
lanc := strtran(lanc, "###71###", center(tlacitko('ON','/cgi-bin/jaroCGI?r3=zap')) )
lanc := strtran(lanc, "###72###", iif(val(cR3)==1,red(bold("R3:")),bold("R3:")) )
lanc := strtran(lanc, "###73###", '<div id="demoIO4">'+cR3+'</div>'  )
lanc := strtran(lanc, "###74###", center(tlacitko('OFF','/cgi-bin/jaroCGI?r3=vyp')) )
//---------
lanc := strtran(lanc, "###81###", center(tlacitko('ON','/cgi-bin/jaroCGI?r4=zap')) )
lanc := strtran(lanc, "###82###", iif(val(cR4)==1,red(bold("R4:")),bold("R4:")) )
lanc := strtran(lanc, "###83###", '<div id="demoIO5">'+cR4+'</div>'  )
lanc := strtran(lanc, "###84###", center(tlacitko('OFF','/cgi-bin/jaroCGI?r4=vyp')) )

//---------LED
lanc := strtran(lanc, "###91###", center(tlacitko('ON','/cgi-bin/jaroCGI?LED=zap')) )
lanc := strtran(lanc, "###92###", iif(val(cLED)==1,red(bold("LED:")),bold("LED:")) )
lanc := strtran(lanc, "###93###", '<div id="demoIO1">'+cLED+'</div>' )
lanc := strtran(lanc, "###94###", center(tlacitko('OFF','/cgi-bin/jaroCGI?LED=vyp')) )

//--------- humidity
lanc := strtran(lanc, "###99###", 'J_'+cHum+'_J' )
//---------
return lanc


//-----------------------------------------------------------------------------//
function Teplota1()
local lanc:=hb_memoread("/sys/bus/w1/devices/28-000007268829/w1_slave")
local aRiadky := HB_ATOKENS( lanc, chr(10) )
local cTeplota
local nTeplota:=-999

  if len(aRiadky)>=2
    if right(aRiadky[1],3) == 'YES'
    cTeplota := token( aRiadky[2],'=',2)
    nTeplota := val(cTeplota) / 1000
    *? transform(nTeplota, "999.999" )
    endif
  endif
return nTeplota

//-----------------------------------------------------------------------------//
function Teplota2()
local lanc:=hb_memoread("/sys/bus/w1/devices/28-00000728518f/w1_slave")
local aRiadky := HB_ATOKENS( lanc, chr(10) )
local cTeplota
local nTeplota:=-999

  if len(aRiadky)>=2
    if right(aRiadky[1],3) == 'YES'
    cTeplota := token( aRiadky[2],'=',2)
    nTeplota := val(cTeplota) / 1000
    *? transform(nTeplota, "999.999" )
    endif
  endif
return nTeplota

//-----------------------------------------------------------------------------//
function Teplota3()
local lanc:=hb_memoread("/sys/bus/w1/devices/28-000007266f1e/w1_slave")
local aRiadky := HB_ATOKENS( lanc, chr(10) )
local cTeplota
local nTeplota:=-999

  if len(aRiadky)>=2
    if right(aRiadky[1],3) == 'YES'
    cTeplota := token( aRiadky[2],'=',2)
    nTeplota := val(cTeplota) / 1000
    *? transform(nTeplota, "999.999" )
    endif
  endif
return nTeplota

//-----------------------------------------------------------------------------//
function Teplota4()
local lanc:=hb_memoread("/sys/bus/w1/devices/28-00000726f007/w1_slave")
local aRiadky := HB_ATOKENS( lanc, chr(10) )
local cTeplota
local nTeplota:=-999

  if len(aRiadky)>=2
    if right(aRiadky[1],3) == 'YES'
    cTeplota := token( aRiadky[2],'=',2)
    nTeplota := val(cTeplota) / 1000
    *? transform(nTeplota, "999.999" )
    endif
  endif
return nTeplota

//-----------------------------------------------------------------------------//

/*
function tabulka_teplot()
local lanc:=hb_memoread('tabulka_teplot.txt')
//-------read GPIO 
local t1:=transform(Teplota1(), "999.999" )
local t2:=transform(Teplota2(), "999.999" )
local t3:=transform(Teplota3(), "999.999" )
local t4:=transform(Teplota4(), "999.999" )
lanc := strtran(lanc, "###001###", t1 )
lanc := strtran(lanc, "###002###", t2 )
lanc := strtran(lanc, "###003###", t3 )
lanc := strtran(lanc, "###004###", t4 )
return lanc
*/

//-----------------------------------------------------------------------------//
//-----------------------------------------------------------------------------//
*? hb_memoread("/sys/bus/w1/devices/28-000007268829/w1_slave")
/*
(NOTE: HB_openProcess() and HB_closeProcess() where later renamed to HB_ProcessOpen() and HB_ProcessClose().

These are the current syntax:

HB_ProcessOpen( <cCommand>, [ @<cStdIn>, @<cStdOut>, @<cStdErr>, <lDetach>, @<nProcId> ] ) -> <hProcess>

HB_ProcessValue( <hProcess>, <lWait> ) -> <nResult>

HB_ProcessClose( <hPorcess>, <lGentle> ) -> <lResult>

HB_ProcessRun( <cCommand>, [ <cStdIn> ], [ @<cStdOut> ], [ @<cStdErr> ], [ <lDetach> ] ) -> <nResult>
*/
//---------------------------------------------------------------------------//


function readHumidity()
local cStdOut:=''
//hb_processRun( xProg + ' ' + cParam, , @cStdOut, ,.F. )
//hb_processRun( '~/adafruit_python_dht/examples/AdafruitDHT.py 11 17', , @cStdOut, ,.F. )
hb_processRun( '/home/pi/adafruit_python_dht/examples/AdafruitDHT.py 11 17', , @cStdOut, ,.F. )
//hb_processRun( 'sudo /home/pi/adafruit_python_dht/examples/AdafruitDHT.py 11 17', , @cStdOut, ,.F. )
//hb_processRun( 'sudo -u www-data /home/pi/adafruit_python_dht/examples/AdafruitDHT.py 11 17', , @cStdOut, ,.F. )
*hb_memowrit("~/aaa", cStdOut )
*hb_memowrit("/tmp/aaajjj", cStdOut )
return cStdOut

//---------------------------------------------------------------------------//
function readLED() 
local cStdOut:=''
//hb_processRun( xProg + ' ' + cParam, , @cStdOut, ,.F. )
hb_processRun( 'gpio read 25', , @cStdOut, ,.F. )
return cStdOut
//---------------------------------------------------------------------------//

function readR1()
local cStdOut:=''
//hb_processRun( xProg + ' ' + cParam, , @cStdOut, ,.F. )
hb_processRun( 'gpio read 21', , @cStdOut, ,.F. )
return cStdOut
//---------------------------------------------------------------------------//

function readR2()
local cStdOut:=''
//hb_processRun( xProg + ' ' + cParam, , @cStdOut, ,.F. )
hb_processRun( 'gpio read 22', , @cStdOut, ,.F. )
return cStdOut

//---------------------------------------------------------------------------//
function readR3()
local cStdOut:=''
//hb_processRun( xProg + ' ' + cParam, , @cStdOut, ,.F. )
hb_processRun( 'gpio read 23', , @cStdOut, ,.F. )
return cStdOut
//---------------------------------------------------------------------------//

function readR4()
local cStdOut:=''
//hb_processRun( xProg + ' ' + cParam, , @cStdOut, ,.F. )
hb_processRun( 'gpio read 24', , @cStdOut, ,.F. )
return cStdOut

//---------------------------------------------------------------------------//

function tlacitko(cText,cCgi)
local lanc:=''
/*
<form action="/cgi-bin/jaroCGI?r4=zap">
    <input type="submit" formmethod="post" value="R4 zapni">
</form>
*/
lanc+='<form action="'+cCgi+'">'
lanc+='   <input type="submit" formmethod="post" value="'+cText+'">'
lanc+='</form>'
return lanc

//---------------------------------------------------------------------------//
function alignRight(lanc)
return '<P ALIGN=RIGHT>'+lanc+'</P>'
//---------------------------------------------------------------------------//
function alignCenter(lanc)
return '<P ALIGN=CENTER>'+lanc+'</P>'
//---------------------------------------------------------------------------//
function center(lanc)
return "<center>"+lanc+"</center>"
//---------------------------------------------------------------------------//
function bold(lanc)
return "<b>"+lanc+"</b>"
//---------------------------------------------------------------------------//
function red(lanc)
return "<span style=background-color:red;>"+lanc+"</span>"
//---------------------------------------------------------------------------//
*function vAlignCenter(lanc)
*return '<valign="middle">'+lanc
//---------------------------------------------------------------------------//

//-----------------------------------------------------------------------------//
function cgiEnv()
local lanc:=''
lanc+=;
"CONTENT_TYPE	The data type of the content. Used when the client is sending attached content to the server. For example file upload etc."+"<br>";
+getEnv("CONTENT_TYPE")+"<br>";
+"CONTENT_LENGTH	The length of the query information. It's available only for POST requests"+"<br>";
+getEnv("CONTENT_LENGTH")+"<br>";
+"HTTP_COOKIE	Return the set cookies in the form of key & value pair."+"<br>";
+getEnv("HTTP_COOKIE")+"<br>";
+"HTTP_USER_AGENT	The User-Agent request-header field contains information about the user agent originating the request. Its name of the web browser."+"<br>";
+getEnv("HTTP_USER_AGENT")+"<br>";
+"PATH_INFO	The path for the CGI script."+"<br>";
+getEnv("PATH_INFO")+"<br>";
+"QUERY_STRING	The URL-encoded information that is sent with GET method request."+"<br>";
+getEnv("QUERY_STRING")+"<br>";
+"REMOTE_ADDR	The IP address of the remote host making the request. This can be useful for logging or for authentication purpose."+"<br>";
+getEnv("REMOTE_ADDR")+"<br>";
+"REMOTE_HOST	The fully qualified name of the host making the request. If this information is not available then REMOTE_ADDR can be used to get IR address."+"<br>";
+getEnv("REMOTE_HOST")+"<br>";
+"REQUEST_METHOD	The method used to make the request. The most common methods are GET and POST."+"<br>";
+getEnv("REQUEST_METHOD")+"<br>";
+"SCRIPT_FILENAME	The full path to the CGI script."+"<br>";
+getEnv("SCRIPT_FILENAME")+"<br>";
+"SCRIPT_NAME	The name of the CGI script."+"<br>";
+getEnv("SCRIPT_NAME")+"<br>";
+"SERVER_NAME	The server's hostname or IP Address"+"<br>";
+getEnv("SERVER_NAME")+"<br>";
+"SERVER_SOFTWARE	The name and version of the software the server is running."+"<br>";
+getEnv("SERVER_SOFTWARE")+"<br>"

return lanc
//-----------------------------------------------------------------------------//

