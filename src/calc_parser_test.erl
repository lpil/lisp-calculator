-module(calc_parser_test).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").

parser_test_() ->
  [?_assertEqual(
      [],
      parse("")),
   ?_assertEqual(
      123,
      parse("123")),
   ?_assertEqual(
      [],
      parse("()"))].

parse(Code) ->
  {ok, Tokens, _} = calc_lexer:string(Code),
  {ok, Tree} = calc_parser:parse(Tokens),
  Tree.

-endif.
