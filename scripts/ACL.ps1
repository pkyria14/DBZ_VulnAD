Import-Module ActiveDirectory
Set-Location AD:

###########################################################################################################
# SetAcl  $for ---- $right ----> $to
###########################################################################################################
Function SetAcl($for, $to, $right, $inheritance, $extendedRight = $null)
{
    $forSID = New-Object System.Security.Principal.SecurityIdentifier (Get-ADUser $for).SID
    $objOU = ($to).DistinguishedName
    $objAcl = get-acl $objOU
    $adRight =  [System.DirectoryServices.ActiveDirectoryRights] $right
    $type =  [System.Security.AccessControl.AccessControlType] "Allow"
    $inheritanceType = [System.DirectoryServices.ActiveDirectorySecurityInheritance] $inheritance
    
    if ($extendedRight -eq $null) {
        $ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $forSID,$adRight,$type,$inheritanceType
    } else {
        $ace = New-Object System.DirectoryServices.ActiveDirectoryAccessRule $forSID,$adRight,$type,$extendedRight,$inheritanceType
    }
    
    $objAcl.AddAccessRule($ace)
    Set-Acl -AclObject $objAcl -path $objOU
}

## acl values :
# AccessSystemSecurity
# CreateChild
# Delete
# DeleteChild
# DeleteTree
# ExtendedRight
# GenericAll
# GenericExecute
# GenericRead
# GenericWrite
# ListChildren
# ListObject
# ReadControl
# ReadProperty
# Self
# Synchronize
# WriteDacl
# WriteOwner
# WriteProperty 

## extend rights
# 00299570-246d-11d0-a768-00aa006e0529 = "Send As"

# create a new Organizational Unit
$newOU = New-ADOrganizationalUnit -Name "Marketing" -Path "OU=Departments,DC=Contoso,DC=com"

# set ACLs for the new Organizational Unit
SetAcl janedoe Marketing ExtendedRight 00299570-246d-11d0-a768-00aa006e0529
SetAcl johndoe Marketing Delete
