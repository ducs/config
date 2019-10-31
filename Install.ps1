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
        'Name',
        "dashlane",
        $function:PostFunction
    ),
    (
        '1',
        'Name',
        "ultrasearh",
        $function:PostFunction
    ),
    (
        '1',
        'Name',
        "mysql.workbench",
        $function:PostFunction
    ),
    (
        '1',
        'Name',
        "treesizefree",
        $function:PostFunction
    ),
    (
        '1',
        'Name',
        "intel-xtu",
        $function:PostFunction
    ),
    (
        '1',
        'Name',
        "ffmpeg",
        $function:PostFunction
    ),
    (
        '0',
        'Name',
        "youtube-dl",
        $function:PostFunction
    ),
    (
        '1',
        'Name',
        "dwgtrueview",
        $function:PostFunction
    ),
    (
        '2',
        'Name',
        "autodesk-fusion360",
        $function:PostFunction
    ),
    (
        '3',
        'Name',
        "composer",
        $function:PostFunction
    ),
    (
        '2',
        'Name',
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

       
    }




function IndividualInstall
{
    Write-Host("")
    Write-Host("===== Select Application below to Install ======")

    $i = 0

    foreach($a in $AppArray)
    {
        Write-Host("{0}: {1} - {2}" -f $i, $a[2], $a[1])
        $i++
    }

    [int]$i = Read-Host
    if($i -le [int]$AppArray.Length)
    {
        InstallApp($AppArray[$i])
    }else
    {
        Write-Host("Selected an App fromt he list thickshit")
    }
    Write-Host("Finished Invidual App Install")
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

function InstallFonts
{
    if(Test-IsGitInstalled)
    {

    }else
    {
        Write-Host("Install git first")
        exit
    }

    Write-Host("Finished Installing Fonts")
    ShowMainOptions
}