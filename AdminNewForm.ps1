#ERASE ALL THIS AND PUT XAML BELOW between the @" "@
$inputXML = @"
<Window x:Name="PrysmAdminTool" x:Class="WpfApp2.MainWindow"
xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
xmlns:local="clr-namespace:WpfApp2"
mc:Ignorable="d"
Title="Prysm Admin Automation Tool" Height="642.898" Width="1008.685">
    <Grid Background="{DynamicResource {x:Static SystemColors.GradientInactiveCaptionBrushKey}}" Margin="0,0,0,1" >
        <Label x:Name="label_Username" Content="Username:" HorizontalAlignment="Left" Height="26" Margin="13,41,0,0" VerticalAlignment="Top" Width="91" VerticalContentAlignment="Center"/>
        <Label x:Name="label_Password" Content="Password:" HorizontalAlignment="Left" Height="26" Margin="13,74,0,0" VerticalAlignment="Top" Width="91" VerticalContentAlignment="Center"/>
        <TextBox x:Name="inputBox_User" HorizontalAlignment="Left" Height="26" Margin="109,41,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="213" Text="nsegalle@prysm.com" VerticalContentAlignment="Center"/>
        <PasswordBox x:Name="inputBox_Pass" HorizontalAlignment="Left" Margin="109,74,0,0" VerticalAlignment="Top" Height="26" Width="213" Password="" VerticalContentAlignment="Center"/>
        <Button x:Name="button_Login" Content="Login" HorizontalAlignment="Left" Height="28" Margin="364,72,0,0" VerticalAlignment="Top" Width="108"/>
        <Button x:Name="button_Tester" Content="TEST" HorizontalAlignment="Left" Margin="873,55,0,0" VerticalAlignment="Top" Width="101" Height="24"/>
        <Label x:Name="label_Deployment_Copy" Content="" HorizontalAlignment="Left" Height="31" Margin="121,119,0,0" VerticalAlignment="Top" Width="326"/>
        <Button x:Name="button_DeleteLiveSources" Content="Delete Live Sources" HorizontalAlignment="Left" Height="24" Margin="766,114,0,0" VerticalAlignment="Top" Width="145"/>
        <Button x:Name="button_PasteLiveSources" Content="Paste Live Sources" HorizontalAlignment="Left" Height="24" Margin="619,114,0,0" VerticalAlignment="Top" Width="121"/>
        <Button x:Name="button_CopyLiveSources" Content="Copy Live Sources" HorizontalAlignment="Left" Height="24" Margin="452,114,0,0" VerticalAlignment="Top" Width="128"/>
        <Button x:Name="button_CopyHexMenus" Content="Copy Hex Menus" HorizontalAlignment="Left" Height="24" Margin="851,503,0,0" VerticalAlignment="Top" Width="123"/>
        <Button x:Name="button_DeleteHexMenus" Content="Delete Hex Menus" HorizontalAlignment="Left" Height="26" Margin="851,263,0,0" VerticalAlignment="Top" Width="123"/>
        <Button x:Name="button_PasteHexMenus" Content="Paste Hex Menus" HorizontalAlignment="Left" Height="26" Margin="851,305,0,0" VerticalAlignment="Top" Width="123"/>
        <Label x:Name="label_CloudURI" Content="Cloud URI:" HorizontalAlignment="Left" Height="26" Margin="13,10,0,0" VerticalAlignment="Top" Width="91" VerticalContentAlignment="Center"/>
        <TextBox x:Name="inputBox_CloudURI" HorizontalAlignment="Left" Height="26" Margin="109,10,0,0" TextWrapping="Wrap" VerticalAlignment="Top" Width="363" Text="https://admin-regus.synthesize.com" VerticalContentAlignment="Center"/>
        <Label x:Name="label_StatusUpdate" Content="test" HorizontalAlignment="Left" Height="72" Margin="480,31,0,0" VerticalAlignment="Top" Width="365" Background="Black" Foreground="#FF00FF17"/>
        <Label x:Name="label_StatusLbl" Content="Status:" HorizontalAlignment="Left" Margin="480,0,0,0" VerticalAlignment="Top" Width="76"/>
        <TabControl x:Name="tabControl_SourceDeployments" HorizontalAlignment="Left" Height="430" Margin="35,150,0,0" VerticalAlignment="Top" Width="372">
            <TabItem x:Name="tabItem_CopyDeploy" Header="Copy Deployment">
                <TabItem.Background>
                    <LinearGradientBrush EndPoint="0,1" StartPoint="0,0">
                        <GradientStop Color="#FFF0F0F0" Offset="0"/>
                        <GradientStop Color="#FFF3F9FF" Offset="1"/>
                    </LinearGradientBrush>
                </TabItem.Background>
                <Grid Background="#FFF3F9FF">
                    <ListBox x:Name="listBox_SourceAccounts" HorizontalAlignment="Left" Height="132" Margin="5,33,0,0" VerticalAlignment="Top" Width="356" SelectedValuePath="AccountID" DisplayMemberPath="AccountName"/>
                    <Label x:Name="label_SourceAccounts" Content="Select Source Account:" HorizontalAlignment="Left" Height="26" Margin="12,8,0,0" VerticalAlignment="Top" Width="136"/>
                    <Label x:Name="label_SourceAccountSelected" Content="" HorizontalAlignment="Left" Height="26" Margin="148,7,0,0" VerticalAlignment="Top" Width="207"/>
                    <ListBox x:Name="listBox_SourceDeployments" HorizontalAlignment="Left" Height="131" Margin="5,224,0,0" VerticalAlignment="Top" Width="356" SelectedValuePath="Key" DisplayMemberPath="Value" SelectionMode="Multiple"/>
                    <Label x:Name="label_SourceDeployments" Content="Select Source Deployment:" HorizontalAlignment="Left" Height="26" Margin="12,198,0,0" VerticalAlignment="Top" Width="177" IsEnabled="False"/>
                    <Label x:Name="label_SourceDeploymentSelected" Content="" HorizontalAlignment="Left" Height="26" Margin="160,197,0,0" VerticalAlignment="Top" Width="195"/>
                    <Button x:Name="button_SourceImpersonate" Content="Impersonate" HorizontalAlignment="Left" Height="24" Margin="243,173,0,0" VerticalAlignment="Top" Width="112" RenderTransformOrigin="-0.411,0.583"/>
                    <Button x:Name="button_LoadDeploymentToMemory" Content="Copy Into Memory" HorizontalAlignment="Left" Margin="243,368,0,0" VerticalAlignment="Top" Width="112" Height="24" IsEnabled="False"/>
                    <Button x:Name="button_CancelCopy" Content="Cancel Copy" HorizontalAlignment="Left" Margin="126,368,0,0" VerticalAlignment="Top" Width="112" Height="24" IsEnabled="False"/>
                </Grid>
            </TabItem>
            <TabItem x:Name="tabItem_TemplateDeploy" Header="Deploy From Template">
                <Grid Background="#FFF3F9FF">
                    <ListBox x:Name="listBox_SourceTemplate" HorizontalAlignment="Left" Height="132" Margin="10,112,0,0" VerticalAlignment="Top" Width="346"/>
                    <Label x:Name="label_SelectSourceTemplate" Content="Select Source Deployment Template:" HorizontalAlignment="Left" Height="25" Margin="10,89,0,0" VerticalAlignment="Top" Width="205"/>
                    <Button x:Name="button_LoadTemplateToMemory" Content="Copy Into Memory" HorizontalAlignment="Left" Margin="244,368,0,0" VerticalAlignment="Top" Width="112" Height="24" RenderTransformOrigin="0.506,0.491"/>
                    <Button x:Name="button_CancelTemplateDeploy" Content="Cancel Deploy" HorizontalAlignment="Left" Margin="127,368,0,0" VerticalAlignment="Top" Width="112" Height="24" IsEnabled="False"/>
                </Grid>
            </TabItem>
        </TabControl>
        <Label x:Name="label_Impersonatelbl" Content="Impersonating:" HorizontalAlignment="Left" Height="26" Margin="35,123,0,0" VerticalAlignment="Top" Width="112"/>
        <TabControl x:Name="tabControl_SourceDeployments_Copy" HorizontalAlignment="Left" Height="430" Margin="447,150,0,0" VerticalAlignment="Top" Width="372">
            <TabItem x:Name="tabItem_PasteDeployment" Header="Paste Deployment">
                <TabItem.Background>
                    <LinearGradientBrush EndPoint="0,1" StartPoint="0,0">
                        <GradientStop Color="#FFF0F0F0" Offset="0"/>
                        <GradientStop Color="#FFF3F9FF" Offset="1"/>
                    </LinearGradientBrush>
                </TabItem.Background>
                <Grid Background="#FFF3F9FF">
                    <ListBox x:Name="listBox_DestinationAccountsPasteDeploy" HorizontalAlignment="Left" Height="132" Margin="5,33,0,0" VerticalAlignment="Top" Width="356" SelectedValuePath="AccountID" DisplayMemberPath="AccountName"/>
                    <Label x:Name="label_DestinationAccount" Content="Select Destination Account:" HorizontalAlignment="Left" Height="26" Margin="12,8,0,0" VerticalAlignment="Top" Width="159"/>
                    <Label x:Name="label_SourceAccountSelected1" Content="" HorizontalAlignment="Left" Height="26" Margin="194,7,0,0" VerticalAlignment="Top" Width="278"/>
                    <ListBox x:Name="listBox_DestinationDeployments" HorizontalAlignment="Left" Height="131" Margin="5,224,0,0" VerticalAlignment="Top" Width="356" SelectedValuePath="Key" DisplayMemberPath="Value"/>
                    <Label x:Name="label_DestinationDeployments" Content="Select Source Deployment:" HorizontalAlignment="Left" Height="26" Margin="12,198,0,0" VerticalAlignment="Top" Width="177" IsEnabled="False"/>
                    <Label x:Name="label_DestinationDeploymentSelected" Content="" HorizontalAlignment="Left" Height="26" Margin="194,197,0,0" VerticalAlignment="Top" Width="278"/>
                    <Button x:Name="button_DestinationImpersonate" Content="Impersonate" HorizontalAlignment="Left" Height="24" Margin="243,173,0,0" VerticalAlignment="Top" Width="112"/>
                    <Button x:Name="button_PasteDeployment" Content="Paste Deployment" HorizontalAlignment="Left" Margin="243,368,0,0" VerticalAlignment="Top" Width="112" Height="24" IsEnabled="False"/>
                    <Button x:Name="button_CancelTemplatePaste" Content="Cancel Paste" HorizontalAlignment="Left" Margin="126,368,0,0" VerticalAlignment="Top" Width="112" Height="24" IsEnabled="False"/>
                </Grid>
            </TabItem>
            <TabItem x:Name="tabItem_PasteToNew" Header="Paste To New Deployment">
                <Grid Background="#FFF3F9FF">
                    <Button x:Name="button_CancelTemplateCreate" Content="Cancel" HorizontalAlignment="Left" Margin="127,368,0,0" VerticalAlignment="Top" Width="112" Height="24" IsEnabled="False"/>
                    <Label x:Name="label_CopyToMachine" Content="MachineKey:" HorizontalAlignment="Left" Height="25" Margin="7,231,0,0" VerticalAlignment="Top" Width="104"/>
                    <TextBox x:Name="inputBox_CopyToMachineKey" HorizontalAlignment="Left" Margin="116,231,0,0" TextWrapping="Wrap" Width="245" Height="25" VerticalAlignment="Top"/>
                    <ComboBox x:Name="comboBox_CopyToSettingsProfiles" HorizontalAlignment="Left" Height="26" Margin="116,261,0,0" VerticalAlignment="Top" Width="245" SelectedValuePath="Key" DisplayMemberPath="Value"/>
                    <ListBox x:Name="listBox_DestinationAccountsNewDeploy" HorizontalAlignment="Left" Height="132" Margin="5,64,0,0" VerticalAlignment="Top" Width="356" SelectedValuePath="AccountID" DisplayMemberPath="AccountName"/>
                    <Label x:Name="label_AccountsDestination" Content="Select Destination Account:" HorizontalAlignment="Left" Height="26" Margin="7,42,0,0" VerticalAlignment="Top" Width="159"/>
                    <Label x:Name="label_SettingsProfiles_Copy" Content="Settings Profiles:" HorizontalAlignment="Left" Height="26" Margin="7,261,0,0" VerticalAlignment="Top" Width="104" />
                    <Label x:Name="label_CopyToMachineLocation" Content="Location:" HorizontalAlignment="Left" Height="25" Margin="7,201,0,0" VerticalAlignment="Top" Width="104"/>
                    <TextBox x:Name="inputBox_CopyToMachineLocation" HorizontalAlignment="Left" Margin="116,201,0,0" TextWrapping="Wrap" Width="245" Height="25" VerticalAlignment="Top"/>
                    <Button x:Name="button_CreateDeployment" Content="Create" HorizontalAlignment="Left" Margin="244,368,0,0" VerticalAlignment="Top" Width="112" Height="24"/>
                </Grid>
            </TabItem>
        </TabControl>
    </Grid>
