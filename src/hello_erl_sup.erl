%%%-------------------------------------------------------------------
%% @doc hello_erl top level supervisor
%% @end
%%%-------------------------------------------------------------------

-module(hello_erl_sup).

-behaviour(supervisor).

-export([start_link/0]).

-export([init/1]).

-define(SERVER, ?MODULE).

start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).

init([]) ->
    SupFlags = #{strategy => one_for_all,
		 intensity => 0,
		 period => 1},
    ChildSpecs = [#{id => hello_erl_worker,
		    start => {hello, start, []},
		    restart => permanent,
		    shutdown => brutal_kill,
		    type => worker,
		    modules => []}],
    {ok, {SupFlags, ChildSpecs}}.
