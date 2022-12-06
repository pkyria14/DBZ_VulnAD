param( 
    [Parameter(Mandatory=$true)] $JSONFile,
    [switch]$Undo
)

# Define a function to create or remove an AD group
function ManageADGroup($groupObject, $action){
    # Extract the name of the group from the $groupObject
    $name = $groupObject.name

    # Check if the action is "create" or "remove"
    if ($action -eq "create"){
        # Use the New-ADGroup cmdlet to create a new global AD group with the specified name
        New-ADGroup -name $name -GroupScope Global
    } elseif ($action -eq "remove"){
        # Use the Remove-ADGroup cmdlet to remove the specified AD group
        Remove-ADGroup -Identity $name -Confirm:$False
    }
}

# Define a function to create or remove an AD user
function ManageADUser($userObject, $action){
    # Extract the name and password of the user from the $userObject
    $name = $userObject.name
    $password = $userObject.password

    # Generate a "first initial, last name" structure for username
    $firstname, $lastname = $name.Split(" ")
    $username = ($firstname[0] + $lastname).ToLower()
    $samAccountName = $username
    $principalname = $username

    # Check if the action is "create" or "remove"
    if ($action -eq "create"){
        # Use the New-ADUser cmdlet to create a new AD user with the specified name, username, and password
        New-ADUser -Name "$name" -GivenName $firstname -Surname $lastname -SamAccountName $SamAccountName -UserPrincipalName $principalname@$Global:Domain -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -PassThru | Enable-ADAccount

        # Add the user to its appropriate group
        foreach($group_name in $userObject.groups) {
            # Use the Test-Path cmdlet to check if the group exists
            if (Test-Path "AD:\CN=$group_name") {
                # Use the Add-ADGroupMember cmdlet to add the user to the group
                Add-ADGroupMember -Identity $group_name -Members $username
            } else {
                # If the group does not exist, print a warning message
                Write-Warning "User $name NOT added to group $group_name because it does not exist"
            }
        }

        # Add to local admin as needed
        if ( $userObject.local_admin -eq $True){
            # Use the Invoke-Command cmdlet to run the "net localgroup" command on all of the hosts at once
            Invoke-Command -ComputerName $userObject.local_admin -ScriptBlock {
                net localgroup administrators $Global:Domain\$username /add
            }
        }
    } elseif ($action -eq "remove"){
        # Use the Remove-ADUser cmdlet to remove the specified user
        Remove-ADUser -Identity $samAccountName -Confirm:$False
    }
