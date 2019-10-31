$ConfigArray = 
        (
            'Disable UAC',
            $function:DisableUAC
        ),
        (
            'Replace Powershell With CMD',
            $function:ReplacePowerShellWithCMD
        )

function DisableUAC
{
   
        Set-ItemProperty -Path REGISTRY::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System -Name ConsentPromptBehaviorAdmin -Value 0
        return $true
}

function ReplacePowerShellWithCMD
{
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name DontUsePowerShellOnWinX -Value 1 -Type DWord 
    return $false
}

function SetupAndConfig
    {
        foreach($c in $ConfigArray)
        {
            Write-Host("Setting Config: {0}" -f $c)
            try
            {
                if(!(& $c[1]))
                {
                    Write-Host("Error Setting Config: {0}" -f $c[0])
                }
            }catch
            {
                Write-Host("Error Setting Config: {0}" -f $c[0])
            }
        }
        Write-Host("Finished Settings & Config")
        ShowMainOptions
    }