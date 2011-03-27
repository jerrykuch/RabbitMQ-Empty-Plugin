-module(rabbit_empty_worker).

-behaviour(gen_server).

%% API
-export([start/0,
         start/2,
         start_link/0,
         stop/0]).

%% gen_server callbacks
-export([init/1, handle_call/3, handle_cast/2,
         handle_info/2, terminate/2, code_change/3]).

-record(state, {statename = no_name}).

start() ->
    start_link(),
    ok.

start(normal, []) ->
    start_link().

stop() ->
    ok.

start_link() ->
    gen_server:start_link({global, ?MODULE}, ?MODULE, [], []).

%% ---------------------------
%% Gen Server Implementation
%% --------------------------

init([]) ->
    {ok, #state{statename = just_started}}.

handle_call(Msg,_From,State) ->
    {reply, {ok, State}, State}.

handle_cast(_,State) ->
    {noreply,State}.

handle_info(_Info, State) ->
    {noreply, State}.

terminate(_Reason, _State) ->
    ok.

code_change(_OldVsn, State, _Extra) ->
    {ok, State}.