</Window>
"@       

#===========================================================================
# Machine Learning Templates
#===========================================================================

$MLMachineSettingsTemplate = @'
    <input name="{Name*:[0].MachineSettingValueId}" type="hidden" value="{Value:2509a448-68d6-4e2c-9ed5-a0c9fbc3c51b}">
    <input name="{Name*:[0].Name}" type="hidden" value="{Value:EnableVTC}">
    <input name="{Name*:[0].Value}" type="hidden" value="{Value:false}">
    <input name="{Name*:[1].MachineSettingValueId}" type="hidden" value="{Value:623801a0-b13b-406c-b80e-dc244e4996c3}">
    <input name="{Name*:[1].Name}" type="hidden" value="{Value:VTCType}">
    <select name="{Name*:[1].Value}" class="form-control"><option value="">Select VTC Type</option>
    <option selected="selected" value="{Value:1}">Cisco C Series</option>
    <option value="2">Polycom Real Presence</option>
    </select>
    <input name="{Name*:[2].MachineSettingValueId}" type="hidden" value="{Value:fa537bf0-d3da-43b4-bf7c-c0fd0d5363a8}">
    <input name="{Name*:[2].Name}" type="hidden" value="{Value:VTCCallProtocol}">
    <select name="{Name*:[2].Value}" class="form-control"><option value="">Select Protocol</option>
    <option value="1">SIP</option>
    <option selected="selected" value="{Value:2}">H323</option>
    <option value="3">H320</option>
    </select>
    <input name="{Name*:[3].MachineSettingValueId}" type="hidden" value="{Value:9a61f8b1-9ffc-4d42-959f-02d6149fd355}">
    <input name="{Name*:[3].Name}" type="hidden" value="{Value:VTCIp}">
    <input name="{Name*:[3].Value}" class="form-control text-box single-line" type="text" value="{Value:0.0.0.0}">
'@

