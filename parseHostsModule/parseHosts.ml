open ExtLib
class parseHosts = object (self)
 (*
  A class that will open /etc/hosts and parse its content
  *) 

  method printNL str =
    (*
      * Print a string with a new line
      *)
    Printf.printf "%s\n" str

  method readHosts =
    let chan = open_in "/etc/hosts" in
        Std.input_list chan

  (*
   *This method will print the contents of a list line by line
   *)
  method printHostsContents lines = match lines with
      | [] -> self#printNL "End of file" 
      | x::xs -> 
          begin
            self#printNL x;
            self#printHostsContents xs
          end
  (*
   *This method will return a list with lines that contain the string of the
   filter
   *)
  method includeListLine incomingList filterStr=
    List.filter (fun x -> String.exists x filterStr) incomingList
  
  (*
   *This method will return a list with lines that does not contain the string of the
   filter
   *)
  method excludeListLine incomingList filterStr=
    List.filter (fun x -> not (String.exists x filterStr)) incomingList

end;;

let main () =
      (*let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in (* skip argv0 *)
          Array.iter cat argv *)
          (* create an object*)
          let obj = new parseHosts in
            obj#printHostsContents (obj#excludeListLine obj#readHosts "localhost")


let _ = main ()

