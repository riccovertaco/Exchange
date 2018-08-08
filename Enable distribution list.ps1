Import-module activedirectory
. 'C:\Program Files\Microsoft\Exchange Server\V15\bin\RemoteExchange.ps1'
Connect-ExchangeServer -auto
$groups=Get-adgroup -filter 'groupcategory -eq "Distribution"' -SearchBase "OU=groupes,DC=toto,DC=fr"
foreach($group in $groups)
{
   enable-DistributionGroup -Identity $group.SamAccountName
}