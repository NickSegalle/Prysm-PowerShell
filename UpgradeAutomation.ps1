<# 
.SYNOPSIS 
Upgrade Automation Tool was created to automate certain facets of the software upgrade of 
Synthesis software.  After Synthesis is upgraded, it is necessary to manually go into the
Admin console and upgrade the settings profile for each deployment.  This is manual, and
time consuming.  This script aims to automate the process.
 
.DESCRIPTION 
The script is a XAML form that allows you to login to a Cloud URI and select (imppersonate)
accounts that are visible in that Cloud URI using a web browser.  Once you login to the 
Cloud URI, it will automatically select the 'Prysm' account, and then populate the Deployments
for the 'Prysm' account.  Once the Deployments have been populated, you can use the 
multi-select listbox to select multiple Deployments at a time.  Once you have the deployments
selected, you can do 1 of 2 things - 1) Merge the settings template of each deployment selected
to that of a settings template chosen from the dropdown box.  This will disregard what ever 
settings template existed before, and overwrite the settings profile template with the one 
chosen.  2) Replace the Whiteboard with a Sketchboard on all the selected deployments. It 
should be noted that this script can work for any version upgrades, but is specific for 
upgrades going to 2.11 where the Whiteboard will be replaced in the Hex Menu.
 
.NOTES 
┌─────────────────────────────────────────────────────────────────────────────────────────────┐ 
│ ORIGIN STORY                                                                                │ 
├─────────────────────────────────────────────────────────────────────────────────────────────┤ 
│   DATE        : 2017.12.04																  │
│   AUTHOR      : Nicky Segalle																  │ 
│   DESCRIPTION : Prysm Upgrade Automation Tool					 							  │ 
└─────────────────────────────────────────────────────────────────────────────────────────────┘ 
  
.EXAMPLE 
Just run the script as is, no Parameters necessary.  

#> 

#===========================================================================
# XAML Form
#===========================================================================

