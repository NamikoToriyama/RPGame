SOURCES = syntax.ml parser.mly lexer.mll world_syntax.ml world_parser.mly world_lexer.mll iseki.ml toudai.ml  yamaura.ml main.ml
RESULT = game
OCAMLMAKEFILE = ~/.opam/4.04.0/lib/ocaml-makefile/OCamlMakefile
include $(OCAMLMAKEFILE)
