-module(new_listener).
-export([start/1]).

-define(PORT, 5007).
-define(TCP_OPTIONS, [list, {active, false}]).



start(Port) ->
    {ok, LSocket} = gen_tcp:listen(Port, ?TCP_OPTIONS),
    spawn(fun() -> acceptor(LSocket) end). 
	
	

acceptor(ListenSocket) ->
{ok, Socket} = gen_tcp:accept(ListenSocket),
spawn(fun() -> acceptor(ListenSocket) end),
loop(Socket).


loop(Sock) ->
    inet:setopts(Sock, [{active, once}]),
    receive
    {tcp, Socket, Data} ->
        io:format("Got packet\n"),
         
       condition(Data,Socket),
        loop(Socket);
    {tcp_closed, Socket}->
        io:format("Socket ~p closed\n", [Socket]);
    {tcp_error, Socket, Reason} ->
        io:format("Error on socket ~p reason: ~p\n", [Socket, Reason])
    end.
	
	
	
	
	
condition(SData,Sockp)->
 ListData= SData ,%binary_to_list(SData),

 

 
  io:fwrite("q2 ~p/n",[ListData]).
 
 
 
 
 
  

   
   
   

   
   
   
   
   
   

   
   
   
