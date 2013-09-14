-module(shop).
-export([cost/1]).

cost(apples)    -> 2;
cost(milk)      -> 7;
cost(newspaper) -> 8;
cost(oranges)   -> 5;
cost(pears)     -> 9.

