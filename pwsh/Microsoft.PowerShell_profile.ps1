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
Invoke-Expression ("$local\venv\base\Scripts\Activate.ps1")
