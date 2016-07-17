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
  (*
   *This method will return a list with lines that does not contain the string of the
   filter
   *)
  method appendToListNewIP incomingList hostname newIp=
    let newRecord = Printf.sprintf "%s %s" newIp hostname in
      newRecord::incomingList

end;;

let main () =
      let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in 
          (*Array.iter cat argv *)
          (* create an object*)
          (* The arguments should be, first the hosts file, second the
           * hostname, third the new ip
           *)
          let obj = new parseHosts in
          let hostsFile=argv.(0) in
          let hostname=argv.(1) in
          let newIp=argv.(2) in
          let cleanList=obj#excludeListLine (obj#readHosts hostsFile) hostname in
            (*obj#printHostsContents cleanList*)
            obj#printHostsContents (obj#appendToListNewIP cleanList hostname newIp)


let _ = main ()