$MLSettingsTemplateId = @'
    <div class="col-sm-5">
    <select name="SettingProfileId" class="form-control" id="SettingProfileId" data-msg-required="Settings Profile is a required field." data-validate="required"><option value="824c40c6-79e7-
    4a33-913a-f3c5c683b0a7">9448331234_2.3 Setting Profile</option>
    <option selected="selected" value="{SettingsProfileId*:b87b7e40-e7b2-455e-8173-aafd692ca58d}">BABU_ACCOUNT_SETTINGSPROFILE</option>
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
    
    $xaml.SelectNodes("//*[@Name]") | %{Set-Variable -Name "WPF$($_.Name)" -Value $Form.FindName($_.Name)}
    Function Get-FormVariables{
        if ($global:ReadmeDisplay -ne $true){Write-host "If you need to reference this display again, run Get-FormVariables" -ForegroundColor Yellow;$global:ReadmeDisplay=$true}
        write-host "Found the following interactable elements from our form" -ForegroundColor Cyan
        get-variable WPF*
    }
    Get-FormVariables
 
#===========================================================================
# Declare Variables
#===========================================================================

$Script:SettingsURLs = @("drivers", "workspacetray", "displayscalefactor", "login", "socketapi", "vtc", "broadcasting", "SkypeForBusiness", "remotetouchconsole", "notifications", "wss", "WallUnlock", "networkmessaging", "monitoring", "slate")
$Script:DeploymentTemplates = @("CEC Deployment", "Executive Room Deployment", "Huddle Room Deployment", "RTC Room Deployment", "VM Room Deployment")

$DeploymentTemplates | %{$WPFlistBox_SourceTemplate.Items.Add($_) | Out-Null}

#===========================================================================
# All Functions
#===========================================================================

Function ParseMachineSettingsInput {
    param(
        [Parameter(Mandatory = $true)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $true)]
        [String] $SourceURL
    )
    $regex = '\[+[0-9]+\]+.'
    $items = $WebRequest.AllElements | ?{select-string -inputobject $_.name -pattern $regex} | Select-Object outerHTML
    $SettingsArray = $items | ConvertFrom-String -TemplateContent $MLMachineSettingsTemplate
    $MachineSettingValueId = @($SettingsArray | ?{ $_.Name -Like "*MachineSettingValueId" } | Select -Expand Value)
    $SettingName = @($SettingsArray | ?{ $_.Name -Like "*Name" } | Select-Object -Expand Value)
    $SettingValue = @($SettingsArray | ?{ $_.Name -Like "*Value" } | Select-Object -Expand Value)
    $Source = @($SourceURL)
    $ParsedData = TransposeData MachineSettingValueId, Name, Value, Source $MachineSettingValueId, $SettingName, $SettingValue, $Source
    $ParsedData
}

Function ParseSettingsId {
    param(
        [Parameter(Mandatory = $true)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest
    )
    $items = ($WebRequest.AllElements|?{$_.Class -like 'col-sm-5'}).outerhtml | ?{select-string -inputobject $_ -pattern '<select name='} 
    $SettingsTemplateId = $items | ConvertFrom-String -TemplateContent $MLSettingsTemplateId
    $SettingsTemplateId
}

Function TransposeData{
    param(
        [String[]]$Names,
        [Object[][]]$Data
    )
    for($i = 0;; ++$i){
        $Props = [ordered]@{}
        for($j = 0; $j -lt $Data.Length; ++$j){
            if($i -lt $Data[$j].Length){
                $Props.Add($Names[$j], $Data[$j][$i])
            }
        }
        if(!$Props.get_Count()){
            break
        }
        [PSCustomObject]$Props
    }
}


Function Get-WebTable(){
    param(
        [Parameter(Mandatory = $true)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $true)]
        [int] $TableNumber
    )
    $tables = @($WebRequest.ParsedHTML.IHTMLDocument3_getElementsByTagName("TABLE"))
    $table = $tables[$TableNumber]
    $titles = @()
    $rows = @($table.Rows)
    foreach($row in $rows)
    {
        $cells = @($row.Cells)
        if($cells[0].tagName -eq "TH")
        {
            $titles = @($cells | % { ("" + $_.InnerText).Trim() })
            continue
        }
        if(-not $titles)
        {
            $titles = @(1..($cells.Count + 2) | % { "P$_" })
        }
        $resultObject = [Ordered] @{}
        for($counter = 0; $counter -lt $cells.Count; $counter++)
        {
            $title = $titles[$counter]
            if(-not $title) { continue }
            $resultObject[$title] = ("" + $cells[$counter].InnerText).Trim()
        }
        [PSCustomObject] $resultObject
    }
}

Function Get-DeploymentTable(){
    param(
        [Parameter(Mandatory = $true)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $true)]
        [int] $TableNumber
    )
    $tables = @($WebRequest.ParsedHTML.IHTMLDocument3_getElementsByTagName("TABLE"))
    $table = $tables[$TableNumber]
    $titles = @()
    $rows = @($table.Rows)
    foreach($row in $rows)
    {
        $cells = @($row.Cells)
        if($cells[0].tagName -eq "TH")
        {
            $titles = @($cells | % {If  ( ("" + $_.InnerText).Trim() -eq 'Actions') {'DeploymentID'} Else { ("" + $_.InnerText).Trim()}})
            continue
        }
        if(-not $titles)
        {
            $titles = @(1..($cells.Count + 2) | % { "P$_" })
        }
        $resultObject = [Ordered] @{}
        for($counter = 0; $counter -lt $cells.Count; $counter++)
        {
            $title = $titles[$counter]
            if(-not $title) { continue }
            $testString = ("" + $cells[$counter].InnerHTML).Trim()
            If($testString.length -gt 75){
            if($testString.Substring(0,77) -eq '<a class="btn btn-default btn-sm btn-icon icon-left" href="/deployments/edit/')
            {
            $resultObject[$title] = $testString.Substring(77,36)
            }} Else {$resultObject[$title] = ("" + $cells[$counter].InnerHTML).Trim()}
        }   
        [PSCustomObject] $resultObject
    }
}

Function Get-SettingsProfileTable(){
    param(
        [Parameter(Mandatory = $true)]
        [Microsoft.PowerShell.Commands.HtmlWebResponseObject] $WebRequest,
        [Parameter(Mandatory = $true)]
        [int] $TableNumber
    )
    $tables = @($WebRequest.ParsedHTML.IHTMLDocument3_getElementsByTagName("TABLE"))
    $table = $tables[$TableNumber]
    $titles = @()
    $rows = @($table.Rows)
    foreach($row in $rows)
    {
        $cells = @($row.Cells)
        if($cells[0].tagName -eq "TH")
        {
            $titles = @($cells | % {If  ( ("" + $_.InnerText).Trim() -eq 'Actions') {'SettingsID'} Else { ("" + $_.InnerText).Trim()}})
            continue
        }
        if(-not $titles)
        {
            $titles = @(1..($cells.Count + 2) | % { "P$_" })
        }
        $resultObject = [Ordered] @{}
        for($counter = 0; $counter -lt $cells.Count; $counter++)
        {
            $title = $titles[$counter]
            if(-not $title) { continue }
            $testString = ("" + $cells[$counter].InnerHTML).Trim()
            If($testString.length -gt 70){
            if($testString.Substring(0,74) -eq '<a class="btn btn-default btn-sm btn-icon icon-left" href="/settings/edit/')
            {                             
            $resultObject[$title] = $testString.Substring(74,36)
            }} Else {$resultObject[$title] = ("" + $cells[$counter].InnerText).Trim()}
        }
        [PSCustomObject] $resultObject
    }
}

