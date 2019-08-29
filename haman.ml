open Syntax
open World_syntax
open Iseki

(* 扉の状態を表す型 *)
type door_state_t = Open | Closed

(* ゲームの状態（世界）を表す型 *)
type state_t = Iseki.state_t

(* 目的：ゲームのメインループ *)
(* loop : state_t -> ... -> 'a *)
let rec loop state dousa_list chizu_list
       shuryo_basho shuryo_items shuryo_messages =

  if state.place = shuryo_basho &&	(* 終了場所にいて *)
     List.fold_right (fun item b -> List.mem item state.items && b)
		     shuryo_items true	(* 終了アイテムを全て持っていたら *)
    then List.iter print_endline shuryo_messages(* 終了メッセージを全部表示 *)
  else (Iseki.basho_message state;
    print_string "> ";
    let line = read_line () in			(* １行読み込み、*)
    (try						(* 字句解析、構文解析をし *)
       let input = Parser.start Lexer.token (Lexing.from_string line) in
       Iseki.dispatch input state dousa_list chizu_list	(* 動作を処理する *)
    with Error (str) -> print_endline str
      | Not_found -> print_endline "えっ？"
      | Parsing.Parse_error -> print_endline "ええっ？");
    print_newline ();
    loop state dousa_list chizu_list shuryo_basho shuryo_items shuryo_messages;)

(* ゲームの開始 *)
let haman_main state = try
  let world = World_parser.start World_lexer.token
				 (Lexing.from_channel (open_in "haman.txt")) in
  let messages = extract_shoki_messages world in
  List.iter print_endline messages; (* 初期メッセージを表示 *)
  print_newline ();
  (* ゲームの初期状態 *)
  let init_state = {
    Iseki.place = extract_shuppatsuten world;
    Iseki.items = extract_shoki_items world;
    Iseki.place_state = extract_place_state world;
    Iseki.door_state = Closed;
    Iseki.hp = 100;
  } in
  (* アクションの対応表 *)
  let action_list = [
    ("取る", toru); ("置く", oku); ("開く", hiraku); ("閉じる", tojiru); 
  ] in
  (* 動作 *)
  let dousa_list = extract_dousa_list world action_list message in
  (* 地図 *)
  let chizu_list = extract_chizu_list world in
  (* 終了場所 *)
  let shuryo_basho = extract_shuryo_basho world in
  (* 終了アイテム *)
  let shuryo_items = extract_shuryo_items world in
  (* 終了メッセージ *)
  let shuryo_messages = extract_shuryo_messages world in
  loop init_state dousa_list chizu_list
       shuryo_basho shuryo_items shuryo_messages
with Sys_error (str) ->
  failwith "haman.txt が見つかりません。"
