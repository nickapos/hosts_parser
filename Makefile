parseHosts=parseHostsModule
parseHostsStaticByteCode: ; ocamlfind ocamlc -custom -package extlib -linkpkg -I $(parseHosts)/ -o parseHostsStaticByteCode $(parseHosts)/parseHosts.ml
parseHostsStaticNativeCode: ; ocamlfind opt -verbose -cclib '-static' -package extlib -linkpkg -I $(parseHosts)/ -o parseHostsStaticNativeCode $(parseHosts)/parseHosts.ml

.PHONY: clean all

clean: ; rm $(parseHosts)/*.cm* parseHosts* *log *cache
all: parseHostsStaticByteCode

