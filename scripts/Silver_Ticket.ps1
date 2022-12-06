# Import the necessary modules
Import-Module ActiveDirectory
Import-Module Kerberos

# Set the target service account and resource
$serviceAccount = "son.goku@earth.dbz.com"
$resource = "\\SRV01.earth.dbz.com\share"

# Get the password of the service account
$password = Read-Host -Prom "Enter password for $serviceAccount" -AsSecureString

# Get the SID of the service account
$sid = (Get-ADUser -Identity $serviceAccount -Properties SID).SID.Value

# Create a Kerberos ticket for the service account
$ticket = New-KerberosTicket -Service $serviceAccount -Password $password -Sid $sid

# Use the ticket to access the target resource
$cred = New-Object System.Management.Automation.PSCredential -ArgumentList $ticket.UserName,$ticket.Password
Invoke-Command -ComputerName $resource -Credential $cred -ScriptBlock {
    # Commands to execute on the target resource go here
}