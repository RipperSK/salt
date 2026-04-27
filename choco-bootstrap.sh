#!/bin/bash
set -eEo pipefail

win_host="$1"

salt $1 -G 'os:Windows' cmd.run "Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" shell=powershell
