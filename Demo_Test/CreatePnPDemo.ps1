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