Import-module activedirectory
. 'C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1'
Connect-ExchangeServer -auto

$users = Get-ADUser -LDAPfilter '(name=*)' -searchBase "OU=Users,DC=toto,DC=fr"
foreach($user in $users)
{
   Enable-Mailbox -Identity $user.SamAccountName
}