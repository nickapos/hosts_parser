parseHosts=parseHostsModule
parseHosts: ; ocamlfind ocamlc -package extlib -linkpkg -I $(parseHosts)/ -o parseHosts $(parseHosts)/parseHosts.ml
parseHostsLine: ; ocamlfind ocamlc -package batteries -package extlib -linkpkg -I $(parseHosts)/ -o parseHostsLine $(parseHosts)/parseHostsLIne.ml

.PHONY: clean all

clean: ; rm $(parseHosts)/*.cm* parseHosts *log *cache
all: parseHosts parseHostsLine

