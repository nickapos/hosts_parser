open Lwt
open Cohttp
open Cohttp_lwt_unix
open ExtLib
class parseConsulJson = object (self)
  inherit ParseJsonBase.parseJsonBase
 (*
  A class that will be able to parse a json file from consul
  *) 

 (*
  *How do we do an http request
  *)
  method getConsul username password endpoint consulHost =
    let urlString=Printf.sprintf "http://%s:%s@%s/v1/kv/%s/externalIP" username password consulHost endpoint in
    Client.get (Uri.of_string urlString) >>= fun (resp, body) ->
    (*let code = resp |> Response.status |> Code.code_of_status in
    Printf.printf "Response code: %d\n" code;
    Printf.printf "Headers: %s\n" (resp |> Response.headers |> Header.to_string);*)
    body |> Cohttp_lwt_body.to_string >|= fun body ->
    (*Printf.printf "Body of length: %d\n" (String.length body);*)
    body

  (*
   * Parsing the credentials json
   *)
  method getJsonField credJson fieldname= 
     let json = self#readJsonFromFile credJson in 
      self#getJsonElement fieldname json 
  
  (*
   *Combining the above in order to retrieve the ip from the json
   *)
  method getIP credFile endpoint =
    let username = self#getJsonField credFile "username" in
    let password = self#getJsonField credFile "password" in
    let consulHost = self#getJsonField credFile "consulHost" in
    let consulJsonStrBR = Lwt_main.run (self#getConsul username password endpoint consulHost) in
    let consulJsonStr=String.strip ~chars:"[]" consulJsonStrBR in
    let consulJson = self#readJsonFromString consulJsonStr in
    let ipStr=self#getJsonElement "Value" consulJson in
      self#decodeBase64 ipStr

end;;

(*let _ =
      let len = (Array.length Sys.argv) in
        let argv = (Array.sub Sys.argv 1 (len-1)) in
          (*Array.iter cat argv *)
          (* create an object*)
          (* The arguments should be, first the hosts file, second the
           * hostname, third the new ip
           *)
          let obj = new parseConsulJson in
          let hostname=argv.(0) in
          let credfile=argv.(1) in
          let username = obj#getJsonField credfile "username" in
            let getJson = obj#getConsul username "E9C9GZMATLgsvYxo" "mnisikli" "consul.oncrete.gr" in
            let jsonStr= Lwt_main.run (getJson) in
            let consulJsonStr=String.strip ~chars:"[]" jsonStr in
            let consulJson = obj#readJsonFromString consulJsonStr in
            let ipStr=obj#getJsonElement "Value" consulJson in
            obj#printNL  (obj#decodeBase64 ipStr)*)



