class parseHosts = object (self)
 (*
  A class that will open /etc/hosts and parse its content
  *) 

  (*method e t =
    (*
     *method that
     *calculates the e0
     *from temperature
     *)
    0.6108*.exp(17.27*.t/.(t+.237.3))
  
  method calc_es tmin tmax = 
    (*
     * This method will calculate the es using the above 
     * methods
    *)
    (self#e tmin +. self#e tmax )/.2.0
    *)
    method printNL str =
      (*
       * Print a string with a new line
       *)
      Printf.printf "%s\n" str

    method readHosts =
      let chan = open_in "/etc/hosts" in
         Std.input_list chan

  method printHostsContents lines = match lines with
      | [] -> self#printNL "End of file" 
      | x::xs -> 
          begin
            self#printNL x;
            self#printHostsContents xs
          end
    

end;;

let main () =
      (*let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in (* skip argv0 *)
          Array.iter cat argv *)
          (* create an object*)
          let obj = new parseHosts in
            obj#printHostsContents obj#readHosts


let _ = main ()

