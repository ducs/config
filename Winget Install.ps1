$url = "https://api.github.com/repos/microsoft/winget-cli/releases/latest"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$j = Invoke-WebRequest $url | ConvertFrom-Json

$url = $j.assets.browser_download_url

$outfile = "$env:TEMP\winget.appxbundle"

Invoke-WebRequest -Uri $url -OutFile $outfile

Add-AppxPackage -Path $outfile