$inputXML = @"
<Window x:Name="PrysmUpgradeTool" x:Class="WpfApp2.MainWindow"
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
xmlns:local="clr-namespace:WpfApp2"
mc:Ignorable="d"
Title="Prysm Settings Tool" Height="556.898" Width="1002.685" ResizeMode="NoResize">
    <Grid Margin="0,0,0,1" Background="#FFC9C9C9" >

        <Rectangle Fill="#FFF4F4F5" HorizontalAlignment="Left" Height="404" Margin="16,101,0,0" Stroke="Black" VerticalAlignment="Top" Width="380"/>
        <Rectangle Fill="#FFF4F4F5" HorizontalAlignment="Left" Height="93" Margin="413,101,0,0" Stroke="Black" VerticalAlignment="Top" Width="559"/>
        <Label x:Name="label_Username" Content="Username:" HorizontalAlignment="Left" Height="26" Margin="375,15,0,0" VerticalAlignment="Top" Width="72" VerticalContentAlignment="Center"/>
        <Label x:Name="label_Password" Content="Password:" HorizontalAlignment="Left" Height="26" Margin="624,15,0,0" VerticalAlignment="Top" Width="72" VerticalContentAlignment="Center"/>
        <TextBox x:Name="inputBox_User" HorizontalAlignment="Left" Height="26" Margin="447,15,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="175" Text="nsegalle@prysm.com" VerticalContentAlignment="Center"/>
        <PasswordBox x:Name="inputBox_Pass" HorizontalAlignment="Left" Margin="696,15,0,0" VerticalAlignment="Top" Height="26" Width="175" Password="" VerticalContentAlignment="Center"/>
        <Button x:Name="button_Login" Content="Login" HorizontalAlignment="Left" Height="23" Margin="884,16,0,0" VerticalAlignment="Top" Width="89"/>
        <Label x:Name="label_CloudURI" Content="Cloud URI:" HorizontalAlignment="Left" Height="26" Margin="19,15,0,0" VerticalAlignment="Top" Width="66" VerticalContentAlignment="Center" RenderTransformOrigin="-0.154,0.731"/>
        <TextBox x:Name="inputBox_CloudURI" HorizontalAlignment="Left" Height="26" Margin="90,15,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="280" Text="https://admin-regus.synthesize.com" VerticalContentAlignment="Center"/>
        <Label x:Name="label_StatusUpdate" Content="Please Login First" HorizontalAlignment="Left" Height="284" Margin="413,221,0,0" VerticalAlignment="Top" Width="559" Background="White" Foreground="#FF4F4F4F" BorderBrush="Black" BorderThickness="1"/>
        <Label x:Name="label_StatusLbl" Content="Status:" HorizontalAlignment="Left" Margin="413,194,0,0" VerticalAlignment="Top" Width="76"/>
        <Rectangle x:Name="rectangle_Impersonating" Fill="#FFFFC5C5" HorizontalAlignment="Left" Height="36" Margin="560,51,0,0" Stroke="Black" VerticalAlignment="Top" Width="394" RadiusX="5" RadiusY="5" Visibility="Hidden"/>
        <Label x:Name="label_AccountSelected" Content="" HorizontalAlignment="Left" Height="26" Margin="560,55,0,0" VerticalAlignment="Top" Width="394" Foreground="Black" FontWeight="Bold" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Visibility="Hidden"/>

        <Label x:Name="label_SourceAccounts" Content="Select Account:" HorizontalAlignment="Left" Height="23" Margin="19,58,0,0" VerticalAlignment="Top" Width="102"/>


        <ListBox x:Name="listBox_SourceDeployments" HorizontalAlignment="Left" Height="323" Margin="39,161,0,0" VerticalAlignment="Top" Width="331" SelectedValuePath="Key" DisplayMemberPath="Value" SelectionMode="Multiple" AlternationCount="2" Background="White">
            <ListBox.ItemContainerStyle>
                <Style TargetType="{x:Type ListBoxItem}">
                    <Style.Triggers>
                        <Trigger Property="ItemsControl.AlternationIndex"  Value="0">
                            <Setter Property="Background" Value="White" />
                        </Trigger>
                        <Trigger Property="ItemsControl.AlternationIndex"  Value="1">
                            <Setter Property="Background" Value="#FFEEEEEE" />
                        </Trigger>
                    </Style.Triggers>
                </Style>
            </ListBox.ItemContainerStyle>
        </ListBox>



        <Label x:Name="label_SourceDeployments" Content="Select Deployment(s):" HorizontalAlignment="Left" Height="26" Margin="22,101,0,0" VerticalAlignment="Top" Width="177"/>
        <Button x:Name="button_SourceImpersonate" Content="Impersonate" HorizontalAlignment="Left" Height="23" Margin="425,58,0,0" VerticalAlignment="Top" Width="112" RenderTransformOrigin="-0.411,0.583"/>
        <ComboBox x:Name="comboBox_SourceAccounts" HorizontalAlignment="Left" Height="23" Margin="121,58,0,0" VerticalAlignment="Top" Width="280"/>
        <ComboBox x:Name="comboBox_SettingsTemplate" HorizontalAlignment="Left" Height="24" Margin="572,112,0,0" VerticalAlignment="Top" Width="273" SelectedValuePath="Key" DisplayMemberPath="Value"/>
        <Label x:Name="label_SettingsProfiles_Copy" Content="Select Settings Template:" HorizontalAlignment="Left" Height="26" Margin="422,111,0,0" VerticalAlignment="Top" Width="145" />
        <Button x:Name="button_SetSettingsTemplate" Content="Merge Settings" HorizontalAlignment="Left" Height="24" Margin="850,112,0,0" VerticalAlignment="Top" Width="110" RenderTransformOrigin="0.909,0.542"/>
        <Button x:Name="button_ReplaceWhiteBoard" Content="Replace Whiteboard" HorizontalAlignment="Left" Height="24" Margin="810,153,0,0" VerticalAlignment="Top" Width="137"/>
        <Label x:Name="label_HexMenus" Content="Replace Whiteboard with Sketchboard on selected deployments:" HorizontalAlignment="Left" Height="26" Margin="447,151,0,0" VerticalAlignment="Top" Width="358" />
        <Label Content="Machine Key" HorizontalAlignment="Left" Height="32" Margin="39,130,0,0" VerticalAlignment="Top" Width="331" Background="#FFC9C9C9" BorderBrush="#FFABADB3" BorderThickness="1" FontWeight="Bold" UseLayoutRounding="False" VerticalContentAlignment="Center" HorizontalContentAlignment="Center"/>
    </Grid>

</Window>
      
"@       

#===========================================================================
# Machine Learning Templates
#===========================================================================

$MLAccountSettingsTemplates = @'
<div class="col-sm-5">
                            <select name="SelectedTemplate" class="form-control" id="SelectedTemplate" data-validate="required" data-msg-required="Settings Template is a required field."><option value="">Select a Template : </o