Function Get-HexMenuTable($DeploymentGUID){
    $HexURL = ($CloudURI + "/deployments/edit/" + $DeploymentGUID + "/toplevelmenu")
    $Script:HexMenuRequest = Invoke-WebRequest -Uri $HexURL -WebSession $Session -Method GET
    $HexMenuArray = $Null
    $HexMenuArray = @()
    $HexMenus = $HexMenuRequest.AllElements|?{$_.Class -like 'btn*'} | Select-Object onClick
    ForEach($Menu in $HexMenus) {
    #write-host $Menu
        if($Menu -like '*showEditMenuItem*'){
            $ResultsArray = @()
            $ResultsArray = ""| Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "param", "isNew"
            $MenuParser = ('(' + ($Menu.onClick|%{$_.split('(')[1]}).ToString())
            $ResultsArray.menuItemId = ($MenuParser|%{$_.split("''")[1]}).ToString()
            $ResultsArray.parentId = ($MenuParser|%{$_.split("''")[3]}).ToString()
            $ResultsArray.machineId = ($MenuParser|%{$_.split("''")[5]}).ToString()
            $ResultsArray.HexMenuPosition = ($MenuParser|%{$_.split("''")[7]}).ToString()
            $ResultsArray.name = ($MenuParser|%{$_.split("''")[9]}).ToString()
            $ResultsArray.mainMenuActionId = ($MenuParser|%{$_.split("''")[11]}).ToString()
            $ResultsArray.brushId = ($MenuParser|%{$_.split("''")[13]}).ToString()
            $ResultsArray.param = ($MenuParser|%{$_.split("''")[15]}).ToString()
            $ResultsArray.isNew = ($MenuParser|%{$_.split("''")[17]}).ToString()
           # write-host $MenuItems.menuItemId, $MenuItems.parentId, $MenuItems.HexMenuPosition, $MenuItems.name, $MenuItems.mainMenuActionId, $MenuItems.param
        }
        If($ResultsArray.menuItemId -ne '00000000-0000-0000-0000-000000000000'){
        $HexMenuArray += $ResultsArray
        $ResultsArray = $null
        }
    }
    $HexMenuArray
}

Function Get-LSTable($DeploymentGUID){
    $LSURL = ($CloudURI + "/deployments/edit/" + $DeploymentGUID + "/livesources")
    $Script:LiveSourceRequest = Invoke-WebRequest -Uri $LSURL -WebSession $Session -Method GET
    $LiveSourceArray = $Null
    $LiveSourceArray = @()
    #$LiveSourceCollection = @()
    #$LiveSourceCollection = ""| Select-Object "LiveSourceID", "DeploymentID", "FriendlyName", "VideoDeviceIndex", "DeviceName", "AudioDeviceIndex", "Fps", "Width", "Height", "ShowFriendlyName", "ShowVolumeControl", "IsInteractive", "IsPrivate", "Tag", "StreamingConsumerBufferSizeSeconds", "StreamingBitrateMbs", "StreamingFps"
    $LiveSources = $LiveSourceRequest.AllElements|?{$_.Class -like 'btn*'}|Select-Object onClick
    ForEach($LS in $LiveSources) {
        if($LS -like '*editLiveSource*'){
            $ResultsArray = @()
            $ResultsArray = ""| Select-Object "LiveSourceID", "DeploymentID", "FriendlyName", "VideoDeviceIndex", "DeviceName", "AudioDeviceIndex", "Fps", "Width", "Height", "ShowFriendlyName", "ShowVolumeControl", "IsInteractive", "IsPrivate", "Tag", "StreamingConsumerBufferSizeSeconds", "StreamingBitrateMbs", "StreamingFps"
            $LiveSourceParser = ('(' + ($LS.onClick|%{$_.split('(')[1]}).ToString())
            $ResultsArray.LiveSourceID = ($LiveSourceParser|%{$_.split("''")[1]}).ToString()
            $ResultsArray.DeploymentID = ($LiveSourceParser|%{$_.split("''")[3]}).ToString()
            $ResultsArray.FriendlyName = ($LiveSourceParser|%{$_.split("''")[5]}).ToString()
            $ResultsArray.VideoDeviceIndex = ($LiveSourceParser|%{$_.split("''")[7]}).ToString()
            $ResultsArray.DeviceName = ($LiveSourceParser|%{$_.split("''")[9]}).ToString()
            $ResultsArray.AudioDeviceIndex = ($LiveSourceParser|%{$_.split("''")[11]}).ToString()
            $ResultsArray.Fps = ($LiveSourceParser|%{$_.split("''")[13]}).ToString()
            $ResultsArray.Width = ($LiveSourceParser|%{$_.split("''")[15]}).ToString()
            $ResultsArray.Height = ($LiveSourceParser|%{$_.split("''")[17]}).ToString()
            $ResultsArray.ShowFriendlyName = ($LiveSourceParser|%{$_.split("''")[19]}).ToString()
            $ResultsArray.ShowVolumeControl = ($LiveSourceParser|%{$_.split("''")[21]}).ToString()
            $ResultsArray.IsInteractive = ($LiveSourceParser|%{$_.split("''")[23]}).ToString()
            $ResultsArray.IsPrivate = ($LiveSourceParser|%{$_.split("''")[25]}).ToString()
            $ResultsArray.Tag = ($LiveSourceParser|%{$_.split("''")[27]}).ToString()
            $ResultsArray.StreamingConsumerBufferSizeSeconds = (($LiveSourceParser|%{$_.split(",")[14]}).ToString()).Trim()
            $ResultsArray.StreamingBitrateMbs = (($LiveSourceParser|%{$_.split(",")[15]}).ToString()).Trim()
            $ResultsArray.StreamingFps = (($LiveSourceParser|%{$_.split(",")[16]}).ToString()|%{$_.Substring(0,$_.length - 2)}).Trim()
            write-host $ResultsArray.FriendlyName, $LiveSourceCollection.DeviceName, $LiveSourceCollection.VideoDeviceIndex, $LiveSourceCollection.AudioDeviceIndex, $LiveSourceCollection.IsInteractive, $LiveSourceCollection.IsPrivate
        }
        $LiveSourceArray += $ResultsArray
        $ResultsArray = $null
    }
    $LiveSourceArray
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
    # ForEach($Row in $AccountRows){
    #     @{$Row.AccountName = $Row.AccountID}
    #   #  Write-Host $Row
    #   }

    # Write-Host $AccountRows | ft | Out-String | select AccountID, AccountName
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
    $DeploymentRows
}

Function Get-SettingsProfiles(){
    $Request=Invoke-WebRequest -Uri ($CloudURI + "/settings") -WebSession $Session -Method POST
    $Settings = Get-SettingsProfileTable $Request -TableNumber 1
    # Write-Host Get-SettingsTable $Request -TableNumber 1
    $SettingsRows = $Null
    $SettingsRows = @{}
    ForEach($Setting in $Settings){
        If (-not $Setting){Continue}
        $SettingsRows.Add($Setting.'SettingsID', $Setting.'Settings Profile')
    }
    $SettingsRows
}

Function Set-ControlsVisibilty(){

}

$WPFbutton_Login.Add_Click({
    $Script:CloudURI = $WPFinputBox_CloudURI.Text
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
    $Script:AccountsArray = Get-Accounts | Sort-Object -Property AccountName #-Unique
    $WPFlistBox_SourceAccounts.ItemsSource = $AccountsArray 

   # Write-Host $AccountsArray
    # ForEach($Value in $AccountsArray.Keys){
    #     $WPFlistBox_SourceAccounts.Items.Add($Value)
    # }
    $WPFlabel_StatusUpdate.Content += "OK"
    $Form.Dispatcher.Invoke([action]{},"Render")
    #$WPFlistBox_SourceTemplate.ItemsSource = $DeploymentTemplates

    $WPFlistBox_DestinationAccountsNewDeploy.ItemsSource = $AccountsArray 
    $WPFlistBox_DestinationAccountsPasteDeploy.ItemsSource = $AccountsArray
})

