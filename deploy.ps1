<#
.SYNOPSIS
       Deploy Azure ARM templates
       
.DESCRIPTION
       Deploy Azure ARM templates
.NOTES
       Author: Jano Lu
	   Email:  lu.yitong@oe.21vianet.com
       Date: 2017/03
       Revision: 2.0
#>

<#install-module azurerm -scope CurrentUser
#Set-ExecutionPolicy -ExecutionPolicy Unrestricted
#import-module azurerm.profile 

#Add-AzureRmAccount -EnvironmentName AzureChinaCloud
#>
$VerbosePreference="Continue"
$deployName="nickvmss5"
$RGName=$deployName
$locName="China East"

$templateFile= "D:\Warehouse\10_Tech\git\vmsscustom\azuredeploy.json"
$templateParameterFile= "D:\Warehouse\10_Tech\git\vmsscustom\azuredeploy.parameters"
New-AzureRmResourceGroup -Name $RGName -Location $locName -Force

echo New-AzureRmResourceGroupDeployment -Name $deployName -ResourceGroupName $RGName -TemplateFile $templateFile
New-AzureRmResourceGroupDeployment -Name $deployName -ResourceGroupName $RGName -TemplateParameterFile $templateParameterFile -TemplateFile $templateFile