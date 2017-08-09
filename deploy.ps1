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





$adminARMEndpoint = "https://adminmanagement.local.azurestack.external"
$ServiceAdminUsername = 'asadmin@nicktestad.onmicrosoft.com'
$ServiceAdminPassword = 'nick123!'


$MASCredential = New-Object System.Management.Automation.PSCredential "$ServiceAdminUsername", (ConvertTo-SecureString "$ServiceAdminPassword" -AsPlainText -Force)
Add-AzureRmEnvironment -Name 'AzureStackAdmin' -ArmEndpoint $adminarmendpoint
$MASEnv = Add-AzureRmAccount -EnvironmentName 'AzureStackAdmin' -Credential $MASCredential

Login-AzureRmAccount -EnvironmentName 'AzureStackAdmin' 





$VerbosePreference="Continue"
$deployName="nickvmss5"
$RGName=$deployName
$locName="local"

$templateFile= ".\azuredeploy.json"
$templateParameterFile= ".\azuredeploy.parameters"
New-AzureRmResourceGroup -Name $RGName -Location $locName -Force

echo New-AzureRmResourceGroupDeployment -Name $deployName -ResourceGroupName $RGName -TemplateFile $templateFile
New-AzureRmResourceGroupDeployment -Name $deployName -ResourceGroupName $RGName -TemplateParameterFile $templateParameterFile -TemplateFile $templateFile