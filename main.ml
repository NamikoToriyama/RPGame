open Syntax
open World_syntax

(* 扉の状態を表す型 *)
type door_state_t = Locked | Open | Closed

(* ゲームの状態（世界）を表す型 *)
type state_t = {
  mutable place : string;				 (* 現在、いる場所 *)
  mutable items : string list;				 (* 持ち物リスト *)
	  place_state : (string * string list ref) list; (* 各場所にある物 *)
  mutable door_state : door_state_t;			 (* ドアの状態 *)
  mutable hp : int;				(* ヒットポイント（不使用） *)
}

(* 目的：移動コマンドを処理する *)
(* idou : state_t -> string -> chizu_list -> unit *)
let idou state houkou chizu_list =
  if (houkou = "入" || houkou = "出") && state.door_state <> Open then
    print_endline "扉が閉まっています。"
  else try
    let new_place = List.assoc houkou (List.assoc state.place chizu_list) in
    state.place <- new_place
  with Not_found -> print_endline "そこには行かれません。"
 
(* 以下、動作を処理する関数群 *)

(* 目的：メッセージを表示する *)
(* message : string -> state_t -> unit *)
let message str state = print_endline str

(* 目的：「取る」を処理する *)
(* toru : string -> state_t -> unit *)
let toru item state =
  let r = List.assoc state.place state.place_state in
  if not (List.mem item !r)
    then print_endline ("ここに" ^ item ^ "はありません。")
  else if List.mem item state.items
    then print_endline ("あなたはすでに" ^ item ^ "を持っている。")
  else (state.items <- item :: state.items;
	r := List.filter (fun i -> i <> item) !r;
	print_endline ("あなたは" ^ item ^ "を手に入れた！"))

(* 目的：「置く」を処理する *)
(* oku : string -> state_t -> unit *)
let oku item state =
  let r = List.assoc state.place state.place_state in
  if not (List.mem item state.items)
    then print_endline ("あなたは" ^ item ^ "を持っていない。")
  else (state.items <- List.filter (fun x -> x <> item) state.items;
	r := item :: !r;
	print_endline ("あなたは" ^ item ^ "を置いた。"))

(* 目的：「開く」を処理する *)
(* hiraku : string -> state_t -> unit *)
let hiraku item state =
  let r = List.assoc state.place state.place_state in
  if not (List.mem item !r)
    then print_endline ("ここに" ^ item ^ "はありません。")
  else match state.door_state with
      Locked -> if List.mem "鍵" state.items
	        then (state.door_state <- Open;
		      print_endline ("あなたは扉を開いた。"))
	        else print_endline ("扉は施錠されている。")
    | Open   -> print_endline ("扉はすでに開いている。")
    | Closed -> (state.door_state <- Open;
	         print_endline ("あなたは扉を開いた。"))

(* 目的：「閉じる」を処理する *)
(* tojiru : string -> state_t -> unit *)
let tojiru item state =
  let r = List.assoc state.place state.place_state in
  if not (List.mem item !r)
    then print_endline ("ここに" ^ item ^ "はありません。")
  else match state.door_state with
      Locked -> print_endline ("扉はすでに閉まっている。")
    | Open   -> state.door_state <- Closed;
	        print_endline ("あなたは扉を閉めた。")
    | Closed -> print_endline ("扉はすでに閉まっている。")


(* 目的：地図を表示する *)
let hougaku = ["東";"西";"南";"北"]

(* chizu_display : string -> (string*string) list -> unit *)
let rec chizu_display hougaku chizu_houkou =
  match hougaku with
  [] -> print_endline ("につながっている。")
  | first :: rest -> 
  try
    let houkou = List.assoc first chizu_houkou
    in (print_endline ( first ^ ":" ^ houkou);
        chizu_display rest chizu_houkou)
  with Not_found -> chizu_display rest chizu_houkou

(* miru : string ->　state_t -> chizu_list(string*(stirng*string)) -> unit *)
let miru item state chizu_list =
  if item = "地図"
    then chizu_display hougaku (List.assoc state.place chizu_list)
  else print_endline ( "" ^ item ^ "がある。")


