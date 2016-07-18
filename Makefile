parseHosts=parseHostsModule
parseHostsStaticByteCode: ; ocamlfind ocamlc -custom -package extlib -linkpkg -I $(parseHosts)/ -o parseHostsStaticByteCode $(parseHosts)/parseHosts.ml
parseHostsStaticNativeCode: ; ocamlfind opt -verbose -cclib '-static' -package extlib -linkpkg -I $(parseHosts)/ -o parseHostsStaticNativeCode $(parseHosts)/parseHosts.ml

parseJson=parseJsonModule
parseJsonBaseStaticByteCode: ; ocamlfind ocamlc -custom -package extlib,yojson -linkpkg -I $(parseJson)/ -o parseJsonBaseStaticByteCode $(parseJson)/parseJsonBase.ml $(parseJson)/parseConsulJson.ml

.PHONY: clean all

clean: ; rm $(parseHosts)/*.cm* $(parseJson)/*.cm* parseHosts* parseJson* *log *cache
all: parseHostsStaticByteCode parseHostsStaticNativeCode parseJsonBaseStaticByteCode

