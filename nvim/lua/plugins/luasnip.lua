return {
  "L3MON4D3/LuaSnip",
  keys = {
    {
      "<C-c>",
      function()
        local luasnip = require("luasnip")
        if luasnip.choice_active() then require("luasnip.extras.select_choice")() end
      end,
      mode = { "i", "s" },
      desc = "LuaSnip: Open choice for choice_node",
    },
  },
  config = function()
    local luasnip = require("luasnip")

    local options = {
      history = true,
      updateevents = "TextChanged,TextChangedI",
    }

    luasnip.config.set_config(options)

    local ls = require("luasnip")
    local c = ls.choice_node
    local d = ls.dynamic_node
    local f = ls.function_node
    local i = ls.insert_node
    local r = ls.restore_node
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local fmt = function(format, args, opts)
      opts = vim.tbl_extend("force", { repeat_duplicates = true }, opts or {})
      return require("luasnip.extras.fmt").fmt(format, args, opts)
    end
    local lambda = require("luasnip.extras").l
    ---@diagnostic disable-next-line: unused-local
    local rp = require("luasnip.extras").rep
    local postfix = require("luasnip.extras.postfix").postfix

    local snake_case = function(str)
      str = str:gsub("::", "/")
      str = str:gsub("(%u+)(%u%l)", "%1_%2")
      str = str:gsub("(%u+)(%u%l)", "%1_%2")
      str = str:gsub("(%l)(%u)", "%1_%2")
      str = str:gsub("(%d)(%u)", "%1_%2")
      str = str:gsub("[.-]", "_")
      return str:lower()
    end

    ---@diagnostic disable-next-line: unused-function
    local camel_case = function(str)
      str = str:gsub("-", "_")

      local _start, _end = str:find("^_+")
      _start = _start or 0
      _end = _end or 0

      str = str:sub(_start, _end) .. str:sub(_end + 1):gsub("_(%l)", string.upper)
      return str
    end

    ---@diagnostic disable-next-line: unused-function, unused-local
    local mixed_case = function(str)
      str = camel_case(str):gsub("^(_*%l)", string.upper)
      return str
    end

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
      t("Unix Makefiles"),
      t("Ninja"),
      t("Green Hills MULTI"),
      t("Ninja Multi-Config"),
      t("Watcom WMake"),
      t("CodeBlocks - Ninja"),
      t("CodeBlocks - Unix Makefiles"),
      t("CodeLite - Ninja"),
      t("CodeLite - Unix Makefiles"),
      t("Eclipse CDT4 - Ninja"),
      t("Eclipse CDT4 - Unix Makefiles"),
      t("Kate - Ninja"),
      t("Kate - Unix Makefiles"),
      t("Sublime Text 2 - Ninja"),
      t("Sublime Text 2 - Unix Makefiles"),
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
          class {node} : public rclcpp::Node {{
          public:
            {node} : Node({param}) {{
              {body}
            }}
          private:
          }};
        ]],
          {
            node = i(1, "Node"),
            param = lambda(snake_case(lambda._1), 1),
            body = i(0),
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
          class {res} {{
          public:
            {res}({res} const &) = delete;
            auto operator=({res} const &) -> {res} & = delete;

            {res}({res} &&other) noexcept;
            auto operator=({res} &&other) noexcept -> {res} &;

            ~{res}() noexcept;
          private:
            explicit {res}({handle_type} {handle}) noexcept;

            {handle_type} m_{handle};
          }};
        ]],
          {
            res = i(1, "ResourceType"), -- class name
            handle_type = i(2, "handle_t"),
            handle = i(3, "handle"),
          }
        )
      ),
      s(
        "unique-resource-functions",
        fmt(
          [[
          {res}::{res}({handle_type} handle) noexcept : m_{handle}{{handle}} {{}}

          {res}::{res}({res} &&other) noexcept : m_{handle}{{other.m_{handle}}} {{
            other.m_{handle} = {null};
          }}
          auto {res}::operator=({res} &&other) noexcept -> {res} & {{
            this->~{res}();

            m_{handle}       = other.m_{handle};
            other.m_{handle} = {null};

            return *this;
          }}

          {res}::~{res}() noexcept {{
            if (m_{handle} == {null}) {{
              return ;
            }}

            {destructor}(m_{handle});
          }}
        ]],
          {
            res = i(1, "ResourceType"),
            handle_type = i(2, "handle_type"),
            handle = i(3, "handle"),
            null = i(4, "uninitialized_value"),
            destructor = i(5, "destruct_function"),
          }
        )
      ),
      s(
        "msgpack-adaptor-namespace",
        fmt(
          [[
        namespace msgpack {{
        inline namespace MSGPACK_DEFAULT_API_NS {{
        namespace adaptor {{
        {}
        }}
        }}
        }}
        ]],
          {
            i(0),
          }
        )
      ),
      s(
        "msgpack-struct",
        fmt(
          [[
        template<>
        struct as<{type}> {{
          auto operator()(msgpack::object const &object) const -> {type} {{
            return {type}{{}};
          }}
        }};

        template<>
        struct pack<{type}> {{
          template<typename Stream>
          auto operator()(msgpack::packer<Stream> &packer, {type} const & value) const -> msgpack::packer<Stream> & {{
            return packer;
          }}
        }};
          ]],
          { type = i(1, "StructType") }
        )
      ),
      s(
        "test-case",
        fmt(
          [[
          TEST_CASE("{name}"{}{tags}{}) {{{body}}}
          ]],
          {
            f(function(args) return string.len(args[1][1]) > 0 and [[, "]] or "" end, { 2 }),
            f(function(args) return string.len(args[1][1]) > 0 and [["]] or "" end, { 2 }),
            name = i(1, "Test case name"),
            tags = i(2),
            body = i(0),
          }
        )
      ),
      s(
        "section",
        fmt(
          [[
          SECTION("{name}") {{{body}}}
          ]],
          { name = i(1, "Section name"), body = i(0) }
        )
      ),
      s(
        "here",
        fmt(
          [[
          fmt::print("{{}}:{{}}\n", __FILE__, __LINE__);
          (void)::fflush(::stdout);
          ]],
          {}
        )
      ),
      s(
        "ns",
        fmt(
          [[
          namespace {} {{
          {}
          }}
          ]],
          { i(1), i(0) }
        )
      ),
      s(
        "unu",
        fmt(
          [=[
          [[maybe_unused]]
          ]=],
          {}
        )
      ),
    })

    ls.add_snippets("cpp", {
      s("nolint", fmt([[/* NOLINT({}) */]], { i(1) })),
      s(
        "nolint-scope",
        fmt(
          [[
          /* NOLINTBEGIN({lint}) */

          /* NOLINTEND({lint}) */
          ]],
          { lint = i(1) }
        )
      ),
      s("nolint-line", fmt([[/* NOLINTNEXTLINE({}) */]], { i(1) })),
    })

    ls.add_snippets("cpp", {
      s(
        "zmqhandle",
        fmt(
          [[
          auto message = zmq::message_t{{}};
          auto result  = {socket}.recv(message);

          while (not result.has_value()) {{
            result = {socket}.recv(message);
          }}
          if (message.more()) {{
            consume_all({socket});
          }}

          try {{
            {impl}
            return success({socket}, {buffer});
          }} catch (msgpack::type_error &) {{
            return bad_request({socket}, {buffer});
          }} catch (msgpack::insufficient_bytes &) {{
            return bad_request({socket}, {buffer});
          }}
          ]],
          {
            socket = i(1, "m_socket"),
            buffer = i(2, "m_buffer"),
            impl = i(0),
          }
        )
      ),
    })

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
            --{long}|-{short})
              {var}="$2"
              shift 2
              ;;
            --{long}=*)
              {var}="${{1#--{long}=}}"
              shift 1
              ;;
            -{short}=*)
              {var}="${{1#-{short}=}}"
              shift 1
              ;;
            -{short}*)
              {var}="${{1#-{short}}}"
              shift 1
              ;;
          ]=],
          {
            long = i(1, "long"),
            short = i(2, "s"),
            var = i(3, "var"),
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
              local expected_keys="$1"
              local config_file="$2"
              while read -r line; do

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
        t({ [=[#shellcheck disable=SC2034]=] }),
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

    ls.add_snippets("sshconfig", {
      s(
        "host",
        fmt(
          [[
            Host {}
            HostName {}
          ]],
          { i(1), i(2) }
        )
      ),
    })
  end,
}
