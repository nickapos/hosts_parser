parseHosts=parseHostsModule
parseHostsStaticByteCode: ; ocamlfind ocamlc -custom -package extlib,yojson,cohttp.lwt -linkpkg -I $(parseHosts)/ -I $(parseJson)/ -o parseHostsStaticByteCode $(parseJson)/parseJsonBase.ml $(parseJson)/parseConsulJson.ml $(parseHosts)/parseHosts.ml
parseHostsStaticNativeCode: ; ocamlfind opt -verbose -cclib '-static' -package extlib,yojson,cohttp.lwt -linkpkg -I $(parseHosts)/ -I $(parseJson)/ -o parseHostsStaticNativeCode $(parseJson)/parseJsonBase.ml $(parseJson)/parseConsulJson.ml $(parseHosts)/parseHosts.ml

parseJson=parseJsonModule

.PHONY: clean all

clean: ; rm $(parseHosts)/*.cm* $(parseJson)/*.cm* $(parseHosts)/*.o $(parseJson)/*.o parseHostsStaticByteCode parseHostsStaticNativeCode 
all: parseHostsStaticByteCode parseHostsStaticNativeCode 

