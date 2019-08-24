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

open Parsing;;
let _ = parse_error;;
# 2 "parser.mly"
(* 補助的な変数、関数、型などの定義 *)
open Syntax
# 25 "parser.ml"
let yytransl_const = [|
  263 (* IE *);
  264 (* HEYA *);
  265 (* HE *);
  266 (* NI *);
  267 (* KARA *);
  268 (* SUSUMU *);
  269 (* HAIRU *);
  270 (* DERU *);
  271 (* WO *);
  272 (* EOL *);
    0|]

let yytransl_block = [|
  257 (* HOUKOU *);
  258 (* ITEM *);
  259 (* TADOUSHI *);
  260 (* TANDOKUDOUSHI *);
  261 (* MIRU *);
  262 (* CHIZU *);
    0|]

let yylhs = "\255\255\
\001\000\001\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\004\000\004\000\005\000\
\005\000\003\000\003\000\006\000\006\000\006\000\006\000\006\000\
\006\000\006\000\006\000\006\000\006\000\006\000\006\000\006\000\
\006\000\000\000"

let yylen = "\002\000\
\002\000\003\000\003\000\002\000\001\000\003\000\003\000\002\000\
\003\000\003\000\003\000\002\000\001\000\003\000\002\000\001\000\
\002\000\001\000\001\000\003\000\000\000\001\000\001\000\002\000\
\001\000\001\000\002\000\001\000\001\000\001\000\001\000\001\000\
\001\000\001\000\001\000\001\000\001\000\001\000\001\000\001\000\
\001\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\000\000\019\000\000\000\000\000\000\000\
\042\000\000\000\000\000\022\000\023\000\000\000\024\000\000\000\
\000\000\000\000\000\000\000\000\000\000\028\000\039\000\041\000\
\040\000\038\000\029\000\030\000\031\000\032\000\033\000\034\000\
\035\000\036\000\037\000\001\000\000\000\000\000\017\000\003\000\
\020\000\009\000\010\000\006\000\011\000\007\000\002\000\027\000"

let yydgoto = "\002\000\
\009\000\010\000\037\000\014\000\011\000\038\000"

let yysindex = "\001\000\
\186\255\000\000\128\255\019\255\000\000\035\255\187\255\167\255\
\000\000\255\254\027\255\000\000\000\000\054\255\000\000\072\255\
\045\255\068\255\085\255\078\255\096\255\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\098\255\159\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yyrindex = "\000\000\
\170\255\000\000\111\255\015\255\000\000\000\000\143\255\127\255\
\000\000\000\000\031\255\000\000\000\000\047\255\000\000\000\000\
\063\255\000\000\079\255\095\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\114\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\098\000\113\000\000\000\000\000"

let yytablesize = 202
let yytable = "\022\000\
\023\000\001\000\024\000\025\000\026\000\027\000\028\000\029\000\
\030\000\031\000\032\000\033\000\034\000\035\000\036\000\025\000\
\025\000\025\000\025\000\025\000\025\000\025\000\025\000\025\000\
\025\000\025\000\025\000\025\000\025\000\039\000\025\000\018\000\
\018\000\015\000\018\000\018\000\018\000\018\000\018\000\018\000\
\018\000\018\000\018\000\018\000\018\000\018\000\018\000\004\000\
\004\000\016\000\004\000\004\000\004\000\004\000\004\000\004\000\
\004\000\004\000\042\000\004\000\004\000\004\000\004\000\012\000\
\012\000\040\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\041\000\012\000\012\000\008\000\
\008\000\043\000\008\000\008\000\008\000\008\000\008\000\008\000\
\008\000\008\000\008\000\045\000\008\000\008\000\008\000\015\000\
\015\000\044\000\015\000\015\000\015\000\015\000\015\000\015\000\
\015\000\015\000\015\000\015\000\046\000\015\000\015\000\005\000\
\005\000\047\000\005\000\005\000\005\000\005\000\005\000\019\000\
\021\000\005\000\005\000\005\000\005\000\005\000\005\000\016\000\
\016\000\026\000\016\000\016\000\016\000\016\000\016\000\048\000\
\012\000\013\000\016\000\016\000\016\000\016\000\016\000\013\000\
\013\000\000\000\013\000\013\000\013\000\013\000\013\000\000\000\
\000\000\000\000\013\000\013\000\013\000\000\000\013\000\022\000\
\023\000\000\000\024\000\025\000\026\000\027\000\028\000\029\000\
\030\000\031\000\032\000\033\000\034\000\035\000\021\000\012\000\
\013\000\020\000\021\000\021\000\021\000\021\000\021\000\021\000\
\021\000\021\000\003\000\004\000\000\000\005\000\000\000\006\000\
\007\000\008\000\000\000\012\000\013\000\017\000\000\000\000\000\
\000\000\018\000"

