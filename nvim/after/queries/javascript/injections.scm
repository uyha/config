; extends

(call_expression
  function: (_) @func
  arguments: (arguments (_ (string_fragment) @injection.content))

  (#any-of? @func "this.invoke" "invoke")
  (#set! injection.language "javascript")
  )

