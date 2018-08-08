###########################DiscReco.ps1#########################
# AUTHOR  : Eric PELLOUX 
# DATE    : 11-09-2016
# WEB     : www.groupe-folder.fr
# VERSION : 1.0
#
# COMMENT :  This script is a property of Groupe folder, verify is authenticity with the get-filehash cmdlet
# 
#####################################################################
# 
#############################VERY IMPORTANT:##########################
# Verifiy the presence of the discrecohash.txt and check the hash
#This script has the following functionalities:#######################

#1 Disconnect user mailbox
#2 Reconnect user mailbox to the new login 
#######################################################################
#Importation et déclaration des modules et fichiers
Import-module activedirectory
. 'D:\Exchange\bin\RemoteExchange.ps1'
Connect-ExchangeServer -auto
$csv = Import-csv C:\scripts\new.csv

#Boucle de déconnexion de la boite de l'utilisateur Oldlogin

foreach($disc in $csv)
{
disable-mailbox -identity $disc.oldlogin2 -Confirm:$false
}

# Boucle de reconnexion de la boite de l'utilisateur précédemment déconnectée sur l'utilisateur SAM

foreach($reco in $csv)
{
Connect-mailbox -identity $reco.nom -database $reco.db -user $reco.SAM
}

