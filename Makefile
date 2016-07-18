parseHosts=parseHostsModule
parseHosts: ; ocamlfind ocamlc -custom -package extlib -linkpkg -I $(parseHosts)/ -o parseHosts $(parseHosts)/parseHosts.ml

.PHONY: clean all

clean: ; rm $(parseHosts)/*.cm* parseHosts *log *cache
all: parseHosts 

