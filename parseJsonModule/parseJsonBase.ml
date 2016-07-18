open Yojson.Basic.Util
open ExtLib
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

  method readHosts filename =
    let chan = open_in filename in
        Std.input_list chan

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
   * Read a json and return its contents
   *)
  method readJsonFromFile fileName = 
    Yojson.Basic.from_file fileName
  (*
   *Retrieve an element from a json structure
   *)
  method getJsonElement elName json=
    json|> member elName|> to_string

  method decodeBase64 decString =
    Base64.str_decode (String.rchop (String.rchop decString))

end;;

(*let main () =
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


(*let _ = main ()*)

