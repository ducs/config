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
        "Install Essential Fonts",
        ""
    ),
    (
        "x",
        "Quit",
        "See ya!"
    )

$AppArray =
    (
        "0",
        "Google Chrome",
        "googlechrome",
        $function:PostFunctionChrome
    ),
    (
        "1",
        "Sublime Text 3",
        "sublimetext3",
        $function:PostFunction
    ),
    (
        '1',
        'Advanced IP Scanner',
        "advanced-ip-scanner",
        $function:PostFunction
    ),
    (
        '1',
        'Spotify',
        "spotify",
        $function:PostFunction
    ),
    (
        '1',
        'Name',
        "whatsapp",
        $function:PostFunction
    ),
    (
        '1',
        'VLC Media Player',
        "vlc",
        $function:PostFunctionVLC
    ),
    (
        '3',
        'Atmel Studio',
        "atmel-studio",
        $function:PostFunction
    ),
    (
        '2',
        'Ardunio IDE',
        "arduino",
        $function:PostFunction
    ),
    (
        '1',
        'Nord VPN',
        "nordvpn",
        $function:PostFunction
    ),
    (
        '1',
        'Dashlane',
        "dashlane",
        $function:PostFunction
    ),
    (
        '1',
        'UltraSearch',
        "ultrasearh",
        $function:PostFunction
    ),
    (
        '1',
        'MySQL Workbench',
        "mysql.workbench",
        $function:PostFunction
    ),
    (
        '1',
        'TreeSize Free',
        "treesizefree",
        $function:PostFunction
    ),
    (
        '1',
        'Intel XTU',
        "intel-xtu",
        $function:PostFunction
    ),
    (
        '1',
        'ffmpeg',
        "ffmpeg",
        $function:PostFunction
    ),
    (
        '0',
        'Youtube-dl',
        "youtube-dl",
        $function:PostFunction
    ),
    (
        '1',
        'Autodesk DWG TrueView',
        "dwgtrueview",
        $function:PostFunction
    ),
    (
        '2',
        'AutoDesk Fusion 360',
        "autodesk-fusion360",
        $function:PostFunction
    ),
    (
        '3',
        'PHP Composer',
        "composer",
        $function:PostFunction
    ),
    (
        '2',
        'Visual Studio Code IDE',
        "vscode",
        $function:PostFunction
    ),
    (
        '0',
        'Quick Look',
        "quicklook",
        $function:PostFunction
    ),
    (
        '0',
        'Adobe Acrobat Reader',
        "adobereader",
        $function:PostFunction
    ),
    (
        '0',
        'Universal Extractor',
        "universal-extractor",
        $function:PostFunction
    ),
    (
        'x',
        'Putty',
        "putty.install",
        $function:PostFunction
    ),
    (
        'x',
        'Java Runtime (JRE)',
        "javaruntime",
        $function:PostFunctionJavaRunTime,
        'The Java Development Kit (JDK) version 8.0.221

        '
    ),
    (
        'x',
        'Sysinternals',
        'sysinternals',
        $function:PostFunction,
        'Sysinternals - utilities to help you manage, troubleshoot and diagnose your Windows systems and applications'
    ),
    (
        'x',
        'CCleaner',
        'ccleaner',
        $function:PostFunction,
        'The number-one tool for cleaning your Windows PC.

        '
    ),
    (
        'x',
        'FileZilla',
        'filezilla',
        $function:PostFunction,
        'FileZilla – The free FTP solution'
    ),
    (
        'x',
        'Quicktime',
        'quicktime',
        $function:PostFunction,
        'A powerful multimedia technology with a built-in media player'
    ),
    (
        'x',
        'PHP 7.3.11',
        'php',
        $function:PostFunction,
        ''
    ),
    (
        'x',
        'Python 3.8.0',
        'python',
        $function:PostFunction,
        'Python is a programming language that lets you work more quickly and integrate your systems more effectively'
    ),
    (
        'x',
        'WinSCP',
        'winscp.install',
        $function:PostFunction,
        'Open source free SFTP client, SCP client, FTPS client and FTP client'
    ),
    (
        'x',
        'K-Lite Codec Pack Full 15.2.0',
        'k-litecodecpackfull',
        $function:PostFunction,
        'K-Lite Codec Pack Full'
    ),
    (
        'x',
        'Process Explorer 16.30.0.20190928',
        ' procexp',
        $function:PostFunction,
        'Process Explorer shows you information about which handles and DLLs processes have opened or loaded.'
    ),
    (
        'x',
        'Wireshark 3.0.6',
        '',
        $function:PostFunction,
        'Wireshark is the world’s foremost and widely-used network protocol analyzer'
    ),
    (
        'x',
        'Mozilla Firefox',
        'firefox',
        $function:PostFunction,
        'Bringing together all kinds of awesomeness to make browsing better for you.'
    ),
    (
        'x',
        'Visual Studio 2019 Community',
        'visualstudio2019community',
        $function:PostFunction,
        'Free, full-featured and extensible tool for students, open-source and individual developers'
    ),
    (
        'x',
        'Office 365 Business',
        'office365business',
        $function:PostFunction,
        'Office 365 Business'
    ),
    (
        'x',
        'OpenVPN 2.4.7',
        'openvpn',
        $function:PostFunction,
        'OpenVPN is a multiplatform and open source VPN server and client solution'
    ),
    (
        'x',
        'Google Drive',
        'googledrive',
        $function:PostFunction,
        'Google Drive for Windows – Access files on your computer from anywhere'
    ),
    (
        'x',
        'Postman for Windows 7.9.0',
        'postman',
        $function:PostFunction,
        'Postman is a collaboration platform for API development'
    ),
    (
        'x',
        'MySQL',
        'mysql',
        $function:PostFunctionMySQL,
        "MySQL Community Server - The world's most popular open source database"
    ),
    (
        'x',
        'Dell Command Update',
        'dellcommandupdate',
        $function:PostFunction,
        'Dell utility that allows you to automate driver, BIOS and firmware updates on your system'
    ),
    (
        '0',
        'Windows Terminal',
        'microsoft-windows-terminal',
        $function:PostFunction,
        'Windows Terminal is a new, modern, feature-rich, productive terminal application for command-line users'
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
        Write-Host("{0}: {1} - {2}" -f $i, $a[2], $a[1])
        $i++
    }

    [int]$i = Read-Host
    if($i -le [int]$AppArray.Length)
    {
        InstallApp($SortedAppArray[$i])
    }else
    {
        Write-Host("Selected an App fromt he list thickshit")
    }
    Write-Host("Finished Installing {0}" -f $SortedAppArray[$i][1])
    ShowMainOptions
}

$dismAppList = ""

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