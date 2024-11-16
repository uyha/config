; extends

(call
  function: (
             attribute
             object: (identifier) @object
             attribute: (identifier) @function
             )
  arguments: (argument_list
               (string
                 (string_content) @injection.content)
               )

  (#eq? @object "conn")
  (#eq? @function "execute")
  (#set! injection.language "sql")
  )


(call
  function: (identifier) @function
  arguments: (argument_list
               (string
                 (string_content) @injection.content)
               )

  (#eq? @function "SQL")
  (#set! injection.language "sql")
  )

(assignment
  left: (identifier) @object
  right: (string
           (string_content) @injection.content
           )

  (#lua-match? @object "query$")
  (#set! injection.language "sql")
  )
