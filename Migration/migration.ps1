Set-ExecutionPolicy Unrestricted -Force
$365CRED = Get-Credential
$PREMCRED = Get-Credential
$SESSION = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://ps.outlook.com/powershell -Credential $365CRED -Authentication Basic -AllowRedirection
Import-PSSession $SESSION
Connect-MsolService -Credential $365CRED
$MAILLIST = Import-CSV "C:\script\mig.txt"
foreach ($ligne in $MAILLIST) {New-MoveRequest -Identity $ligne.EmailAddress -Remote -RemoteHostName mail.google.fr -TargetDeliveryDomain google.fr -RemoteCredential $PREMCRED -BadItemLimit 200}
