Import-Module ActiveDirectory

# enable anonymous LDAP access
Set-ADObject -Identity "CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,DC=Contoso,DC=com" -Replace @{'msDS-Other-Settings'=4}

# set the anonymous LDAP bind user
$anonymousUser = New-Object System.Security.Principal.SecurityIdentifier "S-1-5-7"
$ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $anonymousUser,"ExtendedRight","Allow","00299570-246d-11d0-a768-00aa006e0529", "Descendents"
$acl = Get-Acl "CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,DC=Contoso,DC=com"
$acl.AddAccessRule($ace)
Set-Acl "CN=Directory Service,CN=Windows NT,CN=Services,CN=Configuration,DC=Contoso,DC=com" $acl