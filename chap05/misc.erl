-module(misc).
-export([map_search_pred/3]).

% map_search_pred(Map, Pred, Default) ->
% 	Keys = maps:keys(Map),
% 	case lists:dropwhile(fun(E) -> not Pred(E) end, Keys) of
% 	            [] -> Default;
% 	            [F | _] -> F
% 	end.
