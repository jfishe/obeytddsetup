# Run from Anaconda Prompt (root environment)
# Create a Start Menu shortcut for Anaconda Prompt - tdd.
$AppLocation = "$env:windir\System32\cmd.exe"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Anaconda3 (64-bit)\Anaconda Prompt - tdd2.lnk")
$Shortcut.TargetPath = $AppLocation
$Shortcut.Arguments = """/K"" $env:CONDA_PREFIX\Scripts\activate.bat $env:CONDA_PREFIX\envs\tdd"
# $Shortcut.IconLocation = "hotplug.dll,0"
$Shortcut.Description ="Obey the Testing Goat: Activate Anaconda Prompt - tdd, git-bash, geckoserver and Kindle"
$Shortcut.WorkingDirectory = (Get-Item -Path ".\" -Verbose).FullName + "\superlists"
$Shortcut.Save()

# Create folder to store activate.d scripts and copy scripts.
$WorkingDirectory = "$env:CONDA_PREFIX\envs\tdd\etc\conda\activate.d"
New-Item -path "$WorkingDirectory" -type directory
Copy-Item ".\conda\gitbash.bat" "$WorkingDirectory"

# Download Geckodriver and copy executable to Scripts directory in tdd environment.
$GeckoVersion = "v0.19.1"
$GeckoZip = "geckodriver-" + "$GeckoVersion" + "-win64.zip"
$GeckoURL = "https://github.com/mozilla/geckodriver/releases/download/" + "$GeckoVersion" + "/" + "$GeckoZip"
$CurrentDirectory = (Get-Item -Path ".\" -Verbose).FullName
$WorkingDirectory = "$env:CONDA_PREFIX\envs\tdd\Scripts"
Set-Location -Path "$WorkingDirectory"
$client = new-object System.Net.WebClient
$client.DownloadFile("$GeckoURL", ".\$GeckoZip")
7z e  ".\$GeckoZip"
Remove-Item ".\$GeckoZip"
Set-Location -Path "$CurrentDirectory"
