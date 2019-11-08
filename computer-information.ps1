# This script is released under the terms of the Open Works License
# version 0.9.4 or greater, the license terms can be found at
# http://owl.apotheon.org or in the license.md file found distributed
# with this script. More information in the readme.md
Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Computer Information'
$main_form.Width = 800
$main_form.Height = 600
$main_form.AutoSize = $true
$Label0 = New-Object System.Windows.Forms.Label
$Label0.Text = "Computer Name:"
$Label0.Location  = New-Object System.Drawing.Point(0,10)
$Label0.AutoSize = $true
$main_form.Controls.Add($Label0)
$Label1 = New-Object System.Windows.Forms.Label
$Label1.Text = hostname
$Label1.Location = New-Object System.Drawing.Point(100,10)
$Label1.Autosize = $true
$main_form.Controls.Add($Label1)
$Label2 = New-Object System.Windows.Forms.Label
$Label2.Text = 'Hard Disk Size:'
$Label2.Location = New-Object System.Drawing.Point(0,30)
$Label2.Autosize = $true
$main_form.Controls.Add($Label2)
$Label3 = New-Object System.Windows.Forms.Label
$Label3.Text = Get-PhysicalDisk | Select-Object Size
$Label3.Location = New-Object System.Drawing.Point(100,30)
$Label3.Autosize = $true
$main_form.Controls.Add($Label3)
$Label4 = New-Object System.Windows.Forms.Label
$Label4.Text = 'Processor'
$Label4.Location = New-Object System.Drawing.Point(0,50)
$Label4.Autosize = $true
$main_form.Controls.Add($Label4)
$Label5 = New-Object System.Windows.Forms.Label 
$Label5.Text = Get-WmiObject -class win32_processor | Select-Object -Property Name
$Label5.Location = New-Object System.Drawing.Point (100,50)
$Label5.Autosize = $true
$main_form.Controls.Add($Label5)
$Label9 = New-Object System.Windows.Forms.Label
$Label9.Text = 'Assigned IP Addresses:'
$Label9.Location = New-Object System.Drawing.Point(0,100)
$Label9.Autosize = $false
$main_form.Controls.Add($Label9)
$ListBox = New-Object System.Windows.Forms.ListBox
$ListBox.Width = 300
$IPAddress = Get-NetIPAddress | Select-Object -Property IPAddress
Foreach ($Address in $IPAddress)
{
$ListBox.Items.Add($Address)
}
$ListBox.Location = New-Object System.Drawing.Point(100,100)
$main_form.Controls.Add($ListBox)
$main_form.ShowDialog()