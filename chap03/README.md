# NOTES

- Now should use `q()` to `init:stop()` instead of previous abort sequence.  

# Exercises

1. [Cheat Sheet](http://stefanalfbo.github.io/blog/2013/04/23/erlang-shell-cheat-sheet/)  
  - C-a - move the cursor to the beginning of the line.  
  - C-e - move the cursor to the end of the line.  
  - C-b - move the cursor left one character.  
  - C-f - move the cursor right one character.  
  - Tab - Tries to expand current module or function name  

1. Use `help()` in the shell
``` erlang
1> help().
** shell internal commands **
b()        -- display all variable bindings
e(N)       -- repeat the expression in query <N>
f()        -- forget all variable bindings
f(X)       -- forget the binding of variable X
h()        -- history
history(N) -- set how many previous commands to keep
results(N) -- set how many previous command results to keep
catch_exception(B) -- how exceptions are handled
v(N)       -- use the value of query <N>
rd(R,D)    -- define a record
rf()       -- remove all record information
rf(R)      -- remove record information about R
rl()       -- display all record information
rl(R)      -- display record information about R
rp(Term)   -- display Term using the shell's record information
rr(File)   -- read record information from File (wildcards allowed)
rr(F,R)    -- read selected record information from file(s)
rr(F,R,O)  -- read selected record information with options
** commands in module c **
bt(Pid)    -- stack backtrace for a process
c(File)    -- compile and load code in <File>
cd(Dir)    -- change working directory
flush()    -- flush any messages sent to the shell
help()     -- help info
i()        -- information about the system
ni()       -- information about the networked system
i(X,Y,Z)   -- information about pid <X,Y,Z>
l(Module)  -- load or reload module
lc([File]) -- compile a list of Erlang modules
ls()       -- list files in the current directory
ls(Dir)    -- list files in directory <Dir>
m()        -- which modules are loaded
m(Mod)     -- information about module <Mod>
memory()   -- memory allocation information
memory(T)  -- memory allocation information of type <T>
nc(File)   -- compile and load code in <File> on all nodes
nl(Module) -- load module on all nodes
pid(X,Y,Z) -- convert X,Y,Z to a Pid
pwd()      -- print working directory
q()        -- quit - shorthand for init:stop()
regs()     -- information about registered processes
nregs()    -- information about all registered processes
xm(M)      -- cross reference check a module
y(File)    -- generate a Yecc parser
** commands in module i (interpreter interface) **
ih()       -- print help for the i module
```

1. Working with tuples  
  1. Represent a house

    ``` erlang
1> House = {house, {address, {street, 12345 Powdermill Rd}, {city, Framingham}, {state, MA, Massachusetts}, {zip, 01702}}}.
* 1: syntax error before: Powdermill
1> House = {house, {address, {street, "12345 Powdermill Rd"}, {city, "Framingham"}, {state, "MA", "Massachusetts"}, {zip, "01702"}}}.
{house,{address,{street,"12345 Powdermill Rd"},
                {city,"Framingham"},
                {state,"MA","Massachusetts"},
                {zip,"01702"}}}
2> {house, {address, {street, streetVal}, {city, cityVal}, {state, stateVal}, {zip, zipVal}}} = House.
** exception error: no match of right hand side value {house,{address,{street,"12345 Powdermill Rd"},
                                                                      {city,"Framingham"},
                                                                      {state,"MA","Massachusetts"},
                                                                      {zip,"01702"}}}
3> {house, {address, {street, streetVal}, {city, cityVal}, {state, stateAbr, stateVal}, {zip, zipVal}}} = House.
** exception error: no match of right hand side value {house,{address,{street,"12345 Powdermill Rd"},
                                                                      {city,"Framingham"},
                                                                      {state,"MA","Massachusetts"},
                                                                      {zip,"01702"}}}
4> {house, {address, {street, Street}, {city, City}, {state, StateAbr, State}, {zip, Zip}}} = House.            
{house,{address,{street,"12345 Powdermill Rd"},
                {city,"Framingham"},
                {state,"MA","Massachusetts"},
                {zip,"01702"}}}
    ```
  1. Represent a street of houses

    ``` erlang
1> House = {house, {address, {street, "12345 Powdermill Rd"}, {city, "Framingham"}, {state, "MA", "Massachusetts"}, {zip, "01702"}}}.
{house,{address,{street,"12345 Powdermill Rd"},
                {city,"Framingham"},
                {state,"MA","Massachusetts"},
                {zip,"01702"}}}
2> Relatives = {house, {address, {street, "11555 Wisconsin Ave N"}, {city, "Minneapolis"}, {state, "MN", "Minnesota"}, {zip, "55316"}}}.
{house,{address,{street,"11555 Wisconsin Ave N"},
                {city,"Minneapolis"},
                {state,"MN","Minnesota"},
                {zip,"55316"}}}
3> StreetOfHomes = {street, [House, Relatives]}.
{street,[{house,{address,{street,"12345 Powdermill Rd"},
                         {city,"Framingham"},
                         {state,"MA","Massachusetts"},
                         {zip,"01702"}}},
         {house,{address,{street,"11555 Wisconsin Ave N"},
                         {city,"Minneapolis"},
                         {state,"MN","Minnesota"},
                         {zip,"55316"}}}]}
4> [HouseHead|T] = StreetOfHomes.
** exception error: no match of right hand side value {street,[{house,{address,{street,"12345 Powdermill Rd"},
                                                                               {city,"Framingham"},
                                                                               {state,"MA","Massachusetts"},
                                                                               {zip,"01702"}}},
                                                               {house,{address,{street,"11555 Wisconsin Ave N"},
                                                                               {city,"Minneapolis"},
                                                                               {state,"MN","Minnesota"},
                                                                               {zip,"55316"}}}]}
5> {street, [HouseHead|T]} = StreetOfHomes.
{street,[{house,{address,{street,"12345 Powdermill Rd"},
                         {city,"Framingham"},
                         {state,"MA","Massachusetts"},
                         {zip,"01702"}}},
         {house,{address,{street,"11555 Wisconsin Ave N"},
                         {city,"Minneapolis"},
                         {state,"MN","Minnesota"},
                         {zip,"55316"}}}]}
6> HouseHead.
{house,{address,{street,"12345 Powdermill Rd"},
                {city,"Framingham"},
                {state,"MA","Massachusetts"},
                {zip,"01702"}}}
7> T.       
[{house,{address,{street,"11555 Wisconsin Ave N"},
                 {city,"Minneapolis"},
                 {state,"MN","Minnesota"},
                 {zip,"55316"}}}]

    ```
