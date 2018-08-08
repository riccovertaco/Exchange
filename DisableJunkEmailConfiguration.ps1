$user=Get-MsolUser -all| Where-Object { $_.isLicensed -eq "TRUE" }
foreach ($upn in $user) {
Set-MailboxJunkEmailConfiguration $upn.UserPrincipalName -Enabled $false
}
