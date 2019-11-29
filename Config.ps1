. .\Utilities.ps1
$ConfigArray = 
        (
            'Default Config - Disable UAC, Replace Powershell, Enable Remote Desktop Disable Cortana & Disable Telemetry',
            $function:DefaultConfig
        ),
        (
            'Disable UAC',
            $function:DisableUAC
        ),
        (
            'Replace Powershell With CMD',
            $function:ReplacePowerShellWithCMD
        ),
        (
            'Increase Wallpaper Quality',
            $function:IncreaseWallpaperQuality
        ),
        (
            'Disable Cortna',
            $function:DisableCortana
        ),
        (
            'Disable Telemetry',
            $function:DisableTelemetry
        ),
        (
            'Disable Windows 10 Adds',
            $function:DisableAdds
        ),
        (
            'Disable Live Tiles',
            $fumction:DisableLiveTiles
        ),
        (
            'Increase Taskbar Transparency',
            $function:IncreaseTransprancy
        ),
        (
            'Enable Auto Complete',
            $function:EnableAutoComplete
        ),
        (
            'Enable Remote Desktop',
            $function:EnableRemoteDesktop
        )

function DisableUAC
{
    UpdateRegistry -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name EnableLUA -Value 0 
}

function ReplacePowerShellWithCMD
{
    UpdateRegistry -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name DontUsePowerShellOnWinX -Value 1
}

function IncreaseWallpaperQuality
{
    UpdateRegistry -Path "HKCU:\Control Panel\Desktop\" -Name "JPEGImportQuality" -Value 100
}

function DisableCortana
{
    UpdateRegistry -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search\" -Name "AllowCortana" -Value 0
}

function DisableTelemetry
{
    UpdateRegistry -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name AllowTelemetry -Value 0
    Set-Service DiagTrack -StartupType Disabled
}

function DisableAdds
{
    UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SilentInstalledAppsEnabled -Value 00000000
    UpdateRegistry -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name ShowSyncProviderNotifications  -Value 0
    UpdateRegistry -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SoftLandingEnabled  -Value 0
    UpdateRegistry -Path "HKCU:\SOFTWARE\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SubscribedContent-310093Enabled  -Value 0
    UpdateRegistry -Path "HKCU:\SOFTWARE\SOFTWARE\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SubscribedContent-338393Enabled  -Value 0
    UpdateRegistry -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name AllowOnlineTips  -Value 0
    UpdateRegistry -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name SystemPaneSuggestionsEnabled  -Value 0
}

function DisableLiveTiles
{
    UpdateRegistry -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" -Name NoTileApplicationNotification -Value 1
}

function IncreaseTransprancy
{
    UpdateRegistry -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name UseOLEDTaskbarTransparency -Value 1
}

function EnableAutoComplete
{
    UpdateRegistry -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\AutoComplete]" -Name "Append Completion" -Value "yes"
}

function EnableRemoteDesktop
{
    (Get-WmiObject Win32_TerminalServiceSetting -Namespace root\cimv2\TerminalServices).SetAllowTsConnections(1,1) | Out-Null
    (Get-WmiObject -Class "Win32_TSGeneralSetting" -Namespace root\cimv2\TerminalServices -Filter "TerminalName='RDP-tcp'").SetUserAuthenticationRequired(0) | Out-Null
    Get-NetFirewallRule -DisplayName "Remote Desktop*" | Set-NetFirewallRule -enabled true
}

function DefaultConfig
{
    & DisableUAC
    & ReplacePowerShellWithCMD
    & EnableRemoteDesktop
    & DisableCortana
    & DisableTelemetry

}

function SetIndividualSettings
{
    Write-Host("")
    Write-Host("===== Select Setting To Configure ======")

    $i = 0
    $SortedAppArray = $ConfigArray | Sort-Object
    # $SortedAppArray = $ConfigArray | Sort-Object @{Expression={$_[0]}; Ascending=$True}

    foreach($a in $SortedAppArray)
    {
        
        Write-Host("{0}:{2} {1}" -f $i, $a[0], ('',' ')[$i -le 9])
        $i++
    }
    Write-Host("")

    [int]$i = Read-Host
    if($i -le [int]$ConfigArray.Length)
    {
        Write-Host("Configuring Setting: {0}" -f $SortedAppArray[0])
        try {
            & $SortedAppArray[$i][1]
        }
        catch {
            Write-Host("Error Configuring Setting: {0}" -f $SortedAppArray[0])
        }
    }else
    {
        Write-Host("Selected an settiing from the list thickshit")
    }

    Write-Host("Finished Setting Individual Settings")
    ShowMainOptions
}



function SetupAndConfig
{
    # foreach($c in $ConfigArray)
    # {
    #     Write-Host("Setting Config: {0}" -f $c)
    #     try
    #     {
    #         if(!(& $c[1]))
    #         {
    #             Write-Host("Error Setting Config: {0}" -f $c[0])
    #         }
    #     }catch
    #     {
    #         Write-Host("Error Setting Config: {0}" -f $c[0])
    #     }
    # }
    Write-Host("Need to add default setttings setting")
    ShowMainOptions
}