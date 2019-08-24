type token =
  | SECTION of (string)
  | SUBSECTION of (string)
  | TEXT of (string)
  | INDENTED_TEXT of (string)
  | SHOKIMESSAGE
  | SHURYOUJOUKEN
  | EOF

open Parsing;;
let _ = parse_error;;
# 2 "world_parser.mly"
(* 補助的な変数、関数、型などの定義 *)
open World_syntax
# 16 "world_parser.ml"
let yytransl_const = [|
  261 (* SHOKIMESSAGE *);
  262 (* SHURYOUJOUKEN *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  257 (* SECTION *);
  258 (* SUBSECTION *);
  259 (* TEXT *);
  260 (* INDENTED_TEXT *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\005\000\005\000\003\000\003\000\006\000\008\000\
\008\000\009\000\007\000\010\000\010\000\011\000\011\000\004\000\
\000\000"

let yylen = "\002\000\
\004\000\002\000\000\000\002\000\000\000\002\000\003\000\000\000\
\002\000\002\000\002\000\000\000\002\000\000\000\002\000\002\000\
\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\017\000\000\000\000\000\002\000\000\000\
\000\000\000\000\004\000\000\000\000\000\000\000\000\000\006\000\
\000\000\011\000\000\000\007\000\000\000\000\000\016\000\001\000\
\015\000\010\000\009\000\013\000"

let yydgoto = "\002\000\
\004\000\005\000\009\000\015\000\007\000\010\000\022\000\020\000\
\021\000\023\000\018\000"

let yysindex = "\007\000\
\008\255\000\000\007\255\000\000\013\255\007\255\000\000\012\255\
\010\255\013\255\000\000\014\255\015\255\012\255\019\000\000\000\
\014\255\000\000\012\255\000\000\015\255\012\255\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\000\000\000\000\255\254\000\000\016\255\255\254\000\000\000\000\
\000\000\016\255\000\000\001\000\005\255\020\000\000\000\000\000\
\001\000\000\000\001\255\000\000\005\255\004\000\000\000\000\000\
\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\011\000\000\000\017\000\000\000\016\000\005\000\
\000\000\246\255\008\000"

let yytablesize = 266
let yytable = "\003\000\
\014\000\012\000\012\000\012\000\003\000\008\000\012\000\001\000\
\026\000\006\000\008\000\028\000\003\000\008\000\012\000\014\000\
\019\000\017\000\024\000\012\000\016\000\005\000\011\000\013\000\
\025\000\027\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\014\000\014\000\014\000\012\000\012\000\014\000\000\000\
\000\000\012\000"

let yycheck = "\001\001\
\000\000\001\001\002\001\000\000\006\001\001\001\006\001\001\000\
\019\000\003\001\006\001\022\000\005\001\001\001\003\001\006\001\
\002\001\004\001\000\000\000\000\010\000\006\001\006\000\008\000\
\017\000\021\000\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
\255\255\001\001\002\001\003\001\001\001\002\001\006\001\255\255\
\255\255\006\001"

let yynames_const = "\
  SHOKIMESSAGE\000\
  SHURYOUJOUKEN\000\
  EOF\000\
  "

let yynames_block = "\
  SECTION\000\
  SUBSECTION\000\
  TEXT\000\
  INDENTED_TEXT\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'shoki_section) in
    let _2 = (Parsing.peek_val __caml_parser_env 2 : 'sections) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'shuryou_section) in
    Obj.repr(
# 49 "world_parser.mly"
        ( { messages = _1;
            sections = _2;
            shuryo_jouken = _3; } )
# 163 "world_parser.ml"
               : World_syntax.t))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'messages) in
    Obj.repr(
# 55 "world_parser.mly"
        ( _2 )
# 170 "world_parser.ml"
               : 'shoki_section))
; (fun __caml_parser_env ->
    Obj.repr(
# 59 "world_parser.mly"
        ( [] )
# 176 "world_parser.ml"
               : 'messages))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'messages) in
    Obj.repr(
# 61 "world_parser.mly"
        ( _1 :: _2 )
# 184 "world_parser.ml"
               : 'messages))
; (fun __caml_parser_env ->
    Obj.repr(
# 65 "world_parser.mly"
        ( [] )
# 190 "world_parser.ml"
               : 'sections))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'section) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'sections) in
    Obj.repr(
# 67 "world_parser.mly"
        ( _1 :: _2 )
# 198 "world_parser.ml"
               : 'sections))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'pair) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'subsections) in
    Obj.repr(
# 71 "world_parser.mly"
        ( (_1, { initial_pair = _2; subsections = _3 }) )
# 207 "world_parser.ml"
               : 'section))
; (fun __caml_parser_env ->
    Obj.repr(
# 75 "world_parser.mly"
        ( [] )
# 213 "world_parser.ml"
               : 'subsections))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'subsection) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'subsections) in
    Obj.repr(
# 77 "world_parser.mly"
        ( _1 :: _2 )
# 221 "world_parser.ml"
               : 'subsections))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'pairs) in
    Obj.repr(
# 81 "world_parser.mly"
        ( (_1, _2) )
# 229 "world_parser.ml"
               : 'subsection))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'indented_texts) in
    Obj.repr(
# 85 "world_parser.mly"
        ( (_1, _2) )
# 237 "world_parser.ml"
               : 'pair))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "world_parser.mly"
        ( [] )
# 243 "world_parser.ml"
               : 'pairs))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'pair) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'pairs) in
    Obj.repr(
# 91 "world_parser.mly"
        ( _1 :: _2 )
# 251 "world_parser.ml"
               : 'pairs))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "world_parser.mly"
        ( [] )
# 257 "world_parser.ml"
               : 'indented_texts))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'indented_texts) in
    Obj.repr(
# 97 "world_parser.mly"
        ( _1 :: _2 )
# 265 "world_parser.ml"
               : 'indented_texts))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'pairs) in
    Obj.repr(
# 101 "world_parser.mly"
        ( _2 )
# 272 "world_parser.ml"
               : 'shuryou_section))
(* Entry start *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let start (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : World_syntax.t)
