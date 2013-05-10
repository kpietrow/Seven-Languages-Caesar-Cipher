;;; Kevin Pietrow

;;; encrypt
(print "Encrypt function. Input is: hAl GooD, with a shift of 8")
(print 
(map 'string (lambda (c) 
	(if(/= (char-code c) 32) 
		(if (>(+(char-code c) 8) 90)
			(code-char(+ 64 (-(+(char-code c) 8) 90)))
		(code-char(+ (char-code c) 8)))
	(code-char 32)))(string-upcase "hAl GooD")))
	

;;; decrypt
(print "Decrypt function. Input is: HaL PiT, with a shift of 8")
(print
(map 'string (lambda (c) 
	(if(/= (char-code c) 32) 
		(if (<(-(char-code c) 8) 65)
			(code-char(- 91 (- 65 (-(char-code c) 8))))
		(code-char(- (char-code c) 8)))
	(code-char 32)))(string-upcase "HaL PiT")))



;;; solve
(print "Solve function. Input is: HaL PiT, with a max shift of 26")
(loop for num from 0 to 26 do 
(print (map 'string (lambda (c) 
	(if(/= (char-code c) 32) 
		(if (<(-(char-code c) num) 65)
			(code-char(- 91 (- 65 (-(char-code c) num))))
		(code-char(- (char-code c) num)))
	(code-char 32)))(string-upcase "HaL PiT"))))
	
	
