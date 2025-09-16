vim.filetype.add({
  extension = {
    h = "c",
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
    dcf = "eds",
  },
  pattern = {
    [".*/include/.*.inc"] = "bitbake",
    [".*/.config/git/.*"] = "gitconfig",
    ["nginx/*.conf"] = "nginx",
    ["justfile"] = "just",
    [".*/.*"] = function(_, bufnr)
      local content = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
      if vim.regex([[^#!.*uv run python]]):match_str(content) ~= nil then return "python" end
      if vim.regex([[^#!.*uv run --script]]):match_str(content) ~= nil then return "python" end
    end,
  },
})
