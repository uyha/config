# Environment Variables
$config="D:\Config"
$local="D:\Local"
$Env:XDG_CONFIG_HOME=$config
$Env:XDG_DATA_HOME=$local
$Env:RUSTUP_HOME="D:\Programming\Rust\Rustup"
$Env:CARGO_HOME="D:\Programming\Rust\Cargo"

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
