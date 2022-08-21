$SiteUrl = "https://cowelljp.sharepoint.com/sites/SPO07"
#UserName & Password to connect
$SiteUser = "CwThanhNH@cowelljp.onmicrosoft.com"
$Password = "Bean101500"
$SecurePassWord = ConvertTo-SecureString $PassWord -AsPlainText -Force

$CredInfo = New-Object System.Management.Automation.PSCredential($SiteUser, $SecurePassWord)

#Check connect to SPO
try {
    Write-Host "Connecting... to site:"$SiteUrl -f Green
    Connect-PnPOnline $SiteUrl -Credentials $CredInfo -WarningAction Ignore -ErrorAction Stop
    Write-Host "Connected" -f Green
}
catch {
    Write-Host "Connect fail!" -f Red
}

$ListUrl = "pnp_testlist"
$ListName = "PnpTest"
#Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue
#Function to create a custom list
Function Create-List($SiteURL, $ListName)
{
    #Set the Error Action
    $ErrorActionPreference = "Stop"
 
    Try {
        $Web = Get-SPWeb -Identity $SiteURL
        $ListTemplate = [Microsoft.SharePoint.SPListTemplateType]::GenericList
        
        #Check if List with specific name exists
        if($Web.Lists.TryGetList($ListName) -eq $null)
        {
            $List = $Web.Lists.Add($ListName, $ListName, $ListTemplate) 
            write-host "List Created Successfully!" -ForegroundColor Green
        }
        else
        {
            write-host "List with a specific name already exists!" -ForegroundColor Red
        }
    }
    catch {
        Write-Host $_.Exception.Message -ForegroundColor Red
    }
    finally {
        #Reset the Error Action to Default
        $ErrorActionPreference = "Continue"
    }
}
 
#Call the function to create a new custom list
Create-List $SiteURL $ListName