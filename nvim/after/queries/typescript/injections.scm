(
  (binary_expression
    left: (binary_expression
            left: (identifier) @_tag
            right: (_))
    right: (template_string) @injection.content)
  (#eq? @_tag "sql")
  (#set! injection.language "sql")
  (#set! injection.include-children)
)