$WPFbutton_SourceImpersonate.Add_Click({

    $WPFlistBox_SourceDeployments.IsEnabled = $True
    $WPFlabel_SourceDeployments.IsEnabled = $True
    $WPFbutton_LoadDeploymentToMemory.IsEnabled = $True
    $WPFlabel_Impersonatelbl.Visibility = 'Visible'

    $AccountID = $WPFlistBox_SourceAccounts.SelectedValue
    $AccountIDTemp = $AccountsArray.($WPFlistBox_SourceAccounts.SelectedValue)
   # write-host $AccountID.length
    If($AccountID.length -eq 2) {$AccountID = $AccountIDTemp[$WPFlistBox_SourceAccounts.SelectedIndex]}
    $AccountURI = ($CloudURI + "/accounts/impersonate?accountId=" + $AccountID)
    write-host $AccountURI
    Invoke-WebRequest -Uri $AccountURI -WebSession $Session -Method POST
    $WPFlabel_SourceAccountSelected.Content = $WPFlistBox_SourceAccounts.SelectedValue
    $Script:SourceDeploymentsArray = $Null
    $SourceDeploymentsArray = Get-Deployments | Sort-Object
    #$WPFlistBox_SourceDeployments.Items.Clear()
    Write-Host $SourceDeploymentsArray
    $WPFlistBox_SourceDeployments.ItemsSource = $SourceDeploymentsArray
    # ForEach($Deployment in $SourceDeploymentsArray.Keys){
    #     $WPFlistBox_SourceDeployments.Items.Add($Deployment)
    # }
    $Script:SettingsArray = $Null
    $Script:SettingsArray = Get-SettingsProfiles | Sort-Object
    #$WPFlistBox_SettingsProfiles.ItemsSource.Clear()
   # $WPFlistBox_SettingsProfiles.ItemsSource = $SettingsArray
   
    $WPFlistBox_SourceDeployments.SelectionChanged
    
    write-host $SettingsArray
    # ForEach($Setting in $SettingsArray.Keys){
    #     $WPFlistBox_SettingsProfiles.Items.Add($Setting)
    # }
})



$WPFlistBox_SourceDeployments.Add_SelectionChanged({
    $WPFlabel_SourceDeploymentSelected.Content = $WPFlistBox_SourceDeployments.SelectedItem.Value
    $Form.Dispatcher.Invoke([action]{},"Render")
    Write-Host "Selected Deployment Item/Value - " $WPFlistBox_SourceDeployments.SelectedItem.Value
    #Write-Host "Selected Deployment Item/Value(s) - " $WPFlistBox_SourceDeployments.SelectedItem.Values
    #Write-Host "Selected Deployment Item/Value(s) - " $WPFlistBox_SourceDeployments.SelectedItems.tostring()    
    ForEach ($selection in $WPFlistBox_SourceDeployments.SelectedItems){
        Write-Host "Selected (value) - " $selection.value
       # Write-Host "Selected (Selected) - " $selection.Selected
       # Write-Host "Selected To String - " $selection.tostring()
    }
    #Write-Host "Selected Deployment Item/Key - " $WPFlistBox_SourceDeployments.SelectedItem.Key
})

$WPFlistBox_DestinationDeployments.Add_SelectionChanged({
    #$WPFlabel_SourceDeploymentSelected.Content = $WPFlistBox_DestinationDeployments.SelectedItem.Value
    #$Form.Dispatcher.Invoke([action]{},"Render")
    Write-Host "Selected Deployment Item/Value - " $WPFlistBox_DestinationDeployments.SelectedItem.Value
    Write-Host "Selected Deployment Item/Key - " $WPFlistBox_DestinationDeployments.SelectedItem.Key
})


$WPFlistBox_DestinationAccountsNewDeploy.Add_SelectionChanged({

    $AccountID = $WPFlistBox_DestinationAccountsNewDeploy.SelectedValue
    $AccountIDTemp = $AccountsArray.($WPFlistBox_DestinationAccountsNewDeploy.SelectedValue)
    If($AccountID.length -eq 2) {$AccountID = $AccountIDTemp[$WPFlistBox_DestinationAccountsNewDeploy.SelectedIndex]}
    $AccountURI = ($CloudURI + "/accounts/impersonate?accountId=" + $AccountID)
    Write-Host $AccountURI
    $Form.Dispatcher.Invoke([action]{},"Render")
    Invoke-WebRequest -Uri $AccountURI -WebSession $Session -Method POST
    $Script:DestinationSettingsArray = $Null
    $Script:DestinationSettingsArray = Get-SettingsProfiles | Sort-Object
    $WPFcomboBox_CopyToSettingsProfiles.ItemsSource = $DestinationSettingsArray

})

$WPFlistBox_DestinationAccountsPasteDeploy.Add_SelectionChanged({
    
        $AccountID = $WPFlistBox_DestinationAccountsPasteDeploy.SelectedValue
        $AccountIDTemp = $AccountsArray.($WPFlistBox_DestinationAccountsPasteDeploy.SelectedValue)
        If($AccountID.length -eq 2) {$AccountID = $AccountIDTemp[$WPFlistBox_DestinationAccountsPasteDeploy.SelectedIndex]}
        $AccountURI = ($CloudURI + "/accounts/impersonate?accountId=" + $AccountID)
        Write-Host $AccountURI
        $Form.Dispatcher.Invoke([action]{},"Render")
        Invoke-WebRequest -Uri $AccountURI -WebSession $Session -Method POST

        $Script:DestinationDeploymentsArray = $Null
        $DestinationDeploymentsArray = Get-Deployments | Sort-Object

        Write-Host $DestinationDeploymentsArray
        $WPFlistBox_DestinationDeployments.ItemsSource = $DestinationDeploymentsArray
    
    })


$WPFbutton_LoadDeploymentToMemory.Add_Click({

    #===========================================================================
    # Set Visibility / Disable Controls
    #===========================================================================

    $WPFlabel_Impersonatelbl.Visibility = 'Visible'
    $WPFbutton_CancelCopy.Visibility = 'Visible'
    $WPFbutton_CancelCopy.IsEnabled = $True
    $WPFlistBox_SourceDeployments.IsEnabled = $False
    $WPFlabel_SourceDeployments.IsEnabled = $False
    $WPFbutton_LoadDeploymentToMemory.IsEnabled = $False
    $WPFbutton_SourceImpersonate.IsEnabled = $False
    $WPFlistBox_SourceAccounts.IsEnabled = $False
    $WPFlabel_SourceAccountSelected.IsEnabled = $False
    $WPFlabel_SourceAccounts.IsEnabled = $False
    $WPFtabItem_TemplateDeploy.IsEnabled = $False
    
    $Form.Dispatcher.Invoke([action]{},"Render")

    write-host "Account Selected - " $WPFlistBox_SourceAccounts.SelectedItem.AccountName
    $DeploymentLabel = $WPFlistBox_SourceDeployments.SelectedValue

    $script:DeploymentID = $DeploymentLabel
    $DeploymentURL = ($CloudURI + "/deployments/edit/" + $DeploymentID )
    write-host $DeploymentURL
    $Request=Invoke-WebRequest -Uri $DeploymentURL -WebSession $Session -Method POST
    $WPFlabel_SourceAccountSelected.Content = $WPFlistBox_SourceDeployments.SelectedValue

    $SettingsTemplateId = @()
    $Script:SettingsTemplateId = ParseSettingsId $Request
 #   $WPFlabel_SourceAccountSelected.Content = ($SettingsTemplateId).ToString()
    $DeploymentLabel = $DestinationDeploymentsArray.($WPFlistBox_SourceDeployments.SelectedItem)
    write-host  $DeploymentLabel
    $WPFlabel_SourceAccountSelected.Content = $DeploymentLabel
    
    $SettingsTable = @()

    ForEach($URL in $SettingsURLs){
     #$WPFlabel_StatusUpdate.Content = "Copying settings from - " + $URL
     $Form.Dispatcher.Invoke([action]{$WPFlabel_StatusUpdate.Content = "Copying settings from - " + $URL},"Render")
     $Request = Invoke-WebRequest -Uri ($CloudURI + "/deployments/edit/" + $DeploymentID + "/" + $URL) -WebSession $Session -Method GET
     $SettingsTemp += [PSCustomObject]@(ParseMachineSettingsInput $Request $URL)
    }

    $x = 0
    ForEach ($Setting in $SettingsTemp){
        If(-not $Setting.Source) {
            $TempSource = $SettingsTable[$x-1].Source
        }
        Else {$TempSource = $SettingsTemp[$x].Source}
        $SettingsTable += [PSCustomObject]@{'Source'=$TempSource; 'MachineSettingValueId'=$Setting.MachineSettingValueId; 'Name'=$Setting.Name; 'Value'=$Setting.Value}
        $x++
    }

    #$WPFdataGrid_LiveSourceTest.ItemsSource = $SettingsTable 
    $Result = $SettingsTable | Format-Table | Out-String  
    Write-Host $Result
    $Form.Dispatcher.Invoke([action]{$WPFlabel_StatusUpdate.Content = "Deployment - " + $WPFlistBox_SourceDeployments.SelectedItem.Value + " - Successfully Loaded..."},"Render")
   $WPFbutton_CancelCopy.Visibility = 'Visible'
   $WPFlistBox_DestinationAccountsNewDeploy.ItemsSource = $AccountsArray 
   $WPFlistBox_DestinationAccountsPasteDeploy.ItemsSource = $AccountsArray 
})


