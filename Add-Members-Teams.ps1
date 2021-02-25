#Adding multiple users to teams by PowerShell and a text / CSV file

#1) Create a .txt file like this

#Name
#name.name@domain.com
#name2.name2@domain.com
 
#2) Install the Teams PowerShell tools:
#Install-Module -Name MicrosoftTeams
#-RequiredVersion 0.9.0


#3) Find the GroupId
#PS get-team -displayname "name"

#4) Run this script

#Import-Csv 'C:temp\email.txt' | % {Add-TeamUser -User $_.Name -GroupId <GroupID>}

#It takes about 30 minutes or more before you see the updates users in Teams. Also an error will be displayed for all users that are alreay present.

Write-Output "$HR ADD MEMBERS TO MICROSOFT TEAMS

##########################################################################################
#
#                  *ADD MEMBERS TO MICROSOFT TEAMS* 
#                                                                                
# Created by Cesar Duran (Jedi Master)                                                                                        
# Version:1.0                                                                                                                                       
#                                                                                                                                                                                                                                                              
# CDI Script Tasks:
# 1) Connect to Microsoft Teams
# 2) Add Members
#                                                                                                                                                                                                                                                                                                                                                                                                                                 
#                                                                                                                                                                                                          
###########################################################################################

$HR"


# Line delimiter
$HR = "`n{0}`n" -f ('='*20)

########################################
Write-Output "$HR CONNECT TO TEAMS $HR"

Install-Module -Name MicrosoftTeams
Import-Module -Name MicrosoftTeams

$cred=Get-Credential
Connect-MicrosoftTeams -Credential $cred


########################################
Write-Output "$HR ADD MEMBERS TO TEAM $HR"

Get-Team -DisplayName "NC - SE MRI Mobile"

$path = 'C:temp\email\teamgroup1-test.txt'
$GroupId = 99f72ac2-5d77-4455-908c-bae97cc91f86


Import-Csv $path | % { 

Add-TeamUser -User $_.Name -GroupId $GroupId
} 

# end of adding members


###################################################
Write-Output "$HR THE END, HAVE A NICE DAY!!!

##########################################################################################
#
#              *POWERFUL YOU HAVE BECOME, THE DARK SIDE I SENSE IN YOU - YODA*
#
#                                                                                                                                                                                                                                                                                                                                                                                                                              
#                                                                                                                                                                                                          
###########################################################################################

$HR"