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


Get-Team -DisplayName "SC-FL - SE PET Mobile"


######################################
Write-Output "$HR 5 SECOND PAUSE $HR"
# 90sec Pause

$Timeout = 5
$timer = [Diagnostics.Stopwatch]::StartNew()
while (($timer.Elapsed.TotalSeconds -lt $Timeout)) {
Start-Sleep -Seconds 1
    Write-Verbose -Message "Still waiting for action to complete after [$totalSecs] seconds..."
}
$timer.Stop()
# End of 5 seconds


########################################
Write-Output "$HR ADD MEMBERS TO TEAM $HR"

Add-UnifiedGroupLinks -Identity "SE PET Mobile" -LinkType Member -Links user1@health.com
Add-UnifiedGroupLinks -Identity "SE PET Mobile" -LinkType Member -Links user2@health.com
Add-UnifiedGroupLinks -Identity "SE PET Mobile" -LinkType Member -Links user3@health.com



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