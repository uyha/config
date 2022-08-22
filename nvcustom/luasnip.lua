local M = {}

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

local function add_cmake_snippets()
  ls.add_snippets("cmake", {
    s(
      "project",
      fmt(
        [[
            cmake_minimum_required(VERSION {})
            project({} VERSION {} LANGUAGES {})

            list(APPEND CMAKE_MODULE_PATH "${{CMAKE_CURRENT_SOURCE_DIR}}/cmake")
            ]],
        {
          i(1, "3.21"),
          i(2, "Project Name"),
          i(3, "0.1.0"),
          i(4, "CXX"),
        }
      )
    ),
  })

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
  ls.add_snippets("json", {
    s(
      "cmake-preset",
      fmt(
        [[
            {{
              "version": {},
              "cmakeMinimumRequired": {{
                "major": {},
                "minor": {},
                "patch": {}
              }},
              "configurePresets": [],
              "buildPresets": [],
              "testPresets": []
            }}
            ]],
        {
          i(1, "3"),
          i(2, "3"),
          i(3, "21"),
          i(4, "3"),
        }
      )
    ),
    s(
      "cmake-config-preset",
      fmt(
        [[
            {{
              "name": "{}",
              "displayName": "{}",
              "description": "{}",
              "generator": "{}",
              "toolchainFile": "{}",
              "binaryDir": "{}",
              "cacheVariables": {{}},
              "environment": {{}}
            }}
            ]],
        {
          i(1, "name"),
          i(2, "Display Name"),
          i(3, "Description for this preset"),
          c(4, cmake_generators),
          i(5, "path/to/toolchain"),
          i(6, "${sourceDir}/cmake-build-${presetName}"),
        }
      )
    ),
    s(
      "cmake-build-preset",
      fmt(
        [[
            {{
              "name": "{}",
              "displayName": "{}",
              "description": "{}",
              "environment": {{}},
              "configurePreset": "{}",
              "targets": []
            }}
            ]],
        {
          i(1, "name"),
          i(2, "Display Name"),
          i(3, "Description for this preset"),
          i(4, "configureName"),
        }
      )
    ),
  })
end

local function add_cpp_snippets()
  ls.add_snippets("cpp", {
    s(
      "error-category",
      fmt(
        [[
            struct {} : std::error_category {{
              auto name() const noexcept -> char const * {{
                return "{}";
              }}
              auto messages(int error) const -> std::string {{
                switch (static_cast<{}>(error)) {{
                // default: return "Unknown error";
                }}
              }}
            }} {};
            ]],
        {
          i(1),
          i(2),
          i(3),
          lambda(snake_case(lambda._1), 1),
        }
      )
    ),
    s(
      "ros-node",
      fmt(
        [[
            class {} : public rclcpp::Node {{
            public:
              {} : Node({}) {{{}}}
            private:
            }};
            ]],
        {
          i(1, "Node"),
          rp(1),
          lambda(snake_case(lambda._1), 1),
          i(0),
        }
      )
    ),
    s(
      "ros-main",
      fmt(
        [[
            rlcpp::init(argc, argv);
            auto node = std::make_shared<{}>({});
            rclcpp::spin(node);
            rclcpp::shutdown();
            ]],
        {
          i(1),
          i(0),
        }
      )
    ),
    s(
      "header",
      fmt(
        [[
            #pragma once

            namespace {}{{{}}}
            ]],
        {
          i(1),
          i(0),
        }
      )
    ),
    s(
      "unique-resource-class",
      fmt(
        [[
            class {} {{
            public:
              {}({} const &) = delete;
              auto operator=({} const &) -> {} & = delete;

              {}({} &&other) noexcept;
              auto operator=({} &&other) noexcept -> {} &;

              ~{}() noexcept;
            private:
              {}({} {}) noexcept;

              {} m_{};
            }};
            ]],
        {
          i(1, "ResourceType"), -- class name
          rp(1),
          rp(1),
          rp(1),
          rp(1),
          rp(1),
          rp(1),
          rp(1),
          rp(1),
          rp(1),
          rp(1),
          i(2, "handle_t"),
          i(3, "handle"),
          rp(2),
          rp(3),
        }
      )
    ),
    s(
      "unique-resource-functions",
      fmt(
        [[
            {}::{}({} &&other) noexcept : m_{}{{other.m_{}}} {{
              other.m_{} = {};
            }}
            auto {}::operator=({} &&other) noexcept -> {} & {{
              this->~{}();

              m_{}       = other.m_{};
              other.m_{} = {};

              return *this;
            }}

            {}::~{}() noexcept {{
              if (m_{} == {}) {{
                return ;
              }}

              {}(m_{});
            }}
            ]],
        {
          i(1, "ResourceType"),
          rp(1),
          rp(1),
          i(2, "handle"),
          rp(2),
          rp(2),
          i(3, "uninitialized_value"),
          rp(1),
          rp(2),
          rp(1),
          rp(1),
          rp(2),
          rp(2),
          rp(2),
          rp(3),
          rp(1),
          rp(1),
          rp(2),
          rp(3),
          i(4, "destruct_function"),
          rp(2),
        }
      )
    ),
  })
end

