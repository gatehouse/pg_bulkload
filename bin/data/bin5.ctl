TABLE = customer
TYPE = BINARY
INFILE = stdin
PARSE_BADFILE = ../results/bin5.prs
DUPLICATE_BADFILE = ../results/bin5.dup

COL = chaR 	( 	13 	) 	nulliF 	' 	null 	str 	'
COL = varchaR 	( 	4 	) 	nulliF 	' 	 	'
COL = smallinT 	( 	2 	) 	nulliF 	0000
COL = integeR 	( 	2 	) 	nulliF 	0123
COL = integeR 	( 	4 	)	nulliF 	01234567
COL = integeR 	( 	8 	)	nulliF 	0123456789ABCDEF
COL = biginT 	( 	8 	)	nulliF  0123456789abcdef
COL = unsigneD 	smallinT 	( 	2 	) 	nulliF 	0123
COL = unsigneD 	integeR 	( 	4 	)	nulliF 	01234567
COL = floaT 	( 	4 	)	nulliF 	01234567
COL = doublE	( 	8 	)	nulliF  0123456789ABCDEF
COL = characteR 	( 	13 	) 	nulliF 	'	 null	 str	 '
COL = characteR 	varyinG 	( 	4 	) 	nulliF	 ' 	 	'
COL = reaL 	( 	4 	)	nulliF 	01234567
COL = shorT 	( 	2 	) 	nulliF 	0000
COL = inT 	( 	4 	)	nulliF 	01234567
COL = lonG 	( 	8 	)	nulliF  0123456789ABCDEF
COL = unsigneD 	shorT 	( 	2 	) 	nulliF 	0123
COL = unsigneD 	inT 	( 	4 	)	nulliF 	01234567
COL = integeR 	nulliF 	01234567
