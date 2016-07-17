open ExtString
class parseHostsLine = object (self)
 (*
  A class that will parse an /etc/hosts line and allow us to replace parts of
  it
  *) 

  method printNL str =
    (*
      * Print a string with a new line
      *)
    Printf.printf "%s\n" str


  method printHostsLineContents line = 
    String.nsplit line " "
    
  method iterateOverLineContents lineList = match lineList with
      | [] -> self#printNL "End of line" 
      | x::xs -> 
          begin
            self#printNL x;
            self#iterateOverLineContents xs
          end
  

end;;

let main () =
      (*let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in (* skip argv0 *)
          Array.iter cat argv *)
          (* create an object*)
          let obj = new parseHostsLine in
            obj#iterateOverLineContents (obj#printHostsLineContents "0.0.0.0 blah.blah" )


let _ = main ()

