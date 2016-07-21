parseHosts=parseHostsModule

#selecting all the ml files in parseJson module
JSONSRC=$(wildcard $(parseJson)/*.ml)
parseHostsStaticByteCode: ; ocamlfind ocamlc -custom -package extlib,yojson,cohttp.lwt -linkpkg -I $(parseHosts)/ -I $(parseJson)/ -o parseHostsStaticByteCode $(JSONSRC) $(parseHosts)/parseHosts.ml
parseHostsStaticNativeCode: ; ocamlfind opt -verbose -cclib '-static' -package extlib,yojson,cohttp.lwt -linkpkg -I $(parseHosts)/ -I $(parseJson)/ -o parseHostsStaticNativeCode $(JSONSRC) $(parseHosts)/parseHosts.ml

parseJson=parseJsonModule

.PHONY: clean all

clean: ; rm $(parseHosts)/*.cm* $(parseJson)/*.cm* $(parseHosts)/*.o $(parseJson)/*.o parseHostsStaticByteCode parseHostsStaticNativeCode 
all: parseHostsStaticByteCode parseHostsStaticNativeCode 

