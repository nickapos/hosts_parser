# hosts_parser

This little utility is an attempt to create an alternative approach to a dynamic dns client.
It will consume ip exposed in a consul key value store, using hostname as the key.
After it retrieves the data, it will parse the /etc/hosts and add an entry or replace an existing one.


The whole thing is written in ocaml
