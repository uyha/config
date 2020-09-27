# Environment Variables
$config = "D:\Config"
$local = "D:\Local"

# Alias
Set-Alias lua lua53
Set-Alias vim nvim
Set-Alias ex explorer

# Fu D:
function d {
  sl D:\
}

# Use Starship as prompt
Invoke-Expression (&starship init powershell)

# Use python's venv
$base_location=Get-Content $config\poetry\location
$Env:VIRTUAL_ENV_DISABLE_PROMPT=$true
Invoke-Expression ("$base_location\Scripts\Activate.ps1")
Remove-Variable base_location
