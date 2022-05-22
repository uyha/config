local M = {}

local function snake_case(str)
   str = str:gsub("::", "/")
   str = str:gsub("(%u+)(%u%l)", "%1_%2")
   str = str:gsub("(%u+)(%u%l)", "%1_%2")
   str = str:gsub("(%l)(%u)", "%1_%2")
   str = str:gsub("(%d)(%u)", "%1_%2")
   str = str:gsub("[.-]", "_")
   return str:lower()
end

local function camel_case(str)
   str = str:gsub("-", "_")

   local _start, _end = str:find "^_+"
   _start = _start or 0
   _end = _end or 0

   str = str:sub(_start, _end) .. str:sub(_end + 1):gsub("_(%l)", string.upper)
   return str
end

local function mixed_case(str)
   str = camel_case(str):gsub("^(_*%l)", string.upper)
   return str
end

local function add_snippets()
   local ls = require "luasnip"
   local s = ls.snippet
   local sn = ls.snippet_node
   local isn = ls.indent_snippet_node
   local t = ls.text_node
   local i = ls.insert_node
   local f = ls.function_node
   local c = ls.choice_node
   local d = ls.dynamic_node
   local r = ls.restore_node
   local events = require "luasnip.util.events"
   local ai = require "luasnip.nodes.absolute_indexer"
   local fmt = require("luasnip.extras.fmt").fmt
   local m = require("luasnip.extras").m
   local lambda = require("luasnip.extras").l
   local rp = require("luasnip.extras").rep

   -- stylua: ignore start
   ls.add_snippets("cmake", {
      s("project", {
         t { "cmake_minimum_required(VERSION " }, i(1, "3.21"), t { ")", "" },
         t { "project(" }, i(2, "Project Name"), t { " VERSION " }, i(3, "0.1"), t { " LANGUAGES " }, i(4, "CXX"), t { ")", "", "" },
         t { [[list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")]] },
      }),
   })
   -- stylua: ignore end

   local cmake_generators = {
      t "Unix Makefiles",
      t "Ninja",
      t "Green Hills MULTI",
      t "Ninja Multi-Config",
      t "Watcom WMake",
      t "CodeBlocks - Ninja",
      t "CodeBlocks - Unix Makefiles",
      t "CodeLite - Ninja",
      t "CodeLite - Unix Makefiles",
      t "Eclipse CDT4 - Ninja",
      t "Eclipse CDT4 - Unix Makefiles",
      t "Kate - Ninja",
      t "Kate - Unix Makefiles",
      t "Sublime Text 2 - Ninja",
      t "Sublime Text 2 - Unix Makefiles",
   }
   -- stylua: ignore start
   ls.add_snippets("json", {
      s("cmake-preset", {
         t { [=[{]=], ""},
         t { [=[  "version": ]=] }, i(1, "3"), t { ",", '' },
         t { [=[  "cmakeMinimumRequired": {]=], '' },
         t { [=[    "major": ]=] }, i(2, "3"), t { ",", '' },
         t { [=[    "minor": ]=] }, i(3, "21"), t { ",", '' },
         t { [=[    "patch": ]=] }, i(4, "0"), t { '', '' },
         t { [=[  },]=], "" },
         t { [=[  "configurePresets": [],]=], '' },
         t { [=[  "buildPresets": [],]=], ''},
         t { [=[  "testPresets": []]=], ''},
         t { [=[}]=]},
      }),
      s("cmake-config-preset", {
        t { [=[{]=], ""},
        t { [=[  "name": "]=] }, i(1, "name"), t {'",', ''},
        t { [=[  "displayName": "]=] }, i(2, "Display Name"), t {'",', ''},
        t { [=[  "description": "]=] }, i(3, "Description for this preset"), t {'",', ''},
        t { [=[  "generator": "]=] }, c(4, cmake_generators), t {'",', ''},
        t { [=[  "toolchainFile": "]=]}, i(5, "path/to/toolchain"), t {'",', ''},
        t { [=[  "binaryDir": "]=]}, i(6, "${sourceDir}/cmake-build-${presetName}"), t {'",', ''},
        t { [=[  "cacheVariables": {},]=], '' },
        t { [=[  "environment": {}]=], "" },
        t { [=[}]=]},
      }),
      s("cmake-build-preset", {
        t { [=[{]=], ''},
        t { [=[  "name": "]=] }, i(1, "name"), t {'",', ''},
        t { [=[  "displayName": "]=] }, i(2, "Display Name"), t {'",', ''},
        t { [=[  "description": "]=] }, i(3, "Description for this preset"), t {'",', ''},
        t { [=[  "environment": {},]=], '' },
        t { [=[  "configurePreset": "]=] }, i(4, "configureName"), t {'",', ''},
        t { [=[  "targets": []]=], '' },
        t { [=[}]=]},
      })
   })
   -- stylua: ignore end

   -- stylua: ignore start
   ls.add_snippets("cpp", {
     s("error-category", {
       t { [=[struct ]=]}, i(1), t { [=[ : std::error_category {]=], '' },
       t { [=[  auto name() const noexcept -> char const * {]=], '' },
       t { [=[    return "]=] }, i(2), t { '";', '' },
       t { [=[  }]=], '' },
       t { [=[  auto messages(int error) const -> std::string {]=], '' },
       t { [=[    switch (static_cast<]=]}, i(3), t { [=[>(error)) {]=], '' },
       t { [=[    // default: return "Unknown error";]=], '' },
       t { [=[    }]=], '' },
       t { [=[  }]=], '' },
       t { [=[} ]=] },  lambda(snake_case(lambda._1), 1), t ';'
     })
   })
   -- stylua: ignore end

   -- stylua: ignore start
   ls.add_snippets("sh", {
     s("bash", {
       t { [=[#!/usr/bin/env bash]=], '' },
       t { '', '' },
       t { [=[set -euo pipefail]=], '' },
       t { [=[# shellcheck disable=SC2034]=], '' },
       t { [=[SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)]=] }
     }),
     s("colors", {
       t { [=[black="\e[30m"]=], '' },
       t { [=[red="\e[31m"]=], '' },
       t { [=[green="\e[32m"]=], '' },
       t { [=[brown="\e[33m"]=], '' },
       t { [=[blue="\e[34m"]=], '' },
       t { [=[purple="\e[35m"]=], '' },
       t { [=[cyan="\e[36m"]=], '' },
       t { [=[gray="\e[37m"]=], '' },
       t { '', '' },
       t { [=[black_bg="\e[40m"]=], '' },
       t { [=[red_bg="\e[41m"]=], '' },
       t { [=[green_bg="\e[42m"]=], '' },
       t { [=[brown_bg="\e[43m"]=], '' },
       t { [=[blue_bg="\e[44m"]=], '' },
       t { [=[purple_bg="\e[45m"]=], '' },
       t { [=[cyan_bg="\e[46m"]=], '' },
       t { [=[gray_bg="\e[47m"]=], '' },
       t { [=[reset="\e[0m"]=], '' },
       t { '', '' },
       t { [=[bold="\e[1m"]=], '' },
       t { [=[uline="\e[4m"]=], '' },
       t { [=[blinking="\e[5m"]=], '' },
     }),
     s("paint", {
       t { [=[${]=] }, i(1), t'}', i(2), t'${reset}', i(0)
     }),
     s("parse", {
       t { [=[positional_args=()]=], '' },
       t { [=[while [[ $# -gt 0 ]]]=], '' },
       t { [=[do]=], '' },
       t { [=[  case "$1" in]=], '' },
       t { [=[  ]=]}, i(1), t { '', '' },
       t { [=[  *)]=], '' },
       t { [=[    positional_args+=("\$1")]=], '' },
       t { [=[    shift 1]=], '' },
       t { [=[    ;;]=], '' },
       t { [=[  esac]=], '' },
       t { [=[done]=], '' },
     }),
     s("arg", {
       t { [=[--]=] }, i(1), t '|-', i(2), t { ')', '' },
       t { [=[  ]=]}, i(3), t { '=$2', '' },
       t { [=[  shift 2]=], '' },
       t { [=[  ;;]=], '' },
       t { [=[--]=] }, rp(1), t { '=*)', '' },
       t { [=[  ]=]}, rp(3), t '="${1#--', rp(1), t { '=}"', '' },
       t { [=[  shift 1]=], '' },
       t { [=[  ;;]=], '' },
       t { [=[-]=]}, rp(2), t { '=*)', '' },
       t { [=[  ]=]}, rp(3), t '="${1#-', rp(2), t { '=}"', '' },
       t { [=[  shift 1]=], '' },
       t { [=[  ;;]=], '' },
       t { [=[-]=]}, rp(2), t { '*)', '' },
       t { [=[  ]=]}, rp(3), t '="${1#-', rp(2), t { '}"', '' },
       t { [=[  shift 1]=], '' },
       t { [=[  ;;]=], '' },
     }),
     s("join", {
       t { [=[join() {]=], '' },
       t { [=[  local delimiter=$1 first=$2]=], '' },
       t { [=[  if shift 2; then]=], '' },
       t { [=[    printf "%s" "$first" "${@/#/$delimiter}"]=], '' },
       t { [=[  fi]=], '' },
       t { [=[}]=], '' },
     }),
     s("contain", {
       t { [=[contain() {]=], '' },
       t { [=[  declare -n array=$1]=], '' },
       t { [=[  declare val=$2]=], '' },
       t { [=[  for elem in "${array[@]}"; do]=], '' },
       t { [=[    if [[ "$elem" == "$val" ]]; then]=], '' },
       t { [=[      return 0]=], '' },
       t { [=[    fi]=], '' },
       t { [=[  done]=], '' },
       t { [=[  return 1]=], '' },
       t { [=[}]=], '' },
     }),
     s("readconfig", {
       t { [=[read-config() {]=], '' },
       t { [=[  while read -r line; do]=], '' },
       t { [=[    local key="${line%%=*}"]=], '' },
       t { [=[    # shellcheck disable=SC2034]=], ''},
       t { [=[    local value="${line#*=}"]=], '' },
       t { [=[    if contain "$1" "$key"; then]=], '' },
       t { [=[      eval "declare -g \$key=\$value"]=], '' },
       t { [=[    else]=], '' },
       t { [=[      echo >&2 "Unrecognized key: \$key"]=], '' },
       t { [=[    fi]=], '' },
       t { [=[  done < "$2"]=], '' },
       t { [=[}]=], '' },
     }),
     s("nounused", {
       t { [=[#shellcheck disable=SC2034]=] }
     })
   })
   -- stylua: ignore end

   -- stylua: ignore start
   ls.add_snippets("systemd", {
     s("service", {
       t { [=[[Unit]]=], '' },
       t { [=[Description=]=] }, i(1), t { '', '' },
       t { [=[Requires=]=], '' },
       t { [=[After=]=], '' },
       t { '' , '' },
       t { [=[[Service]]=], '' },
       t { [=[Type=]=] }, i(2), t { '', '' },
       t { [=[ExecStart=]=] }, i(3), t { '', '' },
       t { [=[Restart=]=], '' },
       t { '' , '' },
       t { [=[[Install]]=], '' },
       t { [=[WantedBy=multi-user.target]=], '' },
     }),
     s("path", {
       t { [=[[Unit]]=], '' },
       t { [=[Description=]=] }, i(1), t { '', '' },
       t { '' , '' },
       t { [=[[Path]]=], '' },
       t { [=[PathChanged=]=] }, i(2), t { '', '' },
       t { [=[Unit=]=] }, i(3), t { '', '' },
       t { '' , '' },
       t { [=[[Install]]=], '' },
       t { [=[WantedBy=multi-user.target]=], '' },
     }),
     s("mount", {
       t { [=[[Unit]]=], '' },
       t { [=[Description=]=] }, i(1), t { '', '' },
       t { [=[Requires=]=], '' },
       t { [=[After=]=], '' },
       t { '' , '' },
       t { [=[[Mount]]=], '' },
       t { [=[What=]=] }, i(2), t { '', '' },
       t { [=[Where=]=] }, i(3), t { '', '' },
       t { '' , '' },
       t { [=[[Install]]=], '' },
       t { [=[WantedBy=multi-user.target]=], '' },
     })
   })
   -- stylua: ignore end
end

M.setup = function()
   require("plugins.configs.others").luasnip()
   require("luasnip.loaders.from_snipmate").load {
      paths = { "~/.config/nvcustom/snippets" },
   }
   add_snippets()
end

return M
