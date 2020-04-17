# This script is released under the terms of the Open Works License
# version 0.9.0 or greater the license terms can be found at
# http://owl.apotheon.org
Add-Type -assembly System.Windows.Forms
$main_form = New-Object System.Windows.Forms.Form
$main_form.Text = 'Computer Information'
$main_form.Width = 800
$main_form.Height = 600
$main_form.AutoSize = $true
$Label0 = New-Object System.Windows.Forms.Label
$Label0.Text = "Latest System Event Errors:"
$Label0.Location  = New-Object System.Drawing.Point(0,10)
$Label0.AutoSize = $true
$main_form.Controls.Add($Label0)
$ListBox0 = New-Object System.Windows.Forms.ListBox
$ListBox0.Width = 300
$SystemError0 = Get-EventLog System -newest 10 -entrytype Error
Foreach ($Error0 in $SystemError0)
{
$ListBox0.Items.Add($Error0)
}
$ListBox0.Location = New-Object System.Drawing.Point(150,10)
$main_form.Controls.Add($ListBox0)
$main_form.ShowDialog()