// Kevin Pietrow

program caesar;

Var
  text : string;
  number : integer;
  i : integer;
  j : integer;
  k : integer;
  l : integer;
  m : integer;

function Upper (text : string) : string;
begin
     for i := 1 to Length(text) do begin
       if (ord(text[i]) > 90) then
         text[i] := chr(ord(text[i]) - 32)
     end;
     Upper := text;
end;

procedure Encrypt (text : string; number : integer);
begin
     text := Upper(text);
     for j := 1 to Length(text) do begin
       if (ord(text[j]) = 32) then
         text[j] := text[j]
       else
           if ((ord(text[j]) + number) > 90) then begin
             text[j] := chr(64 + (ord(text[j]) + number - 90));
           end
           else
             text[j] := chr(ord(text[j]) + number);
     end;
     writeln(text);
end;

procedure Decrypt (text : string; number : integer);
begin
     text := Upper(text);
     for k := 1 to Length(text) do begin
       if (ord(text[k]) = 32) then
         text[k] := text[k]
       else
           if ((ord(text[k]) - number) < 65) then begin
              text[k] := chr(91 - (65 - (ord(text[k]) - number)))
           end
           else
             text[k] := chr(ord(text[k]) - number);
       end;
     writeln(text)
end;

procedure Solve (text : string);
begin
     for m := 26 downto 0 do begin
       Decrypt(text, m);
     end
end;

begin
     writeln('Encrypt: "Pillar of Awesome zyx", 8');
     Encrypt('Pillar of Awesome zyx', 8);
     writeln('Decrypt: "Hello Mr Programmer", 13');
     Decrypt('Hello Mr Programmer', 13);
     writeln('Solve: "Programming with Pascal", 26');
     Solve('Programming with Pascal');
end.

