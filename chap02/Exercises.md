1. Start and Stop the Erlang Shell
Start: `erl`
Stop: `Ctrl + C, a, <enter>`

1. Type in a few commands in the shell
`123 * 456.`
`X = 123. X * 456.`

1. Compile and run `hello.erl` in Erlang Shell
`c(hello).`
`hello:start().`

1. Run the file client and server code
**Note**: See modified `afile_server`, `afile_client` code
Man page: [http://www.erlang.org/doc/man/file.html#write_file-2](http://www.erlang.org/doc/man/file.html#write_file-2)
``` erlang
1> c(afile_server).
{ok,afile_server}
2> c(afile_client).
{ok,afile_client}
3> Server = afile_server:start(".").
<0.47.0>
4> afile_client:ls(Server).
{ok,["afile_server.erl","afile_client.erl",
     "afile_client.beam","Exercises.md","afile_server.beam",
     "hello.erl","hello.beam"]}
5> afile_client:get_file(FileServer, "missing").
{error,enoent}
6> afile_client:put_file(Server, "test", "it works!").
ok
7> afile_client:ls(Server).                           
{ok,["afile_server.erl","afile_client.erl",
     "afile_client.beam","Exercises.md","afile_server.beam",
     "test","hello.erl","hello.beam"]}
8> afile_client:get_file(Server, "test").
{ok,<<"it works!">>}

```
