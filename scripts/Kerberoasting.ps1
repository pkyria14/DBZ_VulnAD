# Import the ActiveDirectory module
Import-Module ActiveDirectory

# Define the user account to be made kerberoastable
$user = "korin.z"

# Get the user account object
$userObject = Get-ADUser -Identity $user

# Set the AllowTGTSessionKey property to true
$userObject.AllowTGTSessionKey = $true
Set-ADUser -Instance $userObject

# Add a list of Service Principal Names to the user account
$spns = @("HTTP/korintower", "CIFS/fileserver", "LDAP/ldapserver")
foreach ($spn in $spns) {
    Set-ADUser -Identity $user -Add @{'ServicePrincipalName' = $spn}
}