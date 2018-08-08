write-host -backgroundcolor cyan -foregroundcolor black OUTLOOKANYWHERE
Get-OutlookAnywhere | Select Server,ExternalHostname,Internalhostname | fl

write-host -backgroundcolor cyan -foregroundcolor black OWA
Get-OwaVirtualDirectory | Select Server,ExternalURL,InternalURL | fl

write-host -backgroundcolor cyan -foregroundcolor black ACTIVESYNC
Get-ActiveSyncVirtualDirectory | select server,externalurl,internalurl | fl

write-host -backgroundcolor cyan -foregroundcolor black WEB
Get-WebServicesVirtualDirectory | Select Server,ExternalURL,InternalURL | fl

write-host -backgroundcolor cyan -foregroundcolor black OAB
Get-OabVirtualDirectory | Select Server,ExternalURL,InternalURL | fl

write-host -backgroundcolor cyan -foregroundcolor black CAS
Get-ClientAccessService | Select Name,AutoDiscoverServiceInternalURI | fl

write-host -backgroundcolor cyan -foregroundcolor black Autodiscover
Get-AutodiscoverVirtualDirectory | Select Name,InternalUrl,ExternalUrl |fl

write-host -backgroundcolor cyan -foregroundcolor black ECP
Get-ecpVirtualDirectory | Select Name,InternalUrl,ExternalUrl |fl

write-host -backgroundcolor cyan -foregroundcolor black MAPI
Get-mapiVirtualDirectory | Select Name,InternalUrl,ExternalUrl |fl

write-host -backgroundcolor cyan -foregroundcolor black Powershell
Get-PowershellVirtualDirectory | Select Name,InternalUrl,ExternalUrl |fl

