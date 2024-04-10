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

    ls.add_snippets("lua", {
      s("here", fmt([[print(debug.getinfo(1).source, debug.getinfo(1).currentline{})]], { i(0) })),
      s("luajit", fmt([[#!/usr/bin/env luajit]], {})),
    })

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
      s(
        "parse",
        fmt(
          [[
          set(options ";")
          set(singles ";")
          set(multis ";")
          cmake_parse_arguments(arg "${{options}}" "${{singles}}" "${{multis}}" ${{ARGN}})
          ]],
          {}
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
        namespace msgpack::inline MSGPACK_DEFAULT_API_NS::adaptor {{
        {}
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
            /* NOLINTBEGIN(*union-access, *pointer-arithmetic) */
            template <{template_params}>
            struct as<{type}> {{
              auto operator()(msgpack::object const &object) const -> {type} {{}}
            }};

            template <{template_params}>
            struct convert<{type}> {{
              auto operator()(msgpack::object const &object, {type} &value) const -> msgpack::object const & {{
                value = object.as<{type}>();
                return object;
              }}
            }};

            template <{template_params}>
            struct pack<{type}> {{
              template <typename Stream>
              auto operator()(msgpack::packer<Stream> &packer, {type} const &value) const -> msgpack::packer<Stream> & {{}}
            }};

            template <{template_params}>
            struct object_with_zone<{type}> {{
              auto operator()(msgpack::object::with_zone &object, {type} const &value) const -> void {{}}
            }};
            /* NOLINTEND(*union-access, *pointer-arithmetic) */
          ]],
          { template_params = i(1, "Ts"), type = i(2, "StructType") }
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
          fmt::print("{{}}:{{}}{}\n", __FILE__, __LINE__);
          (void)::fflush(::stdout);
          ]],
          { i(0) }
        )
      ),
      s(
        "print",
        fmt(
          [[
          fmt::print("{{}}\n", {});
          ]],
          { i(0) }
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
        "nouse",
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
      s(
        "format-off",
        fmt(
          [[
          // clang-format off
          {}
          // clang-format on
          ]],
          { i(0) }
        )
      ),
    })

    ls.add_snippets("cpp", {
      s(
        "no-copy",
        fmt(
          [[
          {class}({class} const &) = delete;
          auto operator=({class} const &) -> {class} & = delete;
          ]],
          { class = i(1) }
        )
      ),
      s(
        "no-move",
        fmt(
          [[
          {class}({class} &&) = delete;
          auto operator=({class} &&) -> {class} & = delete;
          ]],
          { class = i(1) }
        )
      ),
    })

    ls.add_snippets("cpp", {
      s(
        "lifetime",
        fmt(
          [[
          struct Lifetime {{
            Lifetime() {{
              fmt::print("Default constructor\n");
            }}

            Lifetime(Lifetime const &) {{
              fmt::print("Copy constructor\n");
            }}
            auto operator=(Lifetime const &) -> Lifetime & {{
              fmt::print("Copy assignment\n");
              return *this;
            }}

            Lifetime(Lifetime &&) noexcept {{
              fmt::print("Move constructor\n");
            }}
            auto operator=(Lifetime &&) -> Lifetime & {{
              fmt::print("Move assignment\n");
              return *this;
            }}

            ~Lifetime() noexcept {{
              fmt::print("Destructor\n");
            }}
          }};
          ]],
          {}
        )
      ),
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
      s(
        "canopensim",
        fmt(
          [=[
          class {class} : lely::canopen::BasicSlave {{
          public:
            using BasicSlave::Reset;
            using BasicSlave::BasicSlave;

            [[nodiscard]] auto is_done() const -> bool {{
              return true;
            }}
          private:
            auto OnWrite(u16 index, u8 sub) noexcept -> void override {{
              (void)index;
              (void)sub;
            }}

            auto OnCommand(lely::canopen::NmtCommand command) noexcept -> void override {{
              using namespace neobot::literals;

              if (command != lely::canopen::NmtCommand::START) {{
                return;
              }}
            }}

          }};
          ]=],
          { class = i(1, "Sim") }
        )
      ),
      s(
        "operatest",
        fmt(
          [[
          TEST_CASE("{name}", "[operation]") {{
            using namespace neobot::literals;

            using boost::sml::logger;
            using boost::sml::process_queue;
            using boost::sml::X;
            using neobot::operation::Operation;
            using neobot::tests::operation::canopen_simulator;

            START_PROGRAM("CANOPEN_SERVER", "CANBUS");
            // /* NOLINTNEXTLINE(*mt-unsafe) */
            auto const *const bus_name = std::getenv("CANBUS");

            auto context = zmq::context_t{{}};
            auto poller  = neobot::Poller{{}};
            auto log     = neobot::sml::Logger{{}};

            auto operation =
                Operation<StateMachine, process_queue<std::queue>, logger<neobot::sml::Logger>>{{
                    context,
                    poller,
                    log,
                }};

            while (not operation.get_state_machine().is(X)) {{
              poller.process();
            }}
          }}
          ]],
          { name = i(1, "test name") }
        )
      ),
      s(
        "solcheck",
        fmt(
          [[
          template <typename Handler>
          auto sol_lua_check(sol::types<{type}>,
                             lua_State *L,
                             int index,
                             Handler &&handler,
                             sol::stack::record &tracking) -> bool {{
            auto object = sol::stack::get<sol::table>(L, lua_absindex(L, index));
            tracking.use(1);
            if (not sol::stack::check_usertype<{type}>(L, index)
                and object.get_type() != sol::type::table) {{
              handler(L,
                      index,
                      sol::type_of(L, index),
                      sol::type::userdata,
                      "expected a {type} or a table");
              return false;
            }}

            tracking.use(1);
            return true;
          }}
          template <typename Handler>
          auto sol_lua_check(sol::types<sol::nested<{type}>>,
                             lua_State *L,
                             int index,
                             Handler &&handler,
                             sol::stack::record &tracking) -> bool {{
            return sol_lua_check<Handler>(
              sol::types<{type}>{{}},
              L,
              index,
              std::forward<Handler>(handler),
              tracking
            );
          }}
          ]],
          { type = i(1, "CustomType") }
        )
      ),
      s(
        "soldeclget",
        fmt(
          [[
          auto sol_lua_get(sol::types<{type}>,
                           lua_State *L,
                           int index,
                           sol::stack::record &tracking) -> {type};
          auto sol_lua_get(sol::types<sol::nested<{type}>>,
                           lua_State *L,
                           int index,
                           sol::stack::record &tracking) -> {type} {{
            return sol_lua_get(sol::types<{type}>{{}}, L, index, tracking);
          }}
          ]],
          { type = i(1, "CustomType") }
        )
      ),
      s(
        "solget",
        fmt(
          [[
          auto sol_lua_get(sol::types<{type}>,
                           lua_State *L,
                           int index,
                           sol::stack::record &tracking) -> {type} {{
            if (sol::stack::check_usertype<{type}>(L, index)) {{
              return sol::stack::get_usertype<{type}>(L, index, tracking);
            }}

            auto result = {type}{{}};
            auto object = sol::stack::get<{native_type}>(L, lua_absindex(L, index));
            tracking.use(1);

            {}

            return result;
          }}
          ]],
          { i(0), type = i(1, "CustomType"), native_type = i(2, "sol::table") }
        )
      ),
      s(
        "solset",
        fmt(
          [[
          if ({object}["{key}"].get_type() != sol::type::nil) {{
            {result}.{key} = {object}["{key}"].get<{type}>();
          }}
          ]],
          { object = i(1, "object"), key = i(2, "key"), result = i(3, "result"), type = i(4, "type") }
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
            black="$(tput setaf 0)"
            red="$(tput setaf 1)"
            green="$(tput setaf 2)"
            brown="$(tput setaf 3)"
            blue="$(tput setaf 4)"
            purple="$(tput setaf 5)"
            cyan="$(tput setaf 6)"
            gray="$(tput setaf 7)"

            black_bg="$(tput setab 0)"
            red_bg="$(tput setab 1)"
            green_bg="$(tput setab 2)"
            brown_bg="$(tput setab 3)"
            blue_bg="$(tput setab 4)"
            purple_bg="$(tput setab 5)"
            cyan_bg="$(tput setab 6)"
            gray_bg="$(tput setab 7)"

            bold="$(tput bold)"
            uline="$(tput smul)"
            blink="$(tput blink)"

            reset="$(tput sgr0)"
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
        "opt",
        fmt(
          [=[
          -{short})
            {var}=$((${{{var}:-0}} + 1))
            shift 1
            ;;
          -{short}*)
            {var}=$((${{{var}:-0}} + 1))
            set -- "-${{1:2}}" "${{@:2}}"
            ;;
          ]=],
          {
            short = i(1, "s"),
            var = i(2, "var"),
          }
        )
      ),
      s(
        "l-arg",
        fmt(
          [=[
          --{long})
            {var}="$2"
            shift 2
            ;;
          --{long}=*)
            {var}="${{1#--{long}=}}"
            shift 1
            ;;
          ]=],
          {
            long = i(1, "long"),
            var = i(2, "var"),
          }
        )
      ),
      s(
        "sl-arg",
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

    ls.add_snippets("toml", {
      s(
        "enum",
        fmt(
          [[
            [enums.{name}]
            integral = {type}
            [enums.{name}.values]
            {values}
          ]],
          { name = i(1), type = i(2), values = i(3) }
        )
      ),
    })

    ls.add_snippets("ledger", {
      s(
        "transaction",
        fmt(
          [[
          {date} * {name}
            {type}  {amount} {unit}
            {from}
          ]],
          {
            date = d(
              1,
              function()
                return sn(nil, {
                  i(1, tostring(os.date("%Y"))),
                  t("-"),
                  i(2, tostring(os.date("%m"))),
                  t("-"),
                  i(3, tostring(os.date("%d"))),
                })
              end
            ),
            name = i(2, "name"),
            type = i(3, "type"),
            amount = i(4, "0.00"),
            unit = i(5, "EUR"),
            from = i(6, "Nordea"),
          }
        )
      ),
    })
  end,
}
