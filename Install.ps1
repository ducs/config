$SetupOptions = 
    (
        "0",
        "Essential",
        "Google Chrome, QuickLook, Git-SCM, Essential Config etc"
    ),
    (
        "1",
        "Desktop",
        "Description"
    ),
    (
        "2",
        "Desktop",
        "Autodesk Inventor"
    ),
    (
        "3",
        "Developer",
        "Description"
    ),
    (
        "4",
        "Settings & Config Only",
        "Description"
    ),
    (
        "5",
        "Select Individual Program ",
        "Picky bugger"
    ),
    (
        "6",
        "Set Individual Settings",
        "Control Freak"
    ),
    (
        "7",
        "Install Essential Fonts",
        ""
    ),
    (
        "x",
        "Quit",
        "See ya!"
    )

  
    
    function PostFunction
    {
        # return $true
    }

    function PostFunctionChrome
    {
        AddToPath("C:\Program Files (x86)\Google\Chrome\Application\")
    }
    function PostFunctionVLC
    {
        AddToPath("C:\Program Files (x86)\VideoLAN\VLC")
    }
    function PostFunctionJavaRunTime
    {
        #Add to path
    }

    function PostFunctionMySQL
    {
        #Add to path
    }

    function InstallApp #Does the actual install stuff
    {
        param($AppObject)

        Write-Host("Installing {0}" -f $AppObject[1])
            choco install $AppObject[2] /y /r 
            
            & $AppObject[3]
    }
    function InstallApps
    {
        param($level)
        

        Write-Host("Installing & Configuring Level {0} - {1}" -f $level)

        #Get apps for this level

        $LevelApps

        foreach($a in $AppArray)
        {
            if($a[0] -le $level[0]) { $LevelApps += , $a }

            
        }

        $levelapps | foreach {Write-Host($_[2])}
        # Write-Host($LevelApps.Length)

        $LevelApps  | foreach {InstallApp($_)}

        Write-Host("Finished Installing {0} Apps" -f $SetupOptions[$level][1])
        ShowMainOptions
       
    }




function IndividualInstall
{
    Write-Host("")
    Write-Host("===== Select Application below to Install ======")

    $i = 0
    $SortedAppArray = $AppArray | Sort-Object @{Expression={$_[1]}; Ascending=$True}

    foreach($a in $SortedAppArray)
    {
        
        Write-Host("{0}:{2} {1}" -f $i, $a[1], ('',' ')[$i -le 9])
        $i++
    }
    Write-Host("x:  Return to Main Menu")
    
    $r = Read-Host

    if($r -eq "x"){ShowMainOptions}

    if($null -eq $r){
        [int]$i = $r
        if($i -le [int]$AppArray.Length)
        {
            InstallApp($SortedAppArray[$i])
        }else
        {
            Write-Host("Selected an App from the list thickshit")
        }
        Write-Host("Finished Installing {0}" -f $SortedAppArray[$i][1])
        ShowMainOptions
    }else{
        IndividualInstall
    }

    
}

function InstallWindowsFeatures
{
    foreach ($app in $appsToInstall)
    {
        Write-Host "Installing $app"
        & choco install $app /y /source windowsfeatures | Write-Output
    }
}

Function Install-Font {
    <#
        .Synopsis
        Installs one or more fonts.
        .Parameter FontPath
        The path to the font to be installed or a directory containing fonts to install.
        .Parameter Recurse
        Searches for fonts to install recursively when a path to a directory is provided.
        .Notes
        This script is derived from another entry on the ps gallery -
  https://www.powershellgallery.com/packages/PSWinGlue/0.3.3/Content/Functions%5CInstall-Font.ps1
  Due to bugs in the 1809 handling for the installation process this makes use of basic file copies
  and manually registering fonts under HKLM.
  See https://serverfault.com/questions/943895/powershell-font-deploys-for-1809
    #>

    [CmdletBinding()]
    Param(
        [Parameter(Mandatory=$true)]
        [String]$FontPath,

        [Switch]$Recurse
    )
    
    $ErrorActionPreference = 'Stop'

    if (Test-Path -Path $FontPath) {
        $FontItem = Get-Item -Path $FontPath
        if ($FontItem -is [IO.DirectoryInfo]) {
            if ($Recurse) {
                $Fonts = Get-ChildItem -Path $FontItem -Include ('*.fon','*.otf','*.ttc','*.ttf') -Recurse
            } else {
                $Fonts = Get-ChildItem -Path "$FontItem\*" -Include ('*.fon','*.otf','*.ttc','*.ttf')
            }

            if (!$Fonts) {
                throw ('Unable to locate any fonts in provided directory: {0}' -f $FontItem.FullName)
            }
        } elseif ($FontItem -is [IO.FileInfo]) {
            if ($FontItem.Extension -notin ('.fon','.otf','.ttc','.ttf')) {
                throw ('Provided file does not appear to be a valid font: {0}' -f $FontItem.FullName)
            }

            $Fonts = $FontItem
        } else {
            throw ('Expected directory or file but received: {0}' -f $FontItem.GetType().Name)
        }
    } else {
        throw ('Provided font path does not appear to be valid: {0}' -f $FontPath)
    }

    foreach ($Font in $Fonts) {
        Write-Host ('Installing font: {0}' -f $Font.BaseName)
        #$Font
        try {
            Copy $Font "C:\Windows\Fonts"
            New-ItemProperty -Name $Font.BaseName -Path "HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Fonts" -PropertyType string -Value $Font.name  | out-null
        }
        catch {
            Write-Host ('Error Installing font: {0}' -f $Font.BaseName)
        }         
    }
}

function InstallFonts
{
    Start-BitsTransfer "https://raw.githubusercontent.com/jeremyhart/config/master/resources/EssentialFonts.zip" "$env:TEMP\"

    
    Get-ChildItem "$env:TEMP\EssentialFonts.zip" | Expand-Archive -DestinationPath "$env:TEMP\EssentialFonts" -Force
    

    if([System.IO.Directory]::Exists("$env:TEMP\EssentialFonts")){
        
        Install-Font "$env:TEMP\EssentialFonts" -Recurse
        
    }else
    {
        Write-Host("Not there")
    }

    

    

    Write-Host("Finished Installing Fonts")
    ShowMainOptions
}