ption>
<option value="{SettingsTemplateID*:b5ae64d4-b497-4b73-ae5c-fdae608e3493}">{SettingsTemplateName:2.0 Template}</option>
<option value="{SettingsTemplateID*:a7cd5a21-9bf0-4482-82c2-e275810eb623}">{SettingsTemplateName:2.1 Settings Template}</option>
<option value="{SettingsTemplateID*:1f7f682d-4d77-4045-a1b7-918cd6e4d803}">{SettingsTemplateName:2.10 Settings Template}</option>
<option value="3af7fada-2223-481e-8499-9ac5a9a34ea8">2.11 Settings Template</option>
<option value="e448900c-89ce-4dad-98a9-bb871c7264d9">2.3 Settings Template</option>
<option value="5eea1bd6-1f7b-4ed4-853e-ed5e9b429584">2.4 Setting Template</option>
<option value="71a04d26-dadd-4900-a4c2-cb083d207817">2.5 Template</option>
<option value="182a924a-fe25-4795-a1eb-9e78075b41ba">2.6 Final Template (No Floating)</option>
<option value="a03a6388-bfc5-4553-b8ef-84468abaa4c1">2.6 Final Template (With Floating)</option>
<option value="6cd66491-04ed-49a0-aa29-69263c109a60">2.7 Beta Template</option>
<option value="8d1651ab-8cee-4913-bf40-5abcbe264132">2.7 Final Tempale</option>
<option value="fa6e2727-ae09-4fa6-85c9-7b20b781c3c9">2.7 Template</option>
<option value="e722569e-2e98-42b5-a128-bbbee895bd37">2.8 Beta Template</option>
<option value="ad199a28-65aa-4306-bfdc-af9370e4e7a3">2.8 Default Template</option>
<option value="d0d3e26d-0d79-4bba-948c-5c550ae36b33">2.9 Settings Template RC branch 4.24.2017</option>
<option value="04d297e7-c9ea-4cca-9667-9af9808fae7d">Garrett 2.9</option>
<option value="7d38f511-477f-4e9b-a296-f1da0cf93c26">Obi Wan Template June 21</option>
</select>
                        </div>
'@

$MLDeploymentSettingsTemplateID = @'
<div class="col-sm-5">
                            <select name="SettingProfileId" class="form-control" id="SettingProfileId" data-validate="required" data-msg-required="Settings Profile is a required field."><{OptionType*:option value}="{SettingsProfileGUID:824c40c6-79e7-4a33-913a-f3c5c683b0a7}">{SettingsProfileName:9448331234_2.3 Setting Profile}</option>