let yycheck = "\001\001\
\002\001\001\000\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\001\001\
\002\001\003\001\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\003\001\016\001\001\001\
\002\001\015\001\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\016\001\001\001\
\002\001\015\001\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\014\001\013\001\014\001\015\001\016\001\001\001\
\002\001\012\001\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\005\001\015\001\016\001\001\001\
\002\001\014\001\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\014\001\014\001\015\001\016\001\001\001\
\002\001\013\001\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\013\001\015\001\016\001\001\001\
\002\001\016\001\004\001\005\001\006\001\007\001\008\001\007\000\
\008\000\011\001\012\001\013\001\014\001\015\001\016\001\001\001\
\002\001\016\001\004\001\005\001\006\001\007\001\008\001\038\000\
\009\001\010\001\012\001\013\001\014\001\015\001\016\001\001\001\
\002\001\255\255\004\001\005\001\006\001\007\001\008\001\255\255\
\255\255\255\255\012\001\013\001\014\001\255\255\016\001\001\001\
\002\001\255\255\004\001\005\001\006\001\007\001\008\001\009\001\
\010\001\011\001\012\001\013\001\014\001\015\001\005\001\009\001\
\010\001\011\001\009\001\010\001\011\001\012\001\013\001\014\001\
\015\001\016\001\001\001\002\001\255\255\004\001\255\255\006\001\
\007\001\008\001\255\255\009\001\010\001\011\001\255\255\255\255\
\255\255\015\001"

let yynames_const = "\
  IE\000\
  HEYA\000\
  HE\000\
  NI\000\
  KARA\000\
  SUSUMU\000\
  HAIRU\000\
  DERU\000\
  WO\000\
  EOL\000\
  "

let yynames_block = "\
  HOUKOU\000\
  ITEM\000\
  TADOUSHI\000\
  TANDOKUDOUSHI\000\
  MIRU\000\
  CHIZU\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'bun) in
    Obj.repr(
# 44 "parser.mly"
        ( _1 )
# 180 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'bun) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'anys) in
    Obj.repr(
# 46 "parser.mly"
        ( raise (Error ("「" ^ _2 ^ "」？")) )
# 188 "parser.ml"
               : Syntax.t))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'houkoujoshi) in
    Obj.repr(
# 50 "parser.mly"
        ( Idousuru (_1) )
# 196 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'houkoujoshi) in
    Obj.repr(
# 52 "parser.mly"
        ( raise (Error ("「" ^ _1 ^ "に」どうする？")) )
# 204 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 54 "parser.mly"
        ( raise (Error ("「" ^ _1 ^ "」にどうする？")) )
# 211 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'houkoujoshi) in
    Obj.repr(
# 56 "parser.mly"
        ( Idousuru ("入") )
# 218 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'houkoujoshi) in
    Obj.repr(
# 58 "parser.mly"
        ( Idousuru ("入") )
# 225 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'houkoujoshi) in
    Obj.repr(
# 60 "parser.mly"
        ( raise (Error ("「家に」どうする？")) )
# 232 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 62 "parser.mly"
        ( Idousuru ("出") )
# 238 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 64 "parser.mly"
        ( Idousuru ("出") )
# 244 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 66 "parser.mly"
        ( Idousuru ("出") )
# 250 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 68 "parser.mly"
        ( raise (Error ("「家から」どうする？")) )
# 256 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 70 "parser.mly"
        ( raise (Error ("「家」にどうする？")) )
# 262 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 72 "parser.mly"
        ( Idousuru ("出") )
# 268 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 74 "parser.mly"
        ( raise (Error ("「部屋から」どうする？")) )
# 274 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 76 "parser.mly"
        ( raise (Error ("「部屋」にどうする？")) )
# 280 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'mokutekigo) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 78 "parser.mly"
        ( Tadoushi (_1, _2) )
# 288 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'mokutekigo) in
    Obj.repr(
# 80 "parser.mly"
        ( raise (Error ("「" ^ _1 ^ "を」どうする？")) )
# 295 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 82 "parser.mly"
        ( Tandokudoushi (_1) )
# 302 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 84 "parser.mly"
        ( Miru (_1) )
# 310 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 86 "parser.mly"
        ( raise (Error ("え？")) )
# 316 "parser.ml"
               : 'bun))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
        ( () (* 何も返す必要がない *) )
# 322 "parser.ml"
               : 'houkoujoshi))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parser.mly"
        ( () (* 何も返す必要がない *) )
# 328 "parser.ml"
               : 'houkoujoshi))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 96 "parser.mly"
        ( _1 )
# 335 "parser.ml"
               : 'mokutekigo))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 98 "parser.mly"
        ( raise (Error ("「" ^ _1 ^ "」をどうする？")) )
# 342 "parser.ml"
               : 'mokutekigo))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'any) in
    Obj.repr(
# 101 "parser.mly"
                ( _1 )
# 349 "parser.ml"
               : 'anys))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'any) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'anys) in
    Obj.repr(
# 102 "parser.mly"
                ( _1 ^ _2 )
# 357 "parser.ml"
               : 'anys))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 105 "parser.mly"
                ( _1 (* 返す文字列は、エラーメッセージ用 *) )
# 364 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 106 "parser.mly"
                ( "家" )
# 370 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 107 "parser.mly"
                ( "部屋" )
# 376 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 108 "parser.mly"
                ( "へ" )
# 382 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 109 "parser.mly"
                ( "に" )
# 388 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 110 "parser.mly"
                ( "から" )
# 394 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 111 "parser.mly"
                ( "進む" )
# 400 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 112 "parser.mly"
                ( "入る" )
# 406 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 113 "parser.mly"
                ( "出る" )
# 412 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    Obj.repr(
# 114 "parser.mly"
                ( "を" )
# 418 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 115 "parser.mly"
                ("地図")
# 425 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 116 "parser.mly"
                ( _1 )
# 432 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 117 "parser.mly"
                ( _1 )
# 439 "parser.ml"
               : 'any))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 118 "parser.mly"
                ( _1 )
# 446 "parser.ml"
               : 'any))
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
   (Parsing.yyparse yytables 1 lexfun lexbuf : Syntax.t)
