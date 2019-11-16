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
		after 5000 ->
			io:format("hello, world~n")
	end,
	loop().
