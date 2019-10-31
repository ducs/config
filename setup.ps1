﻿Write-Host("Checking for dependencies before starting")

#Download & Install dependencies

    if(-not [System.IO.File]::Exists("Utilities.ps1")){ curl -O  "https://raw.githubusercontent.com/jeremyhart/config/master/Utilities.ps1" }
    if(-not [System.IO.File]::Exists("Install.ps1")){ curl -O  "https://raw.githubusercontent.com/jeremyhart/config/master/Install.ps1" }
    if(-not [System.IO.File]::Exists("Config.ps1")){ curl -O  "https://raw.githubusercontent.com/jeremyhart/config/master/Config.ps1" }

    try {
      
      . (".\Utilities.ps1")
      . (".\Install.ps1")
      . (".\Config.ps1")

    }
    catch {
      Write-Host("Error loading dependencies")
    }
    
    CheckChocolatlyInstalled

    function ShowMainOptions
    {
      Write-Host("======== SELECT OPTIONS ========")
    Write-Host("")

      foreach($l in $SetupOptions)
      {
        Write-Host("{0}: {1} - {2}" -f $l)
      }
      
      Write-Host("")
      Write-Host("Enter Choice:")
      switch (Read-Host)
      {
        0 {InstallApps($Levels[0])}
        1 {InstallApps($Levels[1])}
        2 {InstallApps($Levels[2])}
        3 {InstallApps($Levels[3])}
        4 {SetupAndConfig}
        5 {IndividualInstall}
        6 {InstallFonts}
        'x' {exit}
        default 
        { 
            Write-Host("You must select an option")
          
        }
      }
    }

    ShowMainOptions