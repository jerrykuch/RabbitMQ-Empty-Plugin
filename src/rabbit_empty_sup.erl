%%%-------------------------------------------------------------------
%%% @author Jerry Kuch <jerryk@Homsar.local>
%%% @copyright (C) 2011, Jerry Kuch
%%% @doc
%%%
%%% @end
%%% Created :  4 Jan 2011 by Jerry Kuch <jerryk@Homsar.local>
%%%-------------------------------------------------------------------
-module(rabbit_empty_sup).

-behaviour(supervisor).

%% API
-export([start_link/0]).

%% Supervisor callbacks
-export([init/1]).

-define(SERVER, ?MODULE).

%%%===================================================================
%%% API functions
%%%===================================================================

%%--------------------------------------------------------------------
%% @doc
%% Starts the supervisor
%%
%% @spec start_link() -> {ok, Pid} | ignore | {error, Error}
%% @end
%%--------------------------------------------------------------------
start_link() ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, _Arg = []).

%%%===================================================================
%%% Supervisor callbacks
%%%===================================================================

%%--------------------------------------------------------------------
%% @private
%% @doc
%% Whenever a supervisor is started using supervisor:start_link/[2,3],
%% this function is called by the new process to find out about
%% restart strategy, maximum restart frequency and child
%% specifications.
%%
%% @spec init(Args) -> {ok, {SupFlags, [ChildSpec]}} |
%%                     ignore |
%%                     {error, Reason}
%% @end
%%--------------------------------------------------------------------
init([]) ->
    Server = {rabbit_empty_worker,
              {rabbit_empty_worker, start_link, []},
              permanent,
              10000,
              worker,
              [rabbit_empty_worker]},
    Children = [Server],
    RestartStrategy = {one_for_one, 3, 10},
    ok = supervisor:check_childspecs(Children),
    {ok, {RestartStrategy, Children}}.


%%%===================================================================
%%% Internal functions
%%% ===================================================================