<{OptionType*:option value}="{SettingsProfileGUID:b87b7e40-e7b2-455e-8173-aafd692ca58d}">{SettingsProfileName:BABU_ACCOUNT_SETTINGSPROFILE}</option>
<{OptionType*:option selected}="selected" value="{SettingsProfileGUID:b8aa724d-9d1c-4717-8d0b-2782cb335fdc}">{SettingsProfileName:tepmlate28}</option>
<{OptionType*:option value}="{SettingsProfileGUID:2dff66aa-968a-45ad-bf26-4a5a25bca250}">{SettingsProfileName:Testing Settings Profile}</option>
<{OptionType*:option value}="{SettingsProfileGUID:702fad29-acf5-4598-8262-b08c82fc507c}">{SettingsProfileName:Nate No AD}</option>
<{OptionType*:option value}="{SettingsProfileGUID:c8bf7f59-b13f-4061-9d8c-72a5107e2e9e}">{SettingsProfileName:Nate ObiWan}</option>
<{OptionType*:option value}="{SettingsProfileGUID:a551c0db-dd3c-4411-83da-784144b9ca78}">{SettingsProfileName:NATE_AD}</option>
<{OptionType*:option value}="{SettingsProfileGUID:e8e5e979-c01f-4a9a-87b0-cb36b52c2fcb}">{SettingsProfileName:NateTestNoAD}</option>
<{OptionType*:option value}="{SettingsProfileGUID:e39a1a06-1846-4ff0-9d2a-b6aa3ba79a7f}">{SettingsProfileName:NES2.10 Template}</option>
<{OptionType*:option value}="{SettingsProfileGUID:072be0e9-f80a-40f8-b634-708d9ee45e12}">{SettingsProfileName:new profile 0224}</option>
<{OptionType*:option value}="{SettingsProfileGUID:793af62f-ab5c-47ca-b033-e57e611ad539}">{SettingsProfileName:New profile kishore 2.4 setting}</option>
<{OptionType*:option selected}="selected" value="{SettingsProfileGUID:ab1eb773-04e0-49c8-a12d-cc7eb03eb5d9}">{SettingsProfileName:Nick's Profile}</option>
<{OptionType*:option value}="{SettingsProfileGUID:b198766a-2c01-436c-b973-e8260f1df561}">{SettingsProfileName:NICK-TEST}</option>
<{OptionType*:option value}="{SettingsProfileGUID:667598c6-aa63-4ace-81aa-bb61494817ec}">{SettingsProfileName:Nimesh_2.10}</option>
<option value="9c9b2881-1a1b-4807-afc3-9e46c48418f5">Nishan 2.3</option>
<option value="f15336e8-99c5-4dd9-8737-f81b7dfd8d56">pooja1125</option>
</select>
                            <span class="field-validation-valid text-danger" data-valmsg-replace="true" data-valmsg-for="SettingProfileId"></span>
                        </div>
'@

#===========================================================================
# Read and Load XAML In PowerShell
#===========================================================================

    $inputXML = $inputXML -replace 'mc:Ignorable="d"','' -replace "x:N",'N'  -replace '^<Win.*', '<Window'
    [void][System.Reflection.Assembly]::LoadWithPartialName('presentationframework')
    [xml]$XAML = $inputXML
    $reader=(New-Object System.Xml.XmlNodeReader $xaml)
    try{$Form=[Windows.Markup.XamlReader]::Load( $reader )}
    catch{Write-Host "Unable to load Windows.Markup.XamlReader. Double-check syntax and ensure .net is installed."}
    
    $xaml.SelectNodes("//*[@Name]") | ForEach-Object{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
    Function Get-FormVariables{
        If($global:ReadmeDisplay -ne $True){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$True}
        Write-Host "Found the following interactable elements from our form" -ForegroundColor Cyan
        Get-Variable WPF*
    }
    Get-FormVariables
 
#===========================================================================
# Declare Variables
#===========================================================================

$Script:CloudURI = $WPFinputBox_CloudURI.Text
$Script:HexMenuRequest = @()
$Script:AccountsArray = @()
#$Script:SettingsTemplates = $Null
$Script:SourceDeploymentsArray = @()
$Script:SettingsTemplates = @()
$Script:SettingsTemplateId = @()
$script:SourceHexMenuList=@()

#===========================================================================
# All Functions
#===========================================================================

Function ParseSettingsId {
    Param(
        [Parameter(Mandatory = $True)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $True)] $MachineLearningTemplate
    )
    $items = ($WebRequest.AllElements|Where-Object{$_.Class -like 'col-sm-5'}).outerhtml | Where-Object{select-string -inputobject $_ -pattern '<select name='} 
    $SettingsTemplateId = $items | ConvertFrom-String -TemplateContent $MachineLearningTemplate
    $SettingsTemplateId
}

Function ParseSelectedSettingsId {
    Param(
        [Parameter(Mandatory = $True)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $True)] $MachineLearningTemplate
    )
    $items = ($WebRequest.AllElements|Where-Object{$_.Class -like 'col-sm-5'}).outerhtml | Where-Object{select-string -inputobject $_ -pattern '(option selected[=])\"selected\"'} 
    $SettingsTemplateId = $items | ConvertFrom-String -TemplateContent $MachineLearningTemplate
    $SettingsTemplateId
}

Function TransposeData{
    Param(
        [String[]]$Names,
        [Object[][]]$Data
    )
    for($i = 0;; ++$i){
        $Props = [ordered]@{}
        for($j = 0; $j -lt $Data.Length; ++$j){
            If($i -lt $Data[$j].Length){
                $Props.Add($Names[$j], $Data[$j][$i])
            }
        }
        If(!$Props.get_Count()){
            Break
        }
        [PSCustomObject]$Props
    }
}

Function Get-WebTable(){
    Param(
        [Parameter(Mandatory = $True)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $True)]
        [int] $TableNumber
    )
    $Tables = @($WebRequest.ParsedHTML.IHTMLDocument3_getElementsByTagName("TABLE"))
    $Table = $Tables[$TableNumber]
    $Titles = @()
    $Rows = @($Table.Rows)
    ForEach($Row in $Rows)
    {
        $Cells = @($Row.Cells)
        If($Cells[0].tagName -eq "TH")
        {
            $Titles = @($Cells | ForEach-Object { ("" + $_.InnerText).Trim() })
            continue
        }
        If(-not $Titles)
        {
            $Titles = @(1..($Cells.Count + 2) | ForEach-Object { "P$_" })
        }
        $ResultObject = [Ordered] @{}
        for($Counter = 0; $Counter -lt $Cells.Count; $Counter++)
        {
            $Title = $Titles[$Counter]
            If(-not $Title) { continue }
            $ResultObject[$Title] = ("" + $Cells[$Counter].InnerText).Trim()
        }
        [PSCustomObject] $ResultObject
    }
}

