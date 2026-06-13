# ad-bulk-user-create.ps1
# Creates multiple Active Directory users from a CSV file

param(
    [Parameter(Mandatory=$true)]
    [string]$CsvPath,

    [Parameter(Mandatory=$true)]
    [string]$TargetOU
)

Import-Module ActiveDirectory

Write-Host "Importing users from CSV..." -ForegroundColor Cyan
$users = Import-Csv -Path $CsvPath

foreach ($user in $users) {

    $sam = $user.SamAccountName
    $password = (ConvertTo-SecureString $user.Password -AsPlainText -Force)

    Write-Host "Creating user: $sam" -ForegroundColor Yellow

    New-ADUser `
        -Name $user.Name `
        -GivenName $user.FirstName `
        -Surname $user.LastName `
        -SamAccountName $sam `
        -UserPrincipalName "$sam@$($env:USERDNSDOMAIN)" `
        -AccountPassword $password `
        -Enabled $true `
        -ChangePasswordAtLogon $true `
        -Path $TargetOU

    if ($user.Groups) {
        $groups = $user.Groups -split ";"
        foreach ($g in $groups) {
            Add-ADGroupMember -Identity $g -Members $sam
            Write-Host "  Added to group: $g" -ForegroundColor Green
        }
    }

    Write-Host "User created successfully." -ForegroundColor Green
}

Write-Host "Bulk user creation complete." -ForegroundColor Cyan