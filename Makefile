parseHosts=parseHostsModule
parseHostsStaticByteCode: ; ocamlfind ocamlc -custom -package extlib -linkpkg -I $(parseHosts)/ -o parseHostsStaticByteCode $(parseHosts)/parseHosts.ml
parseHostsStaticNativeCode: ; ocamlfind opt -verbose -cclib '-static' -package extlib -linkpkg -I $(parseHosts)/ -o parseHostsStaticNativeCode $(parseHosts)/parseHosts.ml

parseJson=parseJsonModule
parseJsonBaseStaticByteCode: ; ocamlfind ocamlc -custom -package extlib,yojson,cohttp.lwt -linkpkg -I $(parseJson)/ -o parseJsonBaseStaticByteCode $(parseJson)/parseJsonBase.ml $(parseJson)/parseConsulJson.ml

.PHONY: clean all

clean: ; rm $(parseHosts)/*.cm* $(parseJson)/*.cm* parseHostsStaticByteCode parseHostsStaticNativeCode parseJsonBaseStaticByteCode 
all: parseHostsStaticByteCode parseHostsStaticNativeCode parseJsonBaseStaticByteCode

