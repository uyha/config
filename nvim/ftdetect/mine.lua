vim.filetype.add {
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
      return captured
    end,
  },
}
