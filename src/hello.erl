%%%-------------------------------------------------------------------
%% @doc hello_erl worker
%% @end
%%%-------------------------------------------------------------------

-module(hello).

-export([start/0]).

start() ->
	loop().

loop() ->
	receive
		after 3000 ->
			io:format("hello, world~n"),
			loop()
	end.