Function Get-DeploymentTable(){
    Param(
        [Parameter(Mandatory = $True)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $True)]
        [int] $TableNumber
    )
    $Tables = @($WebRequest.ParsedHTML.IHTMLDocument3_getElementsByTagName("TABLE"))
    $Table = $Tables[$TableNumber]
    $Titles = @()
    $Rows = @($Table.Rows)
    ForEach($Row in $Rows)
    {
        $Cells = @($Row.Cells)
        If($Cells[0].tagName -eq "TH")
        {
            $Titles = @($Cells | ForEach-Object {If  ( ("" + $_.InnerText).Trim() -eq 'Actions') {'DeploymentID'} Else { ("" + $_.InnerText).Trim()}})
            continue
        }
        If(-not $Titles)
        {
            $Titles = @(1..($Cells.Count + 2) | ForEach-Object { "P$_" })
        }
        $ResultObject = [Ordered] @{}
        for($Counter = 0; $Counter -lt $Cells.Count; $Counter++)
        {
            $Title = $Titles[$Counter]
            If(-not $Title) { continue }
            $TestString = ("" + $Cells[$Counter].InnerHTML).Trim()
            If($TestString.length -gt 75){
            If($TestString.Substring(0,77) -eq '<a class="btn btn-default btn-sm btn-icon icon-left" href="/deployments/edit/')
            {
            $ResultObject[$Title] = $TestString.Substring(77,36)
            }} Else {$ResultObject[$Title] = ("" + $Cells[$Counter].InnerHTML).Trim()}
        }   
        [PSCustomObject] $ResultObject
    }
}

Function Get-HexMenuTable($DeploymentGUID){
    $HexURL = ($CloudURI + "/deployments/edit/" + $DeploymentGUID + "/toplevelmenu")
    $HexMenuRequest = Invoke-WebRequest -Uri $HexURL -WebSession $Session -Method GET
    $HexMenuArray = $Null
    $HexMenuArray = @()
    $HexMenus = $HexMenuRequest.AllElements|Where-Object{$_.Class -like 'btn*'} | Select-Object onClick
    ForEach($Menu in $HexMenus) {
        If($Menu -like '*showEditMenuItem*'){
            $ResultsArray = @()
            $ResultsArray = ""| Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "Param", "isNew"
            $MenuParser = ('(' + ($Menu.onClick|ForEach-Object{$_.split('(')[1]}).ToString())
            $ResultsArray.menuItemId = ($MenuParser|ForEach-Object{$_.split("''")[1]}).ToString()
            $ResultsArray.parentId = ($MenuParser|ForEach-Object{$_.split("''")[3]}).ToString()
            $ResultsArray.machineId = ($MenuParser|ForEach-Object{$_.split("''")[5]}).ToString()
            $ResultsArray.HexMenuPosition = ($MenuParser|ForEach-Object{$_.split("''")[7]}).ToString()
            $ResultsArray.name = ($MenuParser|ForEach-Object{$_.split("''")[9]}).ToString()
            $ResultsArray.mainMenuActionId = ($MenuParser|ForEach-Object{$_.split("''")[11]}).ToString()
            $ResultsArray.brushId = ($MenuParser|ForEach-Object{$_.split("''")[13]}).ToString()
            $ResultsArray.Param = ($MenuParser|ForEach-Object{$_.split("''")[15]}).ToString()
            $ResultsArray.isNew = ($MenuParser|ForEach-Object{$_.split("''")[17]}).ToString()
        }
        If($ResultsArray.menuItemId -ne '00000000-0000-0000-0000-000000000000'){
        $HexMenuArray += $ResultsArray
        $ResultsArray = $null
        }
    }
    $HexMenuArray
}

