#This file is provided CopyFree by Joseph A. Nagy Jr. (jnagyjr1978@gmail.com)
#under the terms of the OWL 0.9.4 or greater, the full license text can be
#found at http://owl.apotheon.org

# Provide Folder path, name and create
$Folder='C:\Demo'
New-Item -ItemType Directory -Path $Folder

# Create a series of 10 files
for ($x=0;$x -lt 10; $x++)

{
# Let's create a completely random file name
$filename="$($Folder)\Logfile$((Get-Random 10000).tostring()).txt"

# This section doesn't work 100% yet, uncomment and use at your own risk.
# Set the amount of time to change within a given range.
#$DaysToMove=((Get-Random 120) -60)
#$HoursToMove=((Get-Random 48) -24) 
#$MinutesToMove=((Get-Random 120) -60)
#$TimeSpan=New-TimeSpan -Days $DaysToMove -Hours $HoursToMove -Minutes $MinutesToMove

# Now adjust the Date and Time by the New TimeSpan
# Requires Admin rights to do this as well!
#Set-Date -Adjust $TimesSpan | Out-Null

    # Now we'll create the file with some content
    Add-Content -Value $a -Path $filename

# Now we REVERSE the Timespan by the exact same amount
#$TimeSpan=New-TimeSpan -Days (-$DaysToMove) -Hours (-$HoursToMove) -Minutes (-$MinutesToMove)

#Set-Date -Adjust ($TimeSpan) | Out-Null
}

# We're going to build files up to 1k in size
$limit=(Get-Random 4096)

# Let's build the random content
for ($y=0;$y -lt $limit;$y++)
{
    # We're building a content of pure ascii data
    $a=$a+[char][byte]((Get-Random 64)+32)
}
