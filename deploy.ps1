<#
.SYNOPSIS
       Deploy Azure ARM templates
       
.DESCRIPTION
       Deploy Azure ARM templates
.NOTES
    
#>

<#install-module azurerm -scope CurrentUser
#Set-ExecutionPolicy -ExecutionPolicy Unrestricted
#import-module azurerm.profile 

#Add-AzureRmAccount -EnvironmentName AzureChinaCloud
#>





$adminARMEndpoint = "https://management.local.azurestack.external"
Add-AzureRmEnvironment -Name 'AzureStackenv' -ArmEndpoint $adminarmendpoint
Login-AzureRmAccount -EnvironmentName "AzureStackenv"
$locName="local"

#Login-AzureRmAccount -EnvironmentName 'AzureCloud' 
#$locname="East Asia"



$VerbosePreference="Continue"
$deployName="nickvmss6"
$RGName=$deployName

$templateFile= ".\azuredeploy.json"
$templateParameterFile= ".\azuredeploy.parameters"
New-AzureRmResourceGroup -Name $RGName -Location $locName -Force

New-AzureRmResourceGroupDeployment -Name $deployName -ResourceGroupName $RGName -TemplateParameterFile $templateParameterFile -TemplateFile $templateFile