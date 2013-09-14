# Notes

# Exercises

1. See updated `geometry.erl`

1. `my_tuple_to_list(T)`

      ``` erlang
      1> c(lib_misc).
      {ok,lib_misc}
      2> lib_misc:my_tuple_to_list({1,2,3}).
      [1,2,3]
      3> lib_misc:my_tuple_to_list({3,2,1}).
      [3,2,1]
      ```

1. Custom Function Implementations

  1. `my_time_func(F)`

        ``` erlang
        1> c(lib_misc).
        {ok,lib_misc}
        2> F = fun() -> lists:seq(1,1000) end.
        #Fun<erl_eval.20.80484245>
        3> lib_misc:my_time_func(F).
        {90,
         [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,
          23,24,25,26,27|...]}
        ```
    
  1. `my_date_string()`

        ``` erlang
        1> c(lib_misc).
        {ok,lib_misc}
        2> lib_misc:my_date_string().
        2013-09-14T16:23:22
        ok
        ```
1. Compare with Python `datetime` module and implement missing

  Skipped.

1. Write `even(X)` and `odd(X)` functions
  ``` erlang
  1> c(math_functions).
  {ok,math_functions}
  2> math_functions:odd(1).
  true
  3> math_functions:odd(2).
  false
  4> math_functions:odd(3).
  true
  5> math_functions:odd(4).
  false
  6> math_functions:even(1).
  false
  7> math_functions:even(2).
  true
  8> math_functions:even(3).
  false
  9> math_functions:even(4).
  true
  ```
1. Add `filter(F,L)` function

  Skipped.

1. Add `split(L)` function

  Skipped.