Function Add-Deployment(){

    $Request = Invoke-WebRequest -Uri ($CloudURI + "/deployments/create") -WebSession $Session -Method GET
    $AddDeploymentForm = $Request.Forms[1]
    $NewMachineID = $AddDeploymentForm.Fields["MachineId"]
    Return $NewMachineID

}


$WPFbutton_CreateDeployment.Add_Click({

    If ($WPFlistBox_DestinationAccountsNewDeploy.SelectedIndex -lt 0) {
        $WPFlabel_StatusUpdate.Content = "Please select a destination account!`n"
        $Form.Dispatcher.Invoke([action]{},"Render")
    }
    ElseIf(-Not $WPFinputBox_CopyToMachineLocation.Text){
        $WPFlabel_StatusUpdate.Content = "Please enter a location name!`n"
        $Form.Dispatcher.Invoke([action]{},"Render")
    }
    ElseIf ($WPFinputBox_CopyToMachineKey.Text.Length -lt 10 -OR $WPFinputBox_CopyToMachineKey.Text.Length -gt 20){
        $WPFlabel_StatusUpdate.Content = "MachineKey must be 10 to 20 digit Alpha-Numeric machine key.`n"
        $Form.Dispatcher.Invoke([action]{},"Render")
    }
    ElseIf (-Not $WPFcomboBox_CopyToSettingsProfiles.SelectedItem.Value) {
        $WPFlabel_StatusUpdate.Content = "Please select a Settings Profile!`n"
        $Form.Dispatcher.Invoke([action]{},"Render")
    }
    Else {
        $WPFlabel_StatusUpdate.Content = $WPFinputBox_CopyToMachineKey.Content
        $Form.Dispatcher.Invoke([action]{},"Render")
        write-host "OK"
        $Script:NewMachineGUID = Add-Deployment
        Write-Host $WPFcomboBox_CopyToSettingsProfiles.SelectedItem.Value
        Write-Host $NewMachineGUID
    }
})


$WPFbutton_Tester.Add_Click({

    write-host "Account Selected - " $WPFlistBox_SourceAccounts.SelectedItem.AccountName
    write-host "Deployment Selected - " $WPFlistBox_SourceDeployments.SelectedItem.Value


})

Function Clear-LiveSources($LiveSourceID, $DeploymentGUID){
# To be used for destination copies...   Delete all live sources for a given machine key.
$LSURL = ($CloudURI + "/deployments/edit/" + $DeploymentGUID + "/livesources")
$DeleteLiveSourceBody = @{}
$DeleteLiveSourceBody.Add("deleteCaptureDeviceId", $LiveSourceID)
$DeleteLiveSourceBody.Add("__RequestVerificationToken",($LiveSourceRequest.InputFields | ?{$_.name -eq '__RequestVerificationToken'}).value[1])
$DeleteLiveSourceHeaders = @{}
$DeleteLiveSourceHeaders.Add("Accept", "text/html, application/xhtml+xml, image/jxr, */*")
$DeleteLiveSourceHeaders.Add("Accept-Encoding","gzip, deflate")
$DeleteLiveSourceHeaders.Add("Accept-Language","en-US,en;q=0.5")
$DeleteLiveSourceHeaders.Add("Referer", $LSURL)
$Result = Invoke-WebRequest -Uri $LSURL -WebSession $Session -Body $DeleteLiveSourceBody -Header $DeleteLiveSourceHeaders -Method POST
$Result.StatusCode
}

$WPFbutton_DeleteLiveSources.Add_Click({

    $LiveSourceArray = Get-LSTable -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
    $LiveSourceList = @($LiveSourceArray | Select-Object FriendlyName, DeviceName, VideoDeviceIndex, AudioDeviceIndex, IsInteractive, IsPrivate)
    write-host $LiveSourceList
    write-host $LiveSourceArray
    ForEach($Device in $LiveSourceArray)
    {
        If($Device.LiveSourceID){
        $DelLiveSourceStatus = Clear-LiveSources -LiveSourceID $Device.LiveSourceID -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
        Write-Host $DelLiveSourceStatus
        }
    }
    #$WPFdataGrid_LiveSourceTest.ItemsSource  = $LiveSourceList
})

$WPFbutton_CopyLiveSources.Add_Click({
    $Script:SourceLiveSourceArray = Get-LSTable -DeploymentGUID $WPFlistBox_SourceDeployments.SelectedItem.Key
})


