Function IIf($If, $Right, $Wrong) {If ($If) {$Right} Else {$Wrong}}
# function DownloadFile
# {
#     $url = "https://github.com/git-for-windows/git/releases/download/v2.23.0.windows.1/Git-2.23.0-64-bit.exe"
#     $dest = "$env:USERPROFILE\SetupTmp\"
#     $start_time = Get-Date
#     if(![System.IO.File]::Exists($dest)){
#     # file with path $path doesn't exist
#         [System.IO.Directory]::CreateDirectory($dest)

#     }

#     Import-Module BitsTransfer

#     #Start-BitsTransfer -Source $url -Destination $dest -Asynchronous
#     #Write-Output "Time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"

#     $Job = Start-BitsTransfer -Source $url -Destination $dest -Asynchronous

#     while (($Job.JobState -eq "Transferring") -or ($Job.JobState -eq "Connecting")) `
#             { sleep 5;} # Poll for status, sleep for 5 seconds, or perform an action.

#     Switch($Job.JobState)
#     {
#         "Transferred" {Complete-BitsTransfer -BitsJob $Job}
#         "Error" {$Job | Format-List } # List the errors.
#         default {"Other action"} #  Perform corrective action.
#     }

# }


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


function Test-RegistryValue()
{
    param (
        [parameter(Mandatory=$true)]
        [string]$Path,

        [parameter(Mandatory=$false)]
        [string]$Name
    )

    $key = Get-Item -LiteralPath $Path -ErrorAction SilentlyContinue
    if($null -eq $key){return $false}
    if($null -eq $Name )
    {
        if($null -eq $key){ return $false }else{ return $true }

    }else{
        
        return $true
    }
}


function UpdateRegistry
{
    param (
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Path,
        
        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Name,

        [parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]$Value,

        [Parameter(Mandatory=$false)]
        [ValidateSet('String','ExpandString','Binary','DWord','MultiString','Qword','Unknown')]
        [string[]]$PropertyType
    )


    if(Test-RegistryValue -Path $Path -Name $Name){
        Set-ItemProperty -Path $Path -Name $Name  -Value $Value 
        return Test-RegistryValue -Path $Path -Name $Name
    }else
    {
        if(Test-RegistryValue -Path $Path){
            New-ItemProperty -Path $Path -Name $Name -Value $Value 
        }else{
            New-Item -Path $Path
            New-ItemProperty -Path $Path -Name $Name -Value $Value 
            return Test-RegistryValue -Path $Path -Name $Name
        }

    }


}