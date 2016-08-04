open Yojson.Basic.Util
open ExtLib
class parseJsonBase = object (self)
 (*
  A class that will be able to parse a json file
  *) 

  method printNL str =
    (*
      * Print a string with a new line
      *)
    Printf.printf "%s\n" str

  (*
   *This method will print the contents of a list line by line
   *)
  method printHostsContents lines = match lines with
      | [] -> self#printNL "" 
      | x::xs -> 
          begin
            self#printNL x;
            self#printHostsContents xs
          end
  (*
   * Read a json from a file and return its contents
   *)
  method readJsonFromFile fileName = 
    Yojson.Basic.from_file fileName
  (*
   * Read a json from a string and return its contents
   *)
  method readJsonFromString jsonString = 
    Yojson.Basic.from_string jsonString
  (*
   *Retrieve an element from a json structure
   *)
  method getJsonElement elName json=
    json|> member elName|> to_string

  method decodeBase64 decString =
    Base64.str_decode (String.rchop decString)

end;;

(*let _ =
      let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in 
          (*Array.iter cat argv *)
          (* create an object*)
          (* The arguments should be, first the hosts file, second the
           * hostname, third the new ip
           *)
          let obj = new parseJsonBase in
            let json = obj#readJsonFromFile "example.json" in 
            let jsonStr= obj#getJsonElement "Value" json in
            obj#printNL (obj#decodeBase64 jsonStr) *)