$WPFbutton_PasteLiveSources.Add_Click({

    $WPFlistBox_DestinationDeployments.SelectedItem.Key

    $DestinationLiveSourceHeaders = @{}
    $DestinationLiveSourceHeaders.Add("Accept", "text/html, application/xhtml+xml, image/jxr, */*")
    $DestinationLiveSourceHeaders.Add("Accept-Encoding","gzip, deflate")
    $DestinationLiveSourceHeaders.Add("Accept-Language","en-US,en;q=0.5")
    $DestinationLiveSourceHeaders.Add("Referer", $CloudURI + "/deployments/edit/" + $WPFlistBox_DestinationDeployments.SelectedItem.Key + "/livesources")

    ForEach ($LiveSource in $SourceLiveSourceArray){
        Write-Host $LiveSource.FriendlyName
        If($LiveSource.FriendlyName){
        $DestinationLiveSourceBody = @{}
        #$DestinationLiveSourceBody.Add("__RequestVerificationToken",($LiveSourceRequest.InputFields | ?{$_.name -eq '__RequestVerificationToken'}).value[1])
        $DestinationLiveSourceBody.Add("IsNew", "true")
        $DestinationLiveSourceBody.Add("CaptureDeviceId", "")
        $DestinationLiveSourceBody.Add("MachineId", $WPFlistBox_DestinationDeployments.SelectedItem.Key)
        $DestinationLiveSourceBody.Add("FriendlyName", $LiveSource.FriendlyName)
        $DestinationLiveSourceBody.Add("VideoDeviceIndex", $LiveSource.VideoDeviceIndex)
        $DestinationLiveSourceBody.Add("DeviceName", $LiveSource.DeviceName)
        $DestinationLiveSourceBody.Add("AudioDeviceIndex", $LiveSource.AudioDeviceIndex)
        $DestinationLiveSourceBody.Add("Fps", $LiveSource.Fps)
        $DestinationLiveSourceBody.Add("Width", $LiveSource.Width)
        $DestinationLiveSourceBody.Add("Height", $LiveSource.Height)
        $DestinationLiveSourceBody.Add("ShowFriendlyName", $LiveSource.ShowFriendlyName)
        $DestinationLiveSourceBody.Add("ShowVolumeControl", $LiveSource.ShowVolumeControl)
        $DestinationLiveSourceBody.Add("IsInteractive", $LiveSource.IsInteractive)
        $DestinationLiveSourceBody.Add("IsPrivate", $LiveSource.IsPrivate)
        $DestinationLiveSourceBody.Add("Tag", $LiveSource.Tag)
        $DestinationLiveSourceBody.Add("StreamingConsumerBufferSizeSeconds", $LiveSource.StreamingConsumerBufferSizeSeconds)
        $DestinationLiveSourceBody.Add("StreamingBitrateMbs", $LiveSource.StreamingBitrateMbs)
        $DestinationLiveSourceBody.Add("StreamingFps", $LiveSource.StreamingFps)
        Invoke-WebRequest -Uri ($CloudURI + "/livesources/" + $WPFlistBox_DestinationDeployments.SelectedItem.Key + "/edit") -WebSession $Session -Header $DestinationLiveSourceHeaders -Body $DestinationLiveSourceBody -Method POST
       }
    }

})


$WPFbutton_PasteHexMenus.Add_Click({

    $Result2 = $SourceHexMenuList | Select-Object menuItemId, parentId, name, mainMenuActionId, isMenu, menuLevel | Format-Table | Out-String 
    Write-Host "script source hex `n"
    Write-Host $Result2 

    $WPFlistBox_DestinationDeployments.SelectedItem.Key
    $DestinationHexMenuHeaders = @{}
    $DestinationHexMenuHeaders.Add("Accept", "text/html, application/xhtml+xml, image/jxr, */*")
    $DestinationHexMenuHeaders.Add("Accept-Encoding","gzip, deflate")
    $DestinationHexMenuHeaders.Add("Accept-Language","en-US,en;q=0.5")
    $DestinationHexMenuHeaders.Add("Referer", $CloudURI + "/deployments/edit/" + $WPFlistBox_DestinationDeployments.SelectedItem.Key + "/toplevelmenu")

    #######################################################
    # Create Base Hex Menu Items
    #######################################################

    $WPFlabel_StatusUpdate.Content = "Creating Base Hex Menu On: " + $WPFlistBox_SourceDeployments.SelectedItem.Value + "`n"
    $Form.Dispatcher.Invoke([action]{},"Render")

    ForEach ($SourceHexMenu in $SourceHexMenuList)
    {
        Write-Host "First ForEach - " $SourceHexMenu.Name
        If(-NOT $SourceHexMenu.parentId)
        {
            $DestinationHexMenuBody = @{}
            $DestinationHexMenuBody.Add("MainMenuItemId", "00000000-0000-0000-0000-000000000000")
            $DestinationHexMenuBody.Add("MachineId", $WPFlistBox_DestinationDeployments.SelectedItem.Key)
            $DestinationHexMenuBody.Add("ParentMenuItemId", "00000000-0000-0000-0000-000000000000")
            $DestinationHexMenuBody.Add("PositionIndex", $SourceHexMenu.HexMenuPosition)
            $DestinationHexMenuBody.Add("Name", $SourceHexMenu.Name)
            $DestinationHexMenuBody.Add("MainMenuActionId", $SourceHexMenu.mainMenuActionId)
            $DestinationHexMenuBody.Add("Param", $SourceHexMenu.param)
            $DestinationHexMenuBody.Add("BrushId", $SourceHexMenu.BrushId)
            Invoke-WebRequest -Uri ($CloudURI + "/deployments/edit/" + $WPFlistBox_DestinationDeployments.SelectedItem.Key + "/toplevelmenu") -WebSession $Session -Header $DestinationHexMenuHeaders -Body $DestinationHexMenuBody -Method POST
        }
    }

    #######################################################
    # Populate newly built Hex Menus into new table
    #######################################################

    $DestinationHexMenuArray = Get-HexMenuTable -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
    $Script:DestinationHexMenuList =@()
    $Script:DestinationHexMenuList = @($DestinationHexMenuArray | Where-Object {$_."isNew" -eq 'false'} | Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "param", "isNew", "isMenu", "menuLevel", "sourceMenuItemId", "sourceParentId")

    #######################################################
    # Match Source Hex to Destination Hex in table
    #######################################################

    ForEach ($DestHexMenu in $DestinationHexMenuList){
        :outer
        ForEach ($SourceHexMenu in $SourceHexMenuList){
            If($SourceHexMenu.name -eq $DestHexMenu.name -AND $SourceHexMenu.HexMenuPosition -eq $DestHexMenu.HexMenuPosition -AND $SourceHexMenu.mainMenuActionId -eq $DestHexMenu.mainMenuActionId){
                $DestHexMenu.sourceMenuItemId = $SourceHexMenu.menuItemId
                $DestHexMenu.sourceParentId = $SourceHexMenu.parentId
                $DestHexMenu.menuLevel = $SourceHexMenu.menuLevel
                Write-Host $DestHexMenu
                break :outer
            #    $DestHexMenu.sourceParentId = $SourceHexMenu.parentId
            }
        }
    }

    $HexMenuCountMeasurement = ($SourceHexMenuList.menuLevel | Measure-Object -Maximum).maximum
    [int]$HexMenuLevelCount = [convert]::ToInt32($HexMenuCountMeasurement, 10)
    $HexMenuBaseCount = 1

    Do{

        $WPFlabel_StatusUpdate.Content = "Creating Hex Menu Level " + $HexMenuBaseCount + " On: " + $WPFlistBox_SourceDeployments.SelectedItem.Value + "`n"
        $Form.Dispatcher.Invoke([action]{},"Render")

        #######################################################
        # Create remaining levels of Hex Menus
        #######################################################

        $Result = $DestinationHexMenuList | Select-Object menuItemId, parentId, name, mainMenuActionId, isMenu, menuLevel, sourceMenuItemId, sourceParentId | Format-Table | Out-String 
        Write-Host $Result 

        ForEach ($SourceHexMenu in $SourceHexMenuList)
        {
            ForEach ($DestHexMenu in $DestinationHexMenuList | Where-Object { $_.menuLevel -eq $HexMenuBaseCount }){
                If($SourceHexMenu.parentId -eq $DestHexMenu.sourceMenuItemId)
                {
                    $DestinationHexMenuBody = @{}
                    #$DestinationHexMenuBody.Add("__RequestVerificationToken",($HexMenuRequest.InputFields | ?{$_.name -eq '__RequestVerificationToken'}).value[1])
                    $DestinationHexMenuBody.Add("MainMenuItemId", "00000000-0000-0000-0000-000000000000")
                    $DestinationHexMenuBody.Add("MachineId", $WPFlistBox_DestinationDeployments.SelectedItem.Key)
                    $DestinationHexMenuBody.Add("ParentMenuItemId", $DestHexMenu.menuItemId)
                    $DestinationHexMenuBody.Add("PositionIndex", $SourceHexMenu.HexMenuPosition)
                    $DestinationHexMenuBody.Add("Name", $SourceHexMenu.Name)
                    $DestinationHexMenuBody.Add("MainMenuActionId", $SourceHexMenu.mainMenuActionId)
                    $DestinationHexMenuBody.Add("Param", $SourceHexMenu.param)
                    $DestinationHexMenuBody.Add("BrushId", $SourceHexMenu.BrushId)
                    Invoke-WebRequest -Uri ($CloudURI + "/deployments/edit/" + $WPFlistBox_DestinationDeployments.SelectedItem.Key + "/toplevelmenu") -WebSession $Session -Header $DestinationHexMenuHeaders -Body $DestinationHexMenuBody -Method POST
                }
            }
        }

        ##########################################################
        # Re-Populate Destination Hex Menus into new table
        ##########################################################

        $DestinationHexMenuArray = $Null
        $DestinationHexMenuArray = Get-HexMenuTable -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
        $Script:DestinationHexMenuList = $Null
        $Script:DestinationHexMenuList = @()
        $Script:DestinationHexMenuList = @($DestinationHexMenuArray | Where-Object {$_."isNew" -eq 'false'} | Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "param", "isNew", "isMenu", "menuLevel", "sourceMenuItemId", "sourceParentId")

        #########################################################
        # Re-Match Source Hex to Destination Hex in table
        #########################################################

        ForEach ($DestHexMenu in $DestinationHexMenuList){
            :outer
            ForEach ($SourceHexMenu in $SourceHexMenuList){
                If($SourceHexMenu.name -eq $DestHexMenu.name -AND $SourceHexMenu.HexMenuPosition -eq $DestHexMenu.HexMenuPosition -AND $SourceHexMenu.mainMenuActionId -eq $DestHexMenu.mainMenuActionId){
                    $DestHexMenu.sourceMenuItemId = $SourceHexMenu.menuItemId
                    $DestHexMenu.sourceParentId = $SourceHexMenu.parentId
                    $DestHexMenu.menuLevel = $SourceHexMenu.menuLevel
                    break :outer
                #    $DestHexMenu.sourceParentId = $SourceHexMenu.parentId
                }
            }
        }
        $HexMenuLevelCount--
        $HexMenuBaseCount++
    }
    Until ($HexMenuLevelCount -eq 0)

        $Result = $DestinationHexMenuList | Select-Object menuItemId, parentId, name, mainMenuActionId, isMenu, menuLevel, sourceMenuItemId, sourceParentId | Format-Table | Out-String 
        Write-Host $Result 

})

