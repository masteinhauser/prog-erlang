-module(lib_misc).
-export([for/3, my_tuple_to_list/1, my_time_func/1, my_date_string/0]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F)   -> [F(I)|for(I+1, Max, F)].

my_tuple_to_list({})    -> [];
my_tuple_to_list(Tuple) -> [element(1, Tuple)|my_tuple_to_list(erlang:delete_element(1, Tuple))].

my_time_func(F) -> Start = now(),
		   RVal = F(),
		   End = now(),
		   {timer:now_diff(End,Start), RVal}.

my_date_string() -> {Year, Month, Day} = erlang:date(),
		    {Hour, Minute, Second} = erlang:time(),
		    io:format("~B-~2..0B-~2..0BT~2..0B:~2..0B:~2..0B~n", [Year, Month, Day, Hour, Minute, Second]). 
