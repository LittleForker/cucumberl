-module(sample).

-include_lib("eunit/include/eunit.hrl").

-compile(export_all).

% Step definitions for the sample calculator Addition feature.

step([given, i, have, entered, N, into, the, calculator], _) ->
    enter(list_to_integer(atom_to_list(N)));

step(['when', i, press, Op], _) ->
    press(Op);

step(['then', the, result, should, be, Result, on, the, screen], _) ->
    [list_to_integer(atom_to_list(Result))] =:= get(calculator).

% Implementing a simple model here...

main() ->
    put(calculator, []),
    cucumberl:run("./features/sample.feature", [?MODULE]).

enter(N) ->
    put(calculator, [N | get(calculator)]).

press(Op) ->
    Result = apply(?MODULE, Op, get(calculator)),
    put(calculator, [Result]),
    Result.

add(X, Y) ->
    X + Y.