local function add_sh_snippets()
  ls.add_snippets("sh", {
    s(
      "bash",
      fmt(
        [[
            #!/usr/bin/env bash

            set -euo pipefail

            #shellcheck disable=SC2034
            SCRIPT_DIR=$(cd "$(dirname "${{BASH_SOURCE[0]}}")" && pwd)
            ]],
        {}
      )
    ),
    s(
      "colors",
      fmt(
        [[
            black="\e[30m"
            red="\e[31m"
            green="\e[32m"
            brown="\e[33m"
            blue="\e[34m"
            purple="\e[35m"
            cyan="\e[36m"
            gray="\e[37m"

            black_bg="\e[40m"
            red_bg="\e[41m"
            green_bg="\e[42m"
            brown_bg="\e[43m"
            blue_bg="\e[44m"
            purple_bg="\e[45m"
            cyan_bg="\e[46m"
            gray_bg="\e[47m"
            reset="\e[0m"

            bold="\e[1m"
            uline="\e[4m"
            blinking="\e[5m"

            clear="\033[0K\r"
            ]],
        {}
      )
    ),
    s(
      "paint",
      fmt(
        [[
            ${{{}}}{}${{reset}}{}
            ]],
        {
          i(1, "color"),
          i(2, "var"),
          i(0),
        }
      )
    ),
    s(
      "parse",
      fmt(
        [=[
            declare -a positional_args=()

            while [[ $# -gt 0 ]]; do
              case "$1" in
              {}
              *)
                positional_args+=("$1")
                shift 1
                ;;
              esac
            done
            ]=],
        {
          i(0),
        }
      )
    ),
    s(
      "arg",
      fmt(
        [=[
            --{}|-{})
              {}="$2"
              shift 2
              ;;
            --{}=*)
              {}="${{1#--{}=}}"
              shift 1
              ;;
            -{}=*)
              {}="${{1#-{}=}}"
              shift 1
              ;;
            -{}*)
              {}="${{1#-{}}}"
              shift 1
              ;;
            ]=],
        {
          i(1, "long"),
          i(2, "short"),
          i(3, "var"),
          rp(1),
          rp(3),
          rp(1),
          rp(2),
          rp(3),
          rp(2),
          rp(2),
          rp(3),
          rp(2),
        }
      )
    ),
    s(
      "join",
      fmt(
        [[
            join() {{
              local delimiter="$1"
              local first="$2"

              if shift 2; then
                printf "%s" "$first" "${{@/#/$delimiter}}"
              fi
            }}
            ]],
        {}
      )
    ),
    s(
      "contain",
      fmt(
        [=[
            contain() {{
              declare -n array="$1"
              declare val="$2"

              for elem in "${{array[@]}}"; do
                if [[ "$elem" == "$val" ]]; then
                  return 0
                fi
              done

              return 1
            }}
            ]=],
        {}
      )
    ),
    s(
      "readconfig",
      fmt(
        [[
            read-config() {{
              while read -r line; do
                local expected_keys="$1"
                local config_file="$2"

                # shellcheck disable=SC2034
                local value="${{line#*=}}"
                local key="${{line%%=*}}"


                if contain "$expected_keys" "$key"; then
                  eval "declare -g $key=$value"
                else
                  echo >&2 "Unrecognized key: $key"
                fi
              done < "$config_file"
            }}
            ]],
        {}
      )
    ),
    s("nounused", {
      t { [=[#shellcheck disable=SC2034]=] },
    }),
    s(
      "trim",
      fmt(
        [[
            trim() {{
              perl -pe "s/^\s*(.*)\s*$/\1/" 
            }}
            ]],
        {}
      )
    ),
  })
end

local function add_systemd_snippets()
  ls.add_snippets("systemd", {
    s(
      "service",
      fmt(
        [[
            [Unit]
            Description={}
            Requires={}
            After={}

            [Service]
            Type={}
            ExecStart={}
            Restart={}

            [Install]
            WantedBy={}
            ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
          i(5),
          i(6),
          i(7, "multi-user.target"),
        }
      )
    ),
    s(
      "path",
      fmt(
        [[
            [Unit]
            Description={}

            [Path]
            PathChanged={}
            Unit={}

            [Install]
            WantedBy={}
            ]],
        {
          i(1),
          i(2),
          i(3),
          i(4, "multi-user.target"),
        }
      )
    ),
    s(
      "mount",
      fmt(
        [[
            [Unit]
            Description={}
            Requires={}
            After={}

            [Mount]
            What={}
            Where={}

            [Install]
            WantedBy={}
            ]],
        {
          i(1),
          i(2),
          i(3),
          i(4),
          i(5),
          i(6, "multi-user.target"),
        }
      )
    ),
    s(
      "timer",
      fmt(
        [[
        [Unit]
        Description={}

        [Timer]
        OnActiveSec=
        OnBootSec=
        OnStartupSec=
        OnUnitActiveSec=
        OnUnitInactiveSec=
        Unit={}

        [Install]
        WantedBy={}
        ]],
        { i(1), i(2), i(3, "multi-user.target") }
      )
    ),
  })
end

local function add_desktop_snippets()
  ls.add_snippets("desktop", {
    s(
      "desktop",
      fmt(
        [[
        [Desktop Entry]
        Type={}
        Name={}
        Exec={}
        ]],
        { i(1, "Application"), i(2, "Application Name"), i(3) }
      )
    ),
  })
end

local function add_snippets()
  add_cmake_snippets()
  add_cpp_snippets()
  add_sh_snippets()
  add_systemd_snippets()
  add_desktop_snippets()
end

M.setup = function()
  local present, luasnip = pcall(require, "luasnip")

  if not present then
    return
  end

  local options = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
  }

  luasnip.config.set_config(options)
  add_snippets()
end

return M
