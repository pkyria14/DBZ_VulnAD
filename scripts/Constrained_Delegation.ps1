Import-Module ActiveDirectory

# create a user1 service account
New-ADUser -Name "user1" -Path "CN=Users,DC=Contoso,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force)

# create a user2 service account
New-ADUser -Name "user2" -Path "CN=Users,DC=Contoso,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force)

# create a user account
New-ADUser -Name "user3" -Path "CN=Users,DC=Contoso,DC=com" -AccountPassword (ConvertTo-SecureString "P@ssw0rd" -AsPlainText -Force)

# allow the user1 to delegate authentication to user2 
Set-ADUser user1 -PrincipalsAllowedToDelegateToAccount *