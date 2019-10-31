function DownloadFile
{
    

    
    $url = "https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe"
    $dest = "$env:USERPROFILE\SetupTmp\"
    $start_time = Get-Date
    if(![System.IO.File]::Exists($dest)){
    # file with path $path doesn't exist
        [System.IO.Directory]::CreateDirectory($dest)

    }

    Import-Module BitsTransfer

    #Start-BitsTransfer -Source $url -Destination $dest -Asynchronous
    #Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"


    $Job = Start-BitsTransfer -Source $url -Destination $dest -Asynchronous

    while (($Job.JobState -eq "Transferring") -or ($Job.JobState -eq "Connecting")) `
            { sleep 5;} # Poll for status, sleep for 5 seconds, or perform an action.

    Switch($Job.JobState)
    {
        "Transferred" {Complete-BitsTransfer -BitsJob $Job}
        "Error" {$Job | Format-List } # List the errors.
        default {"Other action"} #  Perform corrective action.
    }

}


function AddToPath
{
    param($s)
    [Environment]::SetEnvironmentVariable("Path", $env:Path + ";$s", "Machine")
    Write-Host("$s Added to Environmental Path")
}

function Test-Administrator  
{  
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)  
}


Function Test-IsGitInstalled
{
    $32BitPrograms = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*
    $64BitPrograms = Get-ItemProperty     HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*
    $programsWithGitInName = ($32BitPrograms + $64BitPrograms) | Where-Object { $null -ne $_.DisplayName -and $_.Displayname.Contains('Git') }
    $isGitInstalled = $null -ne $programsWithGitInName
    return $isGitInstalled
}


function CheckChocolatlyInstalled
{
    try{
        choco config get cacheLocation
    }catch{
        Write-Output "Chocolatey not detected, trying to install now"
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
}

function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}