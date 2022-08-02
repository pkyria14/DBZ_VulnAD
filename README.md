# active_directory
About Notes and resources for the Active Directory

# Notes :
---------

Domain : mydomain.local

transfer files :
PS C:\Users\User\active_directory> $dc = New-PSSession 192.168.60.155 -Credential (Get-Credential)

PS C:\Users\User\active_directory> Copy-Item .\install_dc.md -ToSession $dc C:\Windows\Tasks

PS C:\Users\User\active_directory> Enter-PSSession $dc

[192.168.60.155]: PS C:\Users\Administrator\Documents> cd C:\Windows\Tasks\

[192.168.60.155]: PS C:\Windows\Tasks> ls
