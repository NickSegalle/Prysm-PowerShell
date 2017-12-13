[Void][System.Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')  
[Void][reflection.assembly]::loadwithpartialname("System.Windows.Forms") 
[Void][System.Windows.Forms.Application]::EnableVisualStyles() 
 
#Open File Dialog 
Function Get-FileName($initialDirectory){    
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null 
    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog 
    $OpenFileDialog.initialDirectory = $initialDirectory 
    $OpenFileDialog.filter = "XML (*.xml)| *.xml" 
    $OpenFileDialog.ShowDialog() | Out-Null 
    $OpenFileDialog.filename 
}  
 
#Save File Dialog 
Function Save-FileName($initialDirectory){    
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null 
    $OpenFileDialog = New-Object System.Windows.Forms.SaveFileDialog 
    $OpenFileDialog.initialDirectory = $initialDirectory 
    $OpenFileDialog.filter = "XML (*.xml)| *.xml" 
    $OpenFileDialog.ShowDialog() | Out-Null 
    $OpenFileDialog.filename 
}  
 
#Create Form Functions 
function Create-Form { 
#    Draw Form 
    $form1 = New-Object System.Windows.Forms.Form 
    $form1.ClientSize = New-Object System.Drawing.Size(725,400) 
    $form1.Text = "XML to DataGrid Editor"  
    $form1.Name = "form1"  
    $form1.DataBindings.DefaultDataSourceUpdateMode = 0  
    $form1.FormBorderStyle = 5 
#    Draw DataGrid 
    $dataGrid1 = New-Object System.Windows.Forms.DataGrid 
    $dataGrid1.Size = New-Object System.Drawing.Size(700,338) 
    $dataGrid1.Location = New-Object System.Drawing.Point (13,13) 
    $dataGrid1.DataBindings.DefaultDataSourceUpdateMode = 0  
    $dataGrid1.HeaderForeColor = [System.Drawing.Color]::FromArgb(255,0,0,0)  
    $dataGrid1.Name = "dataGrid1"  
    $dataGrid1.DataMember = ""  
    $dataGrid1.TabIndex = 0  
    $form1.Controls.Add($dataGrid1)  
#    Draw Open xml Configuration Button 
    $button_openxml = New-Object System.Windows.Forms.Button 
    $button_openxml.Size = New-Object System.Drawing.Size(150,25) 
    $button_openxml.Location = New-Object System.Drawing.Point(13,365) 
    $button_openxml.Text = "Open XML Document" 
    $button_openxml.Add_Click({ 
        $xml_networkschema = Get-FileName 
        $xml_networkschema = 'C:\Synthesis\Synthesis.exe - Copy.xml'
#        Bind Data to DataGrid 
        $ds = New-Object System.Data.Dataset 
        $ds.ReadXml($xml_networkschema) 
       # $grid.DataSource = $ds.Tables[0].DefaultView
        #write-host $ds.configuration.appSettings.ChildNodes
       # $dataGrid1.DataSource = $ds
       $dataGrid1.DataSource = $ds.tables["appsettings"]
    }) 
    $form1.Controls.Add($button_openxml) 
#    Save xml Configuration Button 
    $button_savexml = New-Object System.Windows.Forms.Button 
    $button_savexml.Size = New-Object System.Drawing.Size(150,25) 
    $button_savexml.Location = New-Object System.Drawing.Point(170,365) 
    $button_savexml.Text = "Save XML Document" 
    $button_savexml.enabled = "false" 
    $button_savexml.Add_Click({ 
        $dbm_savenetworkschema = Save-FileName 
        $dataGrid1.DataSource.writexml($dbm_savenetworkschema) 
    }) 
    $form1.Controls.Add($button_savexml) 
    $form1.ShowDialog()| Out-Null  
} 
 
Create-Form