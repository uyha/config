local pkg = require("mason-core.package")
local npm = require("mason-core.managers.npm")

return pkg.new({
  name = "vscode-bitbake",
  desc = [[BitBake recipe language support]],
  homepage = "https://github.com/yoctoproject/vscode-bitbake",
  licenses = { "MIT" },
  languages = { "bitbake" },
  categories = { pkg.Cat.LSP },
  install = npm.packages({
    "language-server-bitbake",
    bin = { "language-server-bitbake" },
  }),
})
