; extends

(call_expression
  function: (_) @func
  arguments: (arguments (_ (string_fragment) @injection.content))

  (#any-of? @func "this.invoke" "invoke")
  (#set! injection.language "typescript")
  )

(call_expression
  function: (member_expression
    property: (property_identifier) @func)
  arguments: (arguments
               (template_string
                 (string_fragment) @injection.content))

  (#any-of? @func "exec" "prepare")
  (#set! injection.language "sql")
)

(call_expression
  (non_null_expression
    (instantiation_expression
      (await_expression
        (identifier) @identifier
      )
    )
  )
  (template_string (string_fragment) @injection.content)
  (#any-of? @identifier "sql")
  (#set! injection.language "sql")
)

