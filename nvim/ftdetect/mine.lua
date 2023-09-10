vim.filetype.add({
  extension = {
    service = "systemd",
    target = "systemd",
    path = "systemd",
    mount = "systemd",
    timer = "systemd",

    ---@param path string
    ---@return string | nil
    ["in"] = function(path)
      local _, _, filename = path:find(".*/(.*)$")
      local _, _, captured = filename:find("(.*).in$")

      return vim.filetype.match({ filename = captured })
    end,

    ---@param path string
    ---@return string | nil
    jinja = function(path)
      local _, _, filename = path:find(".*/(.*)$")
      local _, _, captured = filename:find("%.(.*).jinja$")
      if captured == "hpp" then return "cpp" end

      return captured
    end,

    zsh = "bash",
    eds = "eds",
  },
  pattern = {
    [".*/include/.*.inc"] = "bitbake",
  },
})
