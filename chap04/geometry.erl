-module(geometry).
-export([area/1, perimeter/1]).


area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> 3.1415926 * Radius;
area({right_triangle, Width, Height}) -> (Width * Height) / 2.

perimeter({rectangle, Width, Height}) -> Width * 2 + Height * 2;
perimeter({square, Side}) -> Side * 4;
perimeter({circle, Radius}) -> 2 * 3.1415926 * Radius;
perimeter({right_triangle, Width, Height}) -> math:sqrt(Width * Width + Height * Height).
