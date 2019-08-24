type token =
  | HOUKOU of (string)
  | ITEM of (string)
  | TADOUSHI of (string)
  | TANDOKUDOUSHI of (string)
  | MIRU of (string)
  | CHIZU of (string)
  | IE
  | HEYA
  | HE
  | NI
  | KARA
  | SUSUMU
  | HAIRU
  | DERU
  | WO
  | EOL

val start :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Syntax.t
