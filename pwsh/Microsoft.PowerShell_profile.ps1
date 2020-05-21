# Alias
Set-Alias lua lua53
Set-Alias vim nvim

# Environment Variables
$Env:RUSTUP_HOME="D:\Programming\Rust\Rustup"
$Env:CARGO_HOME="D:\Programming\Rust\Cargo"
$Env:XDG_CONFIG_HOME="D:\Config"
$Env:XDG_DATA_HOME="D:\Local"

# Conda
(& "D:\Programming\Miniconda\3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | Invoke-Expression

# Use Starship as prompt
Invoke-Expression (&starship init powershell)
