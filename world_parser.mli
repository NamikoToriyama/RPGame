type token =
  | SECTION of (string)
  | SUBSECTION of (string)
  | TEXT of (string)
  | INDENTED_TEXT of (string)
  | SHOKIMESSAGE
  | SHURYOUJOUKEN
  | EOF

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> World_syntax.t