Function Get-Accounts(){
    $Request=Invoke-WebRequest -Uri ($CloudURI + "/accounts") -WebSession $Session -Method GET
    $Accounts = Get-WebTable $Request -TableNumber 0
    $AccountRows = $Null
    $AccountRows = @()
    ForEach($Account in $Accounts){
        If($Account.'Account ID' -ne '00000000-0000-0000-0000-000000000000' -OR $Account.'Account ID' -eq ''){
            $AccountRows += [PSCustomObject]@{'AccountID' = $Account.'Account ID' ; 'AccountName' = $Account.'Account Name'}
        }
    }
    [PSCustomObject] $AccountRows
}

Function Get-Deployments(){
    $RequestDeployments=Invoke-WebRequest -Uri ($CloudURI + "/deployments") -WebSession $Session -Method POST
    $Deployments = Get-DeploymentTable $RequestDeployments -TableNumber 0
    $DeploymentRows = $Null
    $DeploymentRows = @{}
    ForEach($Deployment in $Deployments){
        If(-not $Deployment){Continue}
       $DeploymentRows.Add($Deployment.'DeploymentID', $Deployment.'Machine Key')
    }
   $Result = $DeploymentRows.GetEnumerator() | Sort-Object -property Value
   $Result
}

$WPFbutton_Login.Add_Click({

    $CloudURI = $WPFinputBox_CloudURI.Text
    $WPFlabel_StatusUpdate.Content = "Logging in...`n"
    $Form.Dispatcher.Invoke([action]{},"Render")
    $Request = Invoke-WebRequest -URI ($CloudURI + "/login") -SessionVariable script:Session
    $LoginForm = $Request.Forms[0]
    $LoginForm | Format-List
    $LoginForm.fields
    $LoginForm.Fields["UserName"] = $WPFinputBox_User.Text
    $LoginForm.Fields["Password"] = $WPFinputBox_Pass.Password
    $Request=Invoke-WebRequest -Uri ($CloudURI + $LoginForm.Action) -WebSession $Session -Method POST -Body $LoginForm.Fields
    $Request=Invoke-WebRequest -Uri ($CloudURI + "/login") -WebSession $Session -Method POST -Body $LoginForm.Fields
    $WPFlabel_StatusUpdate.Content += "Retrieving Accounts...`n"
    $Form.Dispatcher.Invoke([action]{},"Render")
    $AccountsArray = Get-Accounts | Sort-Object -Property AccountName #-Unique

    $WPFcomboBox_SourceAccounts.ItemsSource = $AccountsArray
    $WPFcomboBox_SourceAccounts.DisplayMemberPath = "AccountName"

    $WPFlabel_StatusUpdate.Content += "OK"
    $Form.Dispatcher.Invoke([action]{},"Render")

    $WPFlabel_StatusUpdate.Content = "Retrieving Prysm Deployments. `nPlease wait, this can take a few minutes..."
    $Form.Dispatcher.Invoke([action]{},"Render")
    $WPFcomboBox_SourceAccounts.Text = 'Prysm'

    $SettingsTemplateRequest =  Invoke-WebRequest -Uri ($CloudURI + "/settings/create") -WebSession $Session -Method GET
    $SettingsTemplates = $Null
    $SettingsTemplates = ParseSettingsId -WebRequest $SettingsTemplateRequest -MachineLearningTemplate $MLAccountSettingsTemplates
    $WPFcomboBox_SettingsTemplate.ItemsSource = $SettingsTemplates
    $WPFcomboBox_SettingsTemplate.DisplayMemberPath = "SettingsTemplateName"

    $AccountID = $WPFcomboBox_SourceAccounts.SelectedValue.AccountID
    $AccountURI = ($CloudURI + "/accounts/impersonate?accountId=" + $AccountID)
    Invoke-WebRequest -Uri $AccountURI -WebSession $Session -Method POST

    $SourceDeploymentsArray = $Null
    $SourceDeploymentsArray = Get-Deployments
    $WPFlistBox_SourceDeployments.ItemsSource = $SourceDeploymentsArray

    $WPFlabel_StatusUpdate.Content = "Ready..."
    $Form.Dispatcher.Invoke([action]{},"Render")

})

