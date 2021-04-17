# Environment Variables
$config = "D:\Config"
$local = "D:\Local"
$env:STARSHIP_CONFIG = "$config\starship\config.toml"

# Alias
Set-Alias -Name vim -Value nvim
Set-Alias -Name ex  -Value explorer

function d {
  param(
    [string]
    [Parameter(Position=0)]
    $path
  )
  Set-Location D:/$path
}

function pip {
  python -m pip $args
}


# Use Starship as prompt
Invoke-Expression (&starship init powershell)

