# Environment Variables
$config = "D:\Config"
$local = "D:\Local"

# Alias
Set-Alias vim nvim
Set-Alias ex explorer

# Fu D:
function d {
  sl D:\
}

# Use Starship as prompt
Invoke-Expression (&starship init powershell)

# Use Poetry environment
$env:VIRTUAL_ENV_DISABLE_PROMPT=$FALSE
Push-Location $config\poetry
& "$(poetry env info -p)\Scripts\activate.ps1"
Pop-Location