$WPFbutton_SourceImpersonate.Add_Click({

    $WPFlabel_StatusUpdate.Content = ""
    $WPFlabel_StatusUpdate.Content += "Please wait, loading deployments for account: " + $WPFcomboBox_SourceAccounts.SelectedValue.AccountName + "... `n"
    $Form.Dispatcher.Invoke([action]{},"Render")

    $AccountID = $WPFcomboBox_SourceAccounts.SelectedValue.AccountID
    $AccountIDTemp = $AccountsArray.($WPFcomboBox_SourceAccounts.SelectedValue.AccountID)
    If($AccountID.length -eq 2) {$AccountID = $AccountIDTemp[$WPFcomboBox_SourceAccounts.SelectedIndex]}
    $AccountURI = ($CloudURI + "/accounts/impersonate?accountId=" + $AccountID)

    Invoke-WebRequest -Uri $AccountURI -WebSession $Session -Method POST
    $WPFlabel_AccountSelected.Content = "Impersonating account: " + $WPFcomboBox_SourceAccounts.SelectedValue.AccountName

    $SourceDeploymentsArray = $Null
    $SourceDeploymentsArray = Get-Deployments
    $WPFlistBox_SourceDeployments.ItemsSource = $SourceDeploymentsArray
    

    $SettingsTemplateRequest =  Invoke-WebRequest -Uri ($CloudURI + "/settings/create") -WebSession $Session -Method GET
    $SettingsTemplates = $Null
    $SettingsTemplates = ParseSettingsId -WebRequest $SettingsTemplateRequest -MachineLearningTemplate $MLAccountSettingsTemplates

   # $WPFcomboBox_SourceAccounts.ItemsSource = $AccountsArray

  #  $WPFcomboBox_SourceAccounts.DisplayMemberPath = "AccountName"
    $WPFcomboBox_SettingsTemplate.ItemsSource = $SettingsTemplates
    $WPFcomboBox_SettingsTemplate.DisplayMemberPath = "SettingsTemplateName"

    Write-Host $SettingsArray

    $WPFlabel_AccountSelected.Visibility = 'Visible'
    $WPFrectangle_Impersonating.Visibility = 'Visible'
    $WPFlabel_StatusUpdate.Content = "Ready..."
    $Form.Dispatcher.Invoke([action]{},"Render")

})


$WPFlistBox_SourceDeployments.Add_SelectionChanged({
    Write-Host "Selected Items Count: " $WPFlistBox_SourceDeployments.SelectedItems.Count
    ForEach($DeploymentSelection in $WPFlistBox_SourceDeployments.SelectedItems){
        Write-Host "Selected (value) - " $DeploymentSelection.Value
        Write-Host "Selected (value) - " $DeploymentSelection.Key
    }
})


$WPFbutton_SetSettingsTemplate.Add_Click({
    If(-NOT $WPFcomboBox_SettingsTemplate.SelectedItem.SettingsTemplateName) {
        $WPFlabel_StatusUpdate.Content = "Please select choose a template to merge!"
        $Form.Dispatcher.Invoke([action]{},"Render") 
    }
    ElseIf($WPFlistBox_SourceDeployments.SelectedItems.Count -eq 0) {
        $WPFlabel_StatusUpdate.Content = "Please select deployments!"
        $Form.Dispatcher.Invoke([action]{},"Render") 
    } 
    Else {
    $WPFlabel_StatusUpdate.Content = ""
    ForEach($DeploymentSelection in $WPFlistBox_SourceDeployments.SelectedItems){
        
        $SettingsTemplateId = $Null
        $SettingsTemplateId = @()

        $WPFlabel_StatusUpdate.Content += "Setting deployment " + $DeploymentSelection.Value  + " to template:  "+ $WPFcomboBox_SettingsTemplate.SelectedItem.SettingsTemplateName + "`n"
        $Form.Dispatcher.Invoke([action]{},"Render")
        $DeploymentEditRequest = Invoke-WebRequest -Uri ($CloudURI + "/deployments/edit/" + $DeploymentSelection.Key) -WebSession $Session -Method GET
        $SettingsTemplateId = ParseSelectedSettingsId -WebRequest $DeploymentEditRequest -MachineLearningTemplate $MLDeploymentSettingsTemplateID
        $SettingsTemplateId = $SettingsTemplateId | Where-Object {$_.SettingsProfileGUID -ne 'SettingProfileId' -AND $_.OptionType -eq 'option selected'}
        Write-Host "Settings GUID - " $SettingsTemplateId.SettingsProfileGUID
        Write-Host "Settings Name - " $SettingsTemplateId.SettingsProfileName

        $MergeSettingsTemplatesBody = @{}
        $MergeSettingsTemplatesBody.Add("IsTemplate", "False")
        $MergeSettingsTemplatesBody.Add("GroupId", $SettingsTemplateId.SettingsProfileGUID)
        $MergeSettingsTemplatesBody.Add("AccountId", $WPFcomboBox_SourceAccounts.SelectedValue.AccountID)
        $MergeSettingsTemplatesBody.Add("Name", $SettingsTemplateId.SettingsProfileName)
        $MergeSettingsTemplatesBody.Add("TemplateId", $WPFcomboBox_SettingsTemplate.SelectedItem.SettingsTemplateID)

        $MergeSettingsTemplatesHeaders = @{}
        $MergeSettingsTemplatesHeaders.Add("Accept", "text/html, application/xhtml+xml, image/jxr, */*")
        $MergeSettingsTemplatesHeaders.Add("Accept-Encoding","gzip, deflate")
        $MergeSettingsTemplatesHeaders.Add("Accept-Language","en-US,en;q=0.5")
        $MergeSettingsTemplatesHeaders.Add("Referer", $CloudURI + "/settings/edit/" + $SettingsTemplateId.SettingsProfileGUID)

        Write-Host "Settings Template ID - " $WPFcomboBox_SettingsTemplate.SelectedItem.SettingsTemplateID
        $BodyResult = $MergeSettingsTemplatesBody | Format-Table | Out-String 
        $HeaderResult = $MergeSettingsTemplatesHeaders | Format-Table | Out-String 
        Write-Host "HTTP Body - " $BodyResult
        Write-Host "HTTP Header - " $HeaderResult
        Invoke-WebRequest -Uri ($CloudURI + "/settings/edit/" + $SettingsTemplateId.SettingsProfileGUID) -WebSession $Session -Headers $MergeSettingsTemplatesHeaders -Body $MergeSettingsTemplatesBody -Method POST
        }
    }
})