Function Copy-HexMenu-Table()
{


}


$WPFbutton_CopyHexMenus.Add_Click{

    $SourceHexMenuArray = Get-HexMenuTable -DeploymentGUID $WPFlistBox_SourceDeployments.SelectedItem.Key

    $WPFlabel_StatusUpdate.Content = "Copying Hex Menus From: " + $WPFlistBox_SourceDeployments.SelectedItem.Value + "`n"
    $Form.Dispatcher.Invoke([action]{},"Render")

    $script:SourceHexMenuList=@()
    $script:SourceHexMenuList=@($SourceHexMenuArray | Where-Object {$_."isNew" -eq 'false'} | Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "param", "isNew", "isMenu", "menuLevel")

    $SourceHexMenuListCount = $SourceHexMenuList.Count

#All Menus
    ForEach($HexMenu in $SourceHexMenuList){
        If($HexMenu.mainMenuActionId -eq "768744f5-e702-4d41-852a-353dde28c0b4")
        {
            $HexMenu.isMenu = $True
            $HexMenu.menuLevel = 1
            $SourceHexMenuListCount--
        }
    }

    $MenuLevelCounter = 1

    Do {

        ForEach($HexMenu in $SourceHexMenuList | Where-Object {$_.isMenu -eq $True -AND $_.menuLevel -eq ($MenuLevelCounter)}){
            :outer
            ForEach($SubHexMenu in $SourceHexMenuList | Where-Object {$_.isMenu -eq $True -AND $_.menuLevel -ne $MenuLevelCounter - 1}){
                If($HexMenu.parentId -eq $SubHexMenu.menuItemId){
                $HexMenu.menuLevel++
                Break :outer
                }
            }
        }
        $MenuLevelCounter++
        $SourceHexMenuListCount--
    }
    Until ($SourceHexMenuListCount -eq 0)

    $Result = $SourceHexMenuList | Select-Object menuItemId, parentId, name, mainMenuActionId, isMenu, menuLevel | Format-Table | Out-String 
    Write-Host "Copy Source Hex's `n"
    Write-Host $Result


}

Function Clear-HexMenus($HexMenuID, $DeploymentGUID){
    # To be used for destination copies...   Delete all live sources for a given machine key.
    $HMURL = ($CloudURI + "/toplevelmenuitem/" + $HexMenuID + "/delete")
    $DeleteHexMenuBody = @{}
    $DeleteHexMenuBody.Add("SettingProfileValueId", $HexMenuID)
    $DeleteHexMenuBody.Add("__RequestVerificationToken",($HexMenuRequest.InputFields | ?{$_.name -eq '__RequestVerificationToken'}).value[1])
    $DeleteHexMenuHeaders = @{}
    $DeleteHexMenuHeaders.Add("Accept", "text/html, application/xhtml+xml, image/jxr, */*")
    $DeleteHexMenuHeaders.Add("Accept-Encoding","gzip, deflate")
    $DeleteHexMenuHeaders.Add("Accept-Language","en-US,en;q=0.5")
    $DeleteHexMenuHeaders.Add("Referer", $CloudURI + "/deployments/edit/" + $DeploymentGUID + "/toplevelmenu")
    $Result = Invoke-WebRequest -Uri $HMURL -WebSession $Session -Body $DeleteHexMenuBody -Header $DeleteHexMenuHeaders -Method POST
    $Result.StatusCode
}

$WPFbutton_DeleteHexMenus.Add_Click({

        $DestinationHexMenuArray = Get-HexMenuTable -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
        $DestinationHexMenuList = @($DestinationHexMenuArray | Where-Object {$_."isNew" -eq 'false'} | Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "param", "isNew" )
        write-host $DestinationHexMenuList
        Do {
            $WPFlabel_StatusUpdate.Content = "Deleting Hex Menu Level " + $DestinationHexMenuList + " From: " + $WPFlistBox_DestinationDeployments.SelectedItem.Value + "`n"
            $Form.Dispatcher.Invoke([action]{},"Render")
            ForEach($Menu in $DestinationHexMenuList)
            {
                If($Menu.menuItemId)
                {
                    If($Menu.parentId)
                    {
                    $DelHexMenuStatus = Clear-HexMenus -HexMenuID $Menu.menuItemId -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
                    Write-Host $DelHexMenuStatus
                    }
                }
            }
            ForEach($Menu in $DestinationHexMenuList)
            {
                If($Menu.menuItemId)
                {
                    If(-NOT $Menu.parentId)
                    {
                    $DelHexMenuStatus = Clear-HexMenus -HexMenuID $Menu.menuItemId -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
                    Write-Host $DelHexMenuStatus
                    }
                }
            }
            $DestinationHexMenuArray = Get-HexMenuTable -DeploymentGUID $WPFlistBox_DestinationDeployments.SelectedItem.Key
            $DestinationHexMenuList = @($DestinationHexMenuArray | Where-Object {$_."isNew" -eq 'false'} | Select-Object "menuItemId", "parentId", "machineId", "HexMenuPosition", "name", "mainMenuActionId", "brushId", "param", "isNew" )
        }
    Until ($DestinationHexMenuList.count -eq 0)
})

#$vmpicklistView.items.Add([pscustomobject]@{'VMName'=($_).Name;Status=$_.Status;Other="Yes"})
 
#===========================================================================
# Shows the form
#===========================================================================
write-host "To show the form, run the following" -ForegroundColor Cyan
$Script:Form.ShowDialog() | out-null