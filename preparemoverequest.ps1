############################################preparemoverequest.ps1###########################################
# AUTHOR  : Eric PELLOUX                                                                                    #
# DATE    : 02-11-2018                                                                                      #
# WEB     : https://github.com/riccovertaco/                                                                #
# VERSION : 1.0                                                                                             #
#                                                                                                           #
# COMMENT :  This script is a property of Eric PELLOUX, verify is authenticity with the get-filehash cmdlet #
#                                                                                                           #
#############################################################################################################

###########################################VERY IMPORTANT:###################################################
#                      Verifiy the presence of the hash.txt and check the hash                              #
#############################################################################################################

#This script has the following functionalities:##############################################################

#1 Creates a personal (home folder) for all AD users 
#2 Provides option to create users folders as DisplayName or sAMAccountname (Log on name) 
#3 Grants each users "Full Control" to his or her folder
#4 Maps the users folder as drive 'H' (Configured via AD Users property, 
#5 Ensures that users canot access another user's folder

#############################################################################################################

#Domain controller Variables 
$remoteDC= "ddsy04.le.grp"
$LocalDC= "ddsy05.cryogenic.grp"

#User variable
[System.Reflection.Assembly]::LoadWithPartialName("Microsoft.VisualBasic")
$user = [Microsoft.VisualBasic.Interaction]::InputBox( "Saisir l'upn de l'utilisateur", "UPN", "eric@le.grp")

#Credentials variables
$Lcred= get-credential Admatheo1@Cryogenic.grp
$Rcred= get-credential DD001S@le.grp

#Exchange Server variable
$RemoteExch= "ddse03.le.grp"

#Exchange connection
cd 'C:\Program Files\Microsoft\Exchange Server\V15\Scripts'
$Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://ddse02.cryogenic.grp/PowerShell/ -Authentication Kerberos -Credential $Lcred
Import-PSSession $Session -DisableNameChecking

#Migration
.\Prepare-MoveRequest.Ps1 -Identity $user -RemoteForestDomainController $RemoteDC -RemoteForestCredential $Rcred -LocalForestDomainController $localDC -LocalForestCredential $Lcred -UseLocalObject
New-MoveRequest -Identity $user -Remote -Remotehostname $RemoteExch -TargetDatabase DB01 -RemoteGlobalCatalog $remotedc -RemoteCredential $Rcred -TargetDeliveryDomain “cryostar.com”