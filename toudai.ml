open Syntax
open World_syntax
open Iseki

(* 扉の状態を表す型 *)
type door_state_t = Open | Closed

(* ゲームの状態（世界）を表す型 *)
type state_t = Iseki.state_t

(* 遺跡の部屋の状態を表す型 *)
type heya_t = {
  mutable heya1 : bool;
  mutable heya2 : bool;
  mutable heya3 : bool;
  mutable heya4 : bool;
  mutable cnt   : int;
}
(* 目的：ゲームのメインループ *)
(* loop : state_t -> ... -> 'a *)
let check_room heya_state = 
  if not(heya_state.heya1) then false
  else if not(heya_state.heya2) then false
  else if not(heya_state.heya3) then false
  else if not(heya_state.heya4) then false
  else if heya_state.cnt=5 then true
  else false

  
(* 目的：ゲームのメインループ *)
(* loop : state_t -> ... -> 'a *)
let rec loop state heya_state dousa_list chizu_list
       shuryo_basho shuryo_items shuryo_messages =
  (* 部屋を通ったか確認する *)
  if state.place = "部屋１" then heya_state.heya1 <- true
  else if state.place = "部屋２" then heya_state.heya2 <- true
  else if state.place = "部屋３" then heya_state.heya3 <- true
  else if state.place = "部屋４" then heya_state.heya4 <- true;
  heya_state.cnt <- (heya_state.cnt + 1);
  (* print_int (heya_state.cnt); *)

  if state.place = shuryo_basho &&	(* 終了場所にいて *)
     List.fold_right (fun item b -> List.mem item state.items && b)
		     shuryo_items true	(* 終了アイテムを全て持っていたら *)
    then (List.iter print_endline shuryo_messages;(* 終了メッセージを全部表示 *)
          check_room heya_state;)
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
    loop state heya_state dousa_list chizu_list shuryo_basho shuryo_items shuryo_messages;)

(* ゲームの開始 *)
let toudai_main state = try
  let world = World_parser.start World_lexer.token
				 (Lexing.from_channel (open_in "toudai.txt")) in
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
  let init_heya = {
    heya1 = false;
    heya2 = false;
    heya3 = false;
    heya4 = false;
    cnt = 0;
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
  let flag = loop init_state init_heya dousa_list chizu_list
       shuryo_basho shuryo_items shuryo_messages in
    if flag then true
    else false
with Sys_error (str) ->
  failwith "toudai.txt が見つかりません。"
