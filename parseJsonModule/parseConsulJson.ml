open Lwt
open Cohttp
open Cohttp_lwt_unix
class parseConsulJson = object (self)
  inherit ParseJsonBase.parseJsonBase
 (*
  A class that will be able to parse a json file from consul
  *) 

  method getConsul username password endpoint =
    let urlString=Printf.sprintf "http://%s:%s@consul.oncrete.gr/v1/kv/%s/externalIP" username password endpoint in
    Client.get (Uri.of_string urlString) >>= fun (resp, body) ->
    let code = resp |> Response.status |> Code.code_of_status in
    Printf.printf "Response code: %d\n" code;
    Printf.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);
    body |> Cohttp_lwt_body.to_string >|= fun body ->
    Printf.printf "Body of length: %d\n" (String.length body);
    body


end;;

let _ =
      let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in 
          (*Array.iter cat argv *)
          (* create an object*)
          (* The arguments should be, first the hosts file, second the
           * hostname, third the new ip
           *)
          let obj = new parseConsulJson in
            let endpointList = ["blackwood";"mnisikli"] in 
            let f elem= obj#printNL (Lwt_main.run (obj#getConsul username password elem)) in
              List.iter f endpointList



