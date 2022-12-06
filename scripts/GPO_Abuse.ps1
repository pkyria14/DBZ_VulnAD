# Install the Group Policy Management Console feature
Install-WindowsFeature -Name GPMC

# Remove any existing GPO named "DBZWallpaper"
Remove-GPO -Name "DBZWallpaper" -ErrorAction SilentlyContinue

# Remove the link to the "DBZWallpaper" GPO from the specified OU
Remove-GPLink -Name "DBZWallpaper" -Target "OU=DBZ,OU=COM,DC=DBZ,DC=COM" -ErrorAction SilentlyContinue

# Create a new GPO named "DBZWallpaper" with a comment of "Change Wallpaper"
New-GPO -Name "DBZWallpaper" -Comment "Change Wallpaper"

# Link the "DBZWallpaper" GPO to the specified OU
New-GPLink -Name "DBZWallpaper" -Target "OU=DBZ,OU=COM,DC=DBZ,DC=COM"

# Set the value of the "Wallpaper" registry key to "C:\tmp\DBZ.png"
Set-GPPrefRegistryValue -Name "DBZWallpaper" -Context User -Action Create -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName Wallpaper -Type String -Value "C:\tmp\DBZ.png"

# Set the value of the "WallpaperStyle" registry key to "4"
Set-GPPrefRegistryValue -Name "DBZWallpaper" -Context User -Action Create -Key "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" -ValueName WallpaperStyle -Type String -Value "4"

# Set the value of the "SyncForegroundPolicy" registry key to "1"
Set-GPRegistryValue -Name "DBZWallpaper"