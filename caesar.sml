(* Kevin Pietrow *)

open String;
open Int;

fun uppercase(nil) = nil
	| uppercase(x::xs) =
		if ord(x) > 91 then chr(ord(x) - 32) :: uppercase(xs)
		else x :: uppercase(xs);
		
fun encrypt2(nil, num:int) = nil
| encrypt2(x::xs, num:int) =
	if ord(x) = 32 then x :: encrypt2(xs, num)
	else if (ord(x) + num > 90) then chr(64 + ((ord(x) + num) - 90)) :: encrypt2(xs, num)
	else chr(ord(x) + num) :: encrypt2(xs, num);
	
fun decrypt2(nil, num:int) = nil
| decrypt2(x::xs, num:int) =
	if ord(x) = 32 then x :: decrypt2(xs, num)
	else if ((ord(x) - num) < 65) then chr(91 - (65 - (ord(x) - num))) :: decrypt2(xs, num)
	else chr(ord(x) - num) :: decrypt2(xs, num);
	
fun encrypt("":string, num:int) = ""
| encrypt(input:string, num:int) =
	implode(encrypt2(uppercase(explode(input)), num));
	
fun decrypt("":string, num:int) = ""
| decrypt(input:string, num:int) =
	implode(decrypt2(uppercase(explode(input)), num));


fun solve2(input:string, ~1) = ""
| solve2(input:string, num:int) = 
	let
		val text = decrypt(input, num) ^ "\n"
	in 
		text ^ solve2(input, num - 1)
	end;	

fun solve("":string, num:int) = print("")
| solve(input:string, 0) = print(encrypt(input, 0) ^ "\n")
| solve(input:string, num:int) = print(solve2(input, num));

	