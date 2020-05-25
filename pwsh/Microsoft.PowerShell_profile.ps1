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

# Conda
(& "D:\Programming\Miniconda\3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression

# Use Starship as prompt
Invoke-Expression (&starship init powershell)
