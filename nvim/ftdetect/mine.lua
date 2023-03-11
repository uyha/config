vim.filetype.add({
  extension = {
    service = "systemd",
    target = "systemd",
    path = "systemd",
    mount = "systemd",
    timer = "systemd",

    ---@param path string
    ---@return string | nil
    jinja = function(path)
      local _, _, captured = path:find("%.(.*).jinja")

      if captured == "hpp" then return "cpp" end

      return captured
    end,

    zsh = "bash",
  },
  pattern = {
    [".*/include/.*.inc"] = "bitbake",
  },
})