(* 目的：入力文に従って動作を行う *)
(* dispatch : Syntax.t -> state_t -> dousa_list -> chizu_list -> unit *)
let dispatch input state dousa_list chizu_list = match input with
    Idousuru (houkou) -> idou state houkou chizu_list
  | Miru (chizu) -> miru chizu state chizu_list
  | Tadoushi (mokutekigo, tadoushi) ->
      let lst = List.assoc mokutekigo dousa_list in
		(* この目的語に使える動作のリストを得る *)
      (try
	 let thunk = List.assoc tadoushi lst in
	 thunk state (* 動作を実行 *)
       with Not_found ->
	     print_endline (mokutekigo ^ "を" ^
			    tadoushi ^ "ことはできません。"))
  | Tandokudoushi ("終了する") ->
      print_endline "また遊んでね！"; exit 0
  | Tandokudoushi (tandokudoushi) ->
      print_endline (tandokudoushi ^ "ことはできません。")

(* 目的：現在地の情報を表示する *)
(* basho_message : state_t -> unit *)
let basho_message state =
  print_endline ("あなたは" ^ state.place ^ "にいる。");
  if state.place = "西の森の遺跡" && not(List.mem "西の森の宝" state.items)
    then (Iseki.iseki_main state; state.place <- "西の森";
          state.items <- "西の森の宝":: state.items;
          print_endline ("あなたは" ^ state.place ^ "にいる。");)
  else if state.place = "地下の遺跡" && not(List.mem "指輪" state.items)
  then (let flag = Toudai.toudai_main state in 
        if flag then (state.items <- "指輪":: state.items;
                      print_endline ("あなたは指輪を手に入れた。");)
        else print_endline ("灯台では特に何も起こらなかった。");
        state.place <- "灯台";
        print_endline ("あなたは" ^ state.place ^ "にいる。");)
  else if state.place = "山裏の遺跡" && not(List.mem "山裏の宝" state.items)
    then (Yamaura.yamaura_main state; state.place <- "家の前";
        state.items <- "山裏の宝":: state.items;
        print_endline ("あなたは" ^ state.place ^ "にいる。");)
  else if state.place = "建設現場" && not(List.mem "ハマンの宝" state.items)
    then (Haman.haman_main state; state.place <- "ハマンの町";
      state.items <- "ハマンの宝":: state.items;
      print_endline ("あなたは" ^ state.place ^ "にいる。");)
  else (print_string "ここには";
  match !(List.assoc state.place state.place_state) with
      [] -> print_endline "何もない。"
    | item :: rest ->
	print_string item;
	List.iter (fun item ->
		     print_string "と";
		     print_string item)
		  rest;
	print_endline "がある。")

(* 目的：ゲームのメインループ *)
(* loop : state_t -> ... -> 'a *)
let rec loop state dousa_list chizu_list
	     shuryo_basho shuryo_items shuryo_messages =
  if state.place = shuryo_basho &&	(* 終了場所にいて *)
     List.fold_right (fun item b -> List.mem item state.items && b)
		     shuryo_items true	(* 終了アイテムを全て持っていたら *)
  then (List.iter print_endline shuryo_messages; (* 終了メッセージを全部表示 *)
	exit 0);
  basho_message state;
  print_string "> ";
  let line = read_line () in			(* １行読み込み、*)
  (try						(* 字句解析、構文解析をし *)
     let input = Parser.start Lexer.token (Lexing.from_string line) in
     dispatch input state dousa_list chizu_list	(* 動作を処理する *)
   with Error (str) -> print_endline str
      | Not_found -> print_endline "えっ？"
      | Parsing.Parse_error -> print_endline "ええっ？");
  print_newline ();
  loop state dousa_list chizu_list shuryo_basho shuryo_items shuryo_messages

(* ゲームの開始 *)
let _ = try
  let world = World_parser.start World_lexer.token
				 (Lexing.from_channel (open_in "world.txt")) in
  let messages = extract_shoki_messages world in
  List.iter print_endline messages; (* 初期メッセージを表示 *)
  print_newline ();
  (* ゲームの初期状態 *)
  let init_state = {
    place = extract_shuppatsuten world;
    items = extract_shoki_items world;
    place_state = extract_place_state world;
    door_state = Locked;
    hp = 100;
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
  failwith "world.txt が見つかりません。"
