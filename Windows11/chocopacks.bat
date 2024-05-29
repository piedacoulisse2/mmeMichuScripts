:: Ensure C:\Chocolatey\bin is on the path
set /p PATH=<C:\Windows\Temp\PATH

:: Install all the things; for example:
cmd /c choco install git -y
cmd /c choco install python3 -y
cmd /c choco install firefox -y
cmd /c choco install thunderbird -y
cmd /c choco install notepadplusplus -y
cmd /c choco install 7zip -y
cmd /c choco install vlc -y
cmd /c choco install adobereader -y
cmd /c choco install googlechrome -y

Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'