$WPFbutton_ReplaceWhiteBoard.Add_Click({
    If($WPFlistBox_SourceDeployments.SelectedItems.Count -eq 0) {
        $WPFlabel_StatusUpdate.Content = "Please select deployments!"
        $Form.Dispatcher.Invoke([action]{},"Render") 
    }
    Else {
    $WPFlabel_StatusUpdate.Content = ""
    $Form.Dispatcher.Invoke([action]{},"Render")
    ForEach($DeploymentSelection in $WPFlistBox_SourceDeployments.SelectedItems){
        $SourceHexMenuArray = Get-HexMenuTable -DeploymentGUID $DeploymentSelection.Key

        $SourceHexMenuList=@()
        $SourceHexMenuList=@($SourceHexMenuArray | Where-Object {$_."isNew" -eq 'false'} | Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "Param", "isNew", "isMenu", "menuLevel")

    #    $SourceHexMenuListCount = $SourceHexMenuList.Count

        ForEach($HexMenu in $SourceHexMenuList){
            If($HexMenu.mainMenuActionId -eq "27b4233b-2718-4da9-b45c-234797c50b1b")
            {
                $HexMenuHeaders = @{}
                $HexMenuHeaders.Add("Accept", "text/html, application/xhtml+xml, image/jxr, */*")
                $HexMenuHeaders.Add("Accept-Encoding","gzip, deflate")
                $HexMenuHeaders.Add("Accept-Language","en-US,en;q=0.5")
                $HexMenuHeaders.Add("Referer", $CloudURI + "/deployments/edit/" + $DeploymentSelection.Key + "/toplevelmenu" )

                $HexMenuBody = @{}
                $HexMenuBody.Add("MainMenuItemId", $HexMenu.menuItemId)
                $HexMenuBody.Add("MachineId", $DeploymentSelection.Key)
                $HexMenuBody.Add("ParentMenuItemId", $HexMenu.menuItemId)
                $HexMenuBody.Add("PositionIndex", $HexMenu.HexMenuPosition)
                $HexMenuBody.Add("Name", "Sketchboard" )
                $HexMenuBody.Add("MainMenuActionId", "d5bef90c-1133-455c-88af-14fb9cab0023")
                $HexMenuBody.Add("Param", $HexMenu.Param)
                $HexMenuBody.Add("BrushId", $HexMenu.brushId)
                
                $WPFlabel_StatusUpdate.Content += "Changed Hex Menu on deployment:  " + $DeploymentSelection.Value  + "`n"
                $Form.Dispatcher.Invoke([action]{},"Render")

                Invoke-WebRequest -Uri ($CloudURI + "/deployments/edit/" + $DeploymentSelection.Key + "/toplevelmenu") -WebSession $Session -Header $HexMenuHeaders -Body $HexMenuBody -Method POST
            }
        }
    }
}
})

#===========================================================================
# Shows the form
#===========================================================================
Write-Host "To show the form, run the following" -ForegroundColor Cyan
$Script:Form.ShowDialog() | out-null