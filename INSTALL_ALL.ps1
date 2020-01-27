Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

./install-basics
./install-gaming
./install-audio
./install-unity
./install-unreal-develop
./install-hwutil
./install-android