{
(* vim: set syntax=ocaml: *)
(* 補助的な変数、関数、型などの定義 *)
open Parser
}

(* 正規表現の略記 *)
let space = [' ' '\t']
let digit = ['0'-'9']
let lower = ['a'-'z']
let upper = ['A'-'Z']
let alpha = lower | upper
(* let zenkaku1 = ['\161'-'\254'] *)
              (* 0xA1 - 0xFE, EUC の１文字目 *)
let zenkaku1 = ['\224'-'\239']
              (* 0xE0 - 0xEF, UTF-8 の３バイト文字の１文字目 *)
let zenkaku = zenkaku1 _ _

rule token = parse
| "東" | "ひがし"
	{ HOUKOU ("東") }
| "西" | "にし"
	{ HOUKOU ("西") }
| "南" | "みなみ"
	{ HOUKOU ("南") }
| "北" | "きた"
	{ HOUKOU ("北") }
| "白" | "しろ"
	{ HOUKOU ("白") }
| "黒" | "くろ"
	{ HOUKOU ("黒") }
| "家" | "いえ"
	{ IE }
| "部屋" | "へや"
	{ HEYA }
| "へ"
	{ HE }
| "に"
	{ NI }
| "から"
	{ KARA }
| "進む" | "すすむ" | "行く" | "いく"
	{ SUSUMU }
| "入る" | "はいる"
	{ HAIRU }
| "出る" | "でる"
	{ DERU }
| "を"
	{ WO }
| "地図" | "ちず"
	{ CHIZU ("地図") }
| "鍵" | "かぎ"
	{ ITEM ("鍵") }
| "ドア" | "扉" | "とびら"
	{ ITEM ("扉") }
| "教科書" | "きょうかしょ"
	{ ITEM ("教科書") }
| "サボテン"
	{ ITEM ("サボテン") }
| "宝" | "たから"
	{ ITEM ("宝") }
| "取る" | "とる"
	{ TADOUSHI ("取る") }
| "置く" | "おく"
	{ TADOUSHI ("置く") }
| "読む" | "よむ"
	{ TADOUSHI ("読む") }
| "開く" | "ひらく" | "開ける" | "あける"
	{ TADOUSHI ("開く") }
| "閉じる" | "とじる" | "閉める" | "しめる"
	{ TADOUSHI ("閉じる") }
| "ノックする"
	{ TADOUSHI ("ノックする") }
| "見る" | "みる"
	{ MIRU ("見る") }
| "終了する" | "しゅうりょうする"
	{ TANDOKUDOUSHI ("終了する") }
| eof
	{ EOL }
| _
	{ (* 字句解析できなかった部分をエラーとして例外を起こす *)
	  let input = Bytes.to_string lexbuf.Lexing.lex_buffer in (* 入力全体 *)
	  let pos = Lexing.lexeme_start lexbuf in (* マッチした先頭の位置 *)
	  let str = String.sub input pos (String.length input - pos) in
	  raise (Syntax.Error ("「" ^ str ^ "」？")) }
