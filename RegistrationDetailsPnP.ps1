$SiteUrl = "https://cowelljp.sharepoint.com/sites/SPO7"
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


function GetListByName {
    try {
        New-PnPList -Title $ListName -Url $ListUrl -Template GenericList -ErrorAction Stop
        Write-Host "List is created" -f Green
    }
    catch {
        Write-Host "List Existed" -f Red
    }
            
}
 
#Function to check if a list or document library exists
#Custom Function to Check if Site Collection Exists in Given URL
<#Function Check-ListExists($SiteURL, $ListName)
{
    Try {
            $List = $Ctx.Web.Lists.GetByTitle($ListName)
            $Ctx.Load($List)
            $Ctx.ExecuteQuery()
            Return $True
        }
    Catch [Exception] {
      Write-host $_.Exception.Message -f Red
      Return $False
     }
}
 
#Call the function to Check List Exists in given web 
$ListExists = Check-ListExists -URL $SiteUrl -Title $ListName -Template GenericList - -ErrorAction Stop
 
if($ListExists) {
    write-host "List Exists in Given Site!!" -f Green
    #Proceed with your script
 }
 else {
    write-host "List Doesn't Exists on given web!" -f Red
 }#>


#Read more: https://www.sharepointdiary.com/2016/10/sharepoint-online-check-if-list-exists-using-powershell.html#ixzz7cZqKdfNu

<#function CreateCustomList {
    param (
        $ListName
    )
    $List = GetListByName($ListName)
    if($List) {
        Write-Host "List "$ListName" has been existed!" -f Red
    }
    else {
        New-PnPList -Title $ListName -Template GenericList
        Write-Host "Create success!" -f Green
    }
}

function ChangeDisplayName {
    param (
        $OldName, $NewName
    )
    $List = GetListByName($NewName)
    if($List) {
        Write-Host "List "$NewName" has been existed!" -f Red
    }
    else {
        Set-PnPList -Identity $OldName -Title $NewName
        Write-Host "Change success!" -f Green
    }
}

function GetFieldByName {
    param (
        $FieldName, $ListName
    )
    try {
        $Field = Get-PnPField -List $ListName -Identity $FieldName -ErrorAction Stop
        return $Field
    }
    catch {
        $Field = $null
    }
}

function CreateFieldFromXml {
    param (
        $FieldName, $ListName, $FieldXml
    )
    $List = GetListByName($ListName)
    if($List) {
        $Field = GetFieldByName -FieldName $FieldName -ListName $ListName
        if($Field) {
            Write-Host "Field "$FieldName" has been existed in "$ListName"!" -f Red
        }
        else {
            Add-PnPFieldFromXml -FieldXml $FieldXml -List $ListName
        }
    }
    else {
        Write-Host $ListName" has not exist!" -f Red
        Write-Host "Creating "$ListName"..." -f Green
        CreateCustomList -ListName $ListName
        CreateFieldFromXml -FieldName $FieldName -ListName $ListName -FieldXml $FieldXml
    }
}#>