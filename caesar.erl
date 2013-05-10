% Kevin Pietrow

-module(caesar).
-export([uppercase/1, encrypt2/2, encrypt/2, decrypt2/2, decrypt/2, solve/2]).

uppercase([L|T]) -> 
	if 
		L > 96 ->
			[(L - 32)|uppercase(T)];
		true ->
			[L|uppercase(T)]
	end;
uppercase([]) -> [].

encrypt2([H|T], X) ->
	if 
		H == 32 ->
			[H|encrypt2(T, X)];
		H + X > 90 ->
			[(64 + (H + X - 90))|encrypt2(T, X)];
		true ->
			[(H + X)|encrypt2(T, X)]
	end;
encrypt2([], X) -> [].

encrypt(L, X) -> encrypt2(uppercase(L), X).			
		
decrypt2([H|T], X) ->
	if 
		H == 32 ->
			[H|decrypt2(T, X)];
		H - X < 65 ->
			[(91 - (65 - (H - X)))|decrypt2(T, X)];
		true ->
			[(H - X)|decrypt2(T, X)]
	end;
decrypt2([], X) -> [].

decrypt(L, X) -> decrypt2(uppercase(L), X).			
		
solve(L, X) ->
	if
		X >= 0 ->
			string:concat(decrypt(L, X), string:concat(" | ", solve(L, (X - 1))));
		true ->
			[]
	end.
	