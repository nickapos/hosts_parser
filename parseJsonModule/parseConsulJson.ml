class parseConsulJson = object (self)
  inherit ParseJsonBase.parseJsonBase
 (*
  A class that will be able to parse a json file from consul
  *) 


end;;

let main () =
      let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in 
          (*Array.iter cat argv *)
          (* create an object*)
          (* The arguments should be, first the hosts file, second the
           * hostname, third the new ip
           *)
          let obj = new parseConsulJson in
            let json = obj#readJsonFromFile "example.json" in 
            let jsonStr= obj#getJsonElement "Value" json in
            obj#printNL (obj#decodeBase64 jsonStr)


let _ = main ()

