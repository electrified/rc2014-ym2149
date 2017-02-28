; z80dasm 1.1.3
; command line: z80dasm -a -g 0xC000 -o disasm.asm test2_INIT.rom

	org	0c000h

	jp 0c04bh		;c000
	jp 0c833h		;c003
	jp 0c838h		;c006
	jp 0c079h		;c009
	jp 0c119h		;c00c
	jp 0c11fh		;c00f
	jp 0c126h		;c012
	jp 0c1d7h		;c015
	jp 0c17dh		;c018
	jp 0c187h		;c01b
	jp 0c191h		;c01e
	jp 0c19bh		;c021
	jp 0c1a5h		;c024
	jp 0c22ah		;c027
	jp 0c24ch		;c02a
	jp 0c1afh		;c02d
	jp 0c25bh		;c030
	jp 0c295h		;c033
	jp 0c2a9h		;c036
	jp 0c1b9h		;c039
	jp 0c2bbh		;c03c
	jp 0c6cbh		;c03f
	jp 0c6d5h		;c042
	jp 0cb19h		;c045
	jp 0cb27h		;c048
	ld de,0c46eh		;c04b
	ld hl,0c39dh		;c04e
	ld a,006h		;c051
	ld (0c07fh),a		;c053
	xor a			;c056
	ld (0c146h),a		;c057
	ld (0c17ch),a		;c05a
	inc a			;c05d
	ld (0c07ah),a		;c05e
	ld (0c6c8h),de		;c061
	ld (0c6c6h),hl		;c065
	call 0c208h		;c068
	ld a,00ch		;c06b
	ld c,030h		;c06d
	call 0c107h		;c06f
	ld a,008h		;c072
	ld c,01fh		;c074
	jp 0c107h		;c076
	ld a,003h		;c079
	dec a			;c07b
	jr nz,$+4		;c07c
	ld a,006h		;c07e
	ld (0c07ah),a		;c080
	ret nz			;c083
	call 0c08bh		;c084
	call 0c0d1h		;c087
	ret			;c08a
	ld hl,(0c6c6h)		;c08b
	inc hl			;c08e
	ld a,(hl)			;c08f
	ld (0c6c6h),hl		;c090
	cp 0ffh		;c093
	jr nz,$+13		;c095
	inc hl			;c097
	inc hl			;c098
	inc hl			;c099
	ld e,(hl)			;c09a
	inc hl			;c09b
	ld d,(hl)			;c09c
	ld (0c6c6h),de		;c09d
	ld a,(de)			;c0a1
	or a			;c0a2
	ret z			;c0a3
	cp 080h		;c0a4
	jr nz,$+6		;c0a6
	ld c,000h		;c0a8
	jr $+33		;c0aa
	and 07fh		;c0ac
	ld l,a			;c0ae
	ld h,000h		;c0af
	add hl,hl			;c0b1
	ld de,0c2f9h		;c0b2
	add hl,de			;c0b5
	ld c,(hl)			;c0b6
	xor a			;c0b7
	call 0c107h		;c0b8
	inc hl			;c0bb
	ld c,(hl)			;c0bc
	ld a,001h		;c0bd
	call 0c107h		;c0bf
	ld c,000h		;c0c2
	ld a,00dh		;c0c4
	call 0c107h		;c0c6
	ld c,01fh		;c0c9
	ld a,008h		;c0cb
	call 0c107h		;c0cd
	ret			;c0d0
	ld hl,(0c6c8h)		;c0d1
	inc hl			;c0d4
	ld a,(hl)			;c0d5
	cp 0ffh		;c0d6
	ld (0c6c8h),hl		;c0d8
	jr nz,$+11		;c0db
	inc hl			;c0dd
	ld e,(hl)			;c0de
	inc hl			;c0df
	ld d,(hl)			;c0e0
	ld (0c6c8h),de		;c0e1
	ld a,(de)			;c0e5
	or a			;c0e6
	jr z,$+25		;c0e7
	ld l,a			;c0e9
	ld h,000h		;c0ea
	add hl,hl			;c0ec
	ld de,0c2f9h		;c0ed
	add hl,de			;c0f0
	ld c,(hl)			;c0f1
	ld a,004h		;c0f2
	call 0c107h		;c0f4
	inc hl			;c0f7
	ld c,(hl)			;c0f8
	ld a,005h		;c0f9
	call 0c107h		;c0fb
	ld a,00dh		;c0fe
	ld c,a			;c100
	ld a,00ah		;c101
	call 0c107h		;c103
	ret			;c106
	push af			;c107
	push bc			;c108
	push bc			;c109
	ld bc,0fffdh		;c10a
	out (c),a		;c10d
	pop bc			;c10f
	ld a,c			;c110
	ld bc,0bffdh		;c111
	out (c),a		;c114
	pop bc			;c116
	pop af			;c117
	ret			;c118
	ld c,01fh		;c119
	ld a,080h		;c11b
	jr $+9		;c11d
	ld a,r		;c11f
	ld c,a			;c121
	ld a,020h		;c122
	jr $+2		;c124
	ld (0c146h),a		;c126
	xor a			;c129
	ld (0c17ch),a		;c12a
	ld a,006h		;c12d
	call 0c107h		;c12f
	ld a,007h		;c132
	ld c,028h		;c134
	call 0c107h		;c136
	ld a,002h		;c139
	ld c,000h		;c13b
	call 0c107h		;c13d
	ld a,003h		;c140
	call 0c107h		;c142
	ret			;c145
	nop			;c146
	ld hl,0c146h		;c147
	ld a,(hl)			;c14a
	or a			;c14b
	jr nz,$+26		;c14c
	ld a,007h		;c14e
	ld c,038h		;c150
	call 0c107h		;c152
	ld a,009h		;c155
	ld c,000h		;c157
	call 0c107h		;c159
	ld a,002h		;c15c
	call 0c107h		;c15e
	inc a			;c161
	call 0c107h		;c162
	ret			;c165
	dec a			;c166
	ld (hl),a			;c167
	and 007h		;c168
	ret nz			;c16a
	xor (hl)			;c16b
	rra			;c16c
	rra			;c16d
	rra			;c16e
	and 00fh		;c16f
	ld c,a			;c171
	ld a,009h		;c172
	call 0c107h		;c174
	ret			;c177
	nop			;c178
	ex af,af'			;c179
	ret po			;c17a
	rst 38h			;c17b
	ld b,b			;c17c
	ld a,0ffh		;c17d
	ld hl,00000h		;c17f
	ld bc,00002h		;c182
	jr $+60		;c185
	ld a,0ffh		;c187
	ld hl,00400h		;c189
	ld bc,0fffch		;c18c
	jr $+50		;c18f
	ld a,0ffh		;c191
	ld hl,00800h		;c193
	ld bc,0fff8h		;c196
	jr $+40		;c199
	ld a,040h		;c19b
	ld hl,00800h		;c19d
	ld bc,0ffe0h		;c1a0
	jr $+30		;c1a3
	ld a,0deh		;c1a5
	ld hl,00b46h		;c1a7
	ld bc,0000dh		;c1aa
	jr $+20		;c1ad
	ld a,010h		;c1af
	ld hl,00fffh		;c1b1
	ld bc,0ff00h		;c1b4
	jr $+10		;c1b7
	ld a,0ffh		;c1b9
	ld hl,00001h		;c1bb
	ld bc,00001h		;c1be
	ld (0c178h),hl		;c1c1
	ld (0c17ah),bc		;c1c4
	ld (0c17ch),a		;c1c8
	xor a			;c1cb
	ld (0c146h),a		;c1cc
	ld c,038h		;c1cf
	ld a,007h		;c1d1
	call 0c107h		;c1d3
	ret			;c1d6
	ld hl,0c17ch		;c1d7
	ld a,(hl)			;c1da
	or a			;c1db
	jp z,0c147h		;c1dc
	dec a			;c1df
	ld (hl),a			;c1e0
	ld c,00fh		;c1e1
	ld a,009h		;c1e3
	call 0c107h		;c1e5
	ld bc,(0c17ah)		;c1e8
	ld hl,(0c178h)		;c1ec
	ld a,l			;c1ef
	xor 080h		;c1f0
	ld l,a			;c1f2
	add hl,bc			;c1f3
	ld (0c178h),hl		;c1f4
	ld c,l			;c1f7
	ld a,002h		;c1f8
	call 0c107h		;c1fa
	ld bc,(0c178h)		;c1fd
	ld c,h			;c201
	ld a,003h		;c202
	call 0c107h		;c204
	ret			;c207
	ld hl,0c21ch		;c208
	ld b,00eh		;c20b
	push bc			;c20d
	ld c,(hl)			;c20e
	ld a,b			;c20f
	sub 00eh		;c210
	neg		;c212
	call 0c107h		;c214
	pop bc			;c217
	inc hl			;c218
	djnz $-12		;c219
	ret			;c21b
	nop			;c21c
	nop			;c21d
	nop			;c21e
	nop			;c21f
	nop			;c220
	nop			;c221
	nop			;c222
	jr c,$+2		;c223
	nop			;c225
	nop			;c226
	nop			;c227
	nop			;c228
	nop			;c229
	ld a,007h		;c22a
	ld bc,0fffdh		;c22c
	out (c),a		;c22f
	in a,(c)		;c231
	xor 010h		;c233
	ld bc,0bffdh		;c235
	out (c),a		;c238
	ld a,r		;c23a
	and 01fh		;c23c
	ld c,a			;c23e
	ld a,006h		;c23f
	call 0c107h		;c241
	ld a,009h		;c244
	ld c,00fh		;c246
	call 0c107h		;c248
	ret			;c24b
	ld c,038h		;c24c
	ld a,007h		;c24e
	call 0c107h		;c250
	ld a,009h		;c253
	ld c,000h		;c255
	call 0c107h		;c257
	ret			;c25a
	ld bc,0fffdh		;c25b
	ld a,004h		;c25e
	out (c),a		;c260
	in l,(c)		;c262
	inc a			;c264
	out (c),a		;c265
	in h,(c)		;c267
	ld de,00001h		;c269
	add hl,de			;c26c
	ld bc,0bffdh		;c26d
	out (c),h		;c270
	ld bc,0fffdh		;c272
	ld a,004h		;c275
	out (c),a		;c277
	ld bc,0bffdh		;c279
	out (c),l		;c27c
	ld a,000h		;c27e
	dec a			;c280
	ld (0c27fh),a		;c281
	and 003h		;c284
	ret nz			;c286
	ld hl,(0c26ah)		;c287
	ld a,l			;c28a
	neg		;c28b
	ld l,a			;c28d
	ld a,h			;c28e
	cpl			;c28f
	ld h,a			;c290
	ld (0c26ah),hl		;c291
	ret			;c294
	ld bc,0fffdh		;c295
	ld a,007h		;c298
	out (c),a		;c29a
	in a,(c)		;c29c
	ld (0c6cah),a		;c29e
	ld bc,0bffdh		;c2a1
	ld a,03fh		;c2a4
	out (c),a		;c2a6
	ret			;c2a8
	ld bc,0fffdh		;c2a9
	ld a,007h		;c2ac
	out (c),a		;c2ae
	ld bc,0bffdh		;c2b0
	ld a,(0c6cah)		;c2b3
	out (c),a		;c2b6
	ret			;c2b8
	nop			;c2b9
	rst 38h			;c2ba
	ld hl,0c2bah		;c2bb
	ld a,(hl)			;c2be
	or a			;c2bf
	jr z,$+3		;c2c0
	dec (hl)			;c2c2
	ld bc,0effeh		;c2c3
	in a,(c)		;c2c6
	rra			;c2c8
	jr c,$+40		;c2c9
	ld bc,0fefeh		;c2cb
	in a,(c)		;c2ce
	rra			;c2d0
	jr c,$+32		;c2d1
	ld a,(hl)			;c2d3
	or a			;c2d4
	jr nz,$+28		;c2d5
	ld (hl),032h		;c2d7
	ld a,(0c2b9h)		;c2d9
	cpl			;c2dc
	ld (0c2b9h),a		;c2dd
	or a			;c2e0
	jp z,0c04bh		;c2e1
	ld a,008h		;c2e4
	ld c,000h		;c2e6
	call 0c107h		;c2e8
	add a,002h		;c2eb
	call 0c107h		;c2ed
	ret			;c2f0
	ld a,(0c2b9h)		;c2f1
	or a			;c2f4
	call z,0c079h		;c2f5
	ret			;c2f8
	cp h			;c2f9
	inc bc			;c2fa
	add a,(hl)			;c2fb
	inc bc			;c2fc
	ld d,e			;c2fd
	inc bc			;c2fe
	inc h			;c2ff
	inc bc			;c300
	or 002h		;c301
	call z,0a402h		;c303
	ld (bc),a			;c306
	ld a,(hl)			;c307
	ld (bc),a			;c308
	ld e,d			;c309
	ld (bc),a			;c30a
	jr c,$+4		;c30b
	jr $+4		;c30d
	jp m,0de01h		;c30f
	ld bc,001c3h		;c312
	xor d			;c315
	ld bc,00192h		;c316
	ld a,e			;c319
	ld bc,00166h		;c31a
	ld d,d			;c31d
	ld bc,0013fh		;c31e
	dec l			;c321
	ld bc,0011ch		;c322
	inc c			;c325
	ld bc,000fdh		;c326
	rst 28h			;c329
	nop			;c32a
	pop hl			;c32b
	nop			;c32c
	push de			;c32d
	nop			;c32e
	ret			;c32f
	nop			;c330
	cp (hl)			;c331
	nop			;c332
	or e			;c333
	nop			;c334
	xor c			;c335
	nop			;c336
	sbc a,a			;c337
	nop			;c338
	sub (hl)			;c339
	nop			;c33a
	adc a,(hl)			;c33b
	nop			;c33c
	add a,(hl)			;c33d
	nop			;c33e
	ld a,a			;c33f
	nop			;c340
	ld (hl),a			;c341
	nop			;c342
	ld (hl),c			;c343
	nop			;c344
	ld l,d			;c345
	nop			;c346
	ld h,h			;c347
	nop			;c348
	ld e,a			;c349
	nop			;c34a
	ld e,c			;c34b
	nop			;c34c
	ld d,h			;c34d
	nop			;c34e
	ld d,b			;c34f
	nop			;c350
	ld c,e			;c351
	nop			;c352
	ld b,a			;c353
	nop			;c354
	ld b,e			;c355
	nop			;c356
	ccf			;c357
	nop			;c358
	inc a			;c359
	nop			;c35a
	jr c,$+2		;c35b
	dec (hl)			;c35d
	nop			;c35e
	ld (02f00h),a		;c35f
	nop			;c362
	dec l			;c363
	nop			;c364
	ld hl,(02800h)		;c365
	nop			;c368
	ld h,000h		;c369
	inc h			;c36b
	nop			;c36c
	ld (02000h),hl		;c36d
	nop			;c370
	inc bc			;c371
	dec b			;c372
	rlca			;c373
	inc bc			;c374
	inc bc			;c375
	dec b			;c376
	rlca			;c377
	inc bc			;c378
	inc bc			;c379
	dec b			;c37a
	rlca			;c37b
	inc bc			;c37c
	inc bc			;c37d
	dec b			;c37e
	rlca			;c37f
	inc bc			;c380
	inc bc			;c381
	dec b			;c382
	rlca			;c383
	inc bc			;c384
	inc bc			;c385
	dec b			;c386
	rlca			;c387
	inc bc			;c388
	inc bc			;c389
	dec b			;c38a
	rlca			;c38b
	nop			;c38c
	inc bc			;c38d
	dec b			;c38e
	rlca			;c38f
	nop			;c390
	inc bc			;c391
	dec b			;c392
	rlca			;c393
	nop			;c394
	inc bc			;c395
	dec b			;c396
	rlca			;c397
	nop			;c398
	rst 38h			;c399
	ld l,a			;c39a
	call nz,0c39eh		;c39b
	inc d			;c39e
	add a,b			;c39f
	inc d			;c3a0
	dec e			;c3a1
	nop			;c3a2
	nop			;c3a3
	nop			;c3a4
	nop			;c3a5
	dec e			;c3a6
	dec de			;c3a7
	add hl,de			;c3a8
	jr $+24		;c3a9
	add a,b			;c3ab
	ld d,01dh		;c3ac
	nop			;c3ae
	nop			;c3af
	nop			;c3b0
	nop			;c3b1
	nop			;c3b2
	nop			;c3b3
	nop			;c3b4
	nop			;c3b5
	ld d,080h		;c3b6
	ld d,022h		;c3b8
	nop			;c3ba
	nop			;c3bb
	nop			;c3bc
	nop			;c3bd
	ld (01e20h),hl		;c3be
	dec e			;c3c1
	rla			;c3c2
	inc e			;c3c3
	jr nz,$+23		;c3c4
	ld a,(de)			;c3c6
	ld e,014h		;c3c7
	add a,b			;c3c9
	inc d			;c3ca
	dec e			;c3cb
	nop			;c3cc
	nop			;c3cd
	nop			;c3ce
	nop			;c3cf
	dec e			;c3d0
	dec de			;c3d1
	add hl,de			;c3d2
	jr $+24		;c3d3
	add a,b			;c3d5
	ld d,01dh		;c3d6
	nop			;c3d8
	nop			;c3d9
	nop			;c3da
	nop			;c3db
	nop			;c3dc
	nop			;c3dd
	nop			;c3de
	nop			;c3df
	ld d,080h		;c3e0
	ld d,022h		;c3e2
	nop			;c3e4
	nop			;c3e5
	nop			;c3e6
	nop			;c3e7
	ld (01e20h),hl		;c3e8
	dec e			;c3eb
	rla			;c3ec
	inc e			;c3ed
	jr nz,$+23		;c3ee
	ld a,(de)			;c3f0
	ld e,012h		;c3f1
	add a,b			;c3f3
	ld (de),a			;c3f4
	dec de			;c3f5
	nop			;c3f6
	nop			;c3f7
	nop			;c3f8
	nop			;c3f9
	dec de			;c3fa
	add hl,de			;c3fb
	rla			;c3fc
	ld (de),a			;c3fd
	rla			;c3fe
	add a,b			;c3ff
	rla			;c400
	jr nz,$+2		;c401
	nop			;c403
	nop			;c404
	nop			;c405
	nop			;c406
	nop			;c407
	nop			;c408
	nop			;c409
	rra			;c40a
	nop			;c40b
	nop			;c40c
	dec e			;c40d
	nop			;c40e
	nop			;c40f
	inc e			;c410
	nop			;c411
	jr $+30		;c412
	nop			;c414
	dec e			;c415
	rra			;c416
	nop			;c417
	nop			;c418
	dec e			;c419
	nop			;c41a
	nop			;c41b
	inc e			;c41c
	nop			;c41d
	jr $+30		;c41e
	nop			;c420
	rra			;c421
	dec e			;c422
	nop			;c423
	nop			;c424
	ld a,(de)			;c425
	nop			;c426
	nop			;c427
	ld d,000h		;c428
	ld d,01ah		;c42a
	nop			;c42c
	dec e			;c42d
	dec de			;c42e
	nop			;c42f
	nop			;c430
	jr $+2		;c431
	nop			;c433
	inc d			;c434
	nop			;c435
	inc d			;c436
	jr $+2		;c437
	dec de			;c439
	rra			;c43a
	nop			;c43b
	nop			;c43c
	dec e			;c43d
	nop			;c43e
	nop			;c43f
	inc e			;c440
	nop			;c441
	jr $+30		;c442
	nop			;c444
	dec e			;c445
	rra			;c446
	nop			;c447
	nop			;c448
	dec e			;c449
	nop			;c44a
	nop			;c44b
	inc e			;c44c
	nop			;c44d
	jr $+30		;c44e
	nop			;c450
	rra			;c451
	dec e			;c452
	nop			;c453
	nop			;c454
	ld a,(de)			;c455
	nop			;c456
	nop			;c457
	ld d,000h		;c458
	ld d,01ah		;c45a
	nop			;c45c
	dec e			;c45d
	dec de			;c45e
	nop			;c45f
	nop			;c460
	jr $+2		;c461
	nop			;c463
	inc d			;c464
	nop			;c465
	inc d			;c466
	jr $+2		;c467
	dec de			;c469
	rst 38h			;c46a
	nop			;c46b
	nop			;c46c
	ld a,0c5h		;c46d
	dec c			;c46f
	nop			;c470
	dec c			;c471
	dec c			;c472
	nop			;c473
	dec c			;c474
	dec c			;c475
	nop			;c476
	dec c			;c477
	dec c			;c478
	inc c			;c479
	dec c			;c47a
	ld a,(bc)			;c47b
	nop			;c47c
	ld a,(bc)			;c47d
	ld a,(bc)			;c47e
	nop			;c47f
	ld a,(bc)			;c480
	ld a,(bc)			;c481
	nop			;c482
	ld a,(bc)			;c483
	ld a,(bc)			;c484
	nop			;c485
	ex af,af'			;c486
	ld b,000h		;c487
	ld b,006h		;c489
	nop			;c48b
	ld b,006h		;c48c
	nop			;c48e
	ld b,006h		;c48f
	nop			;c491
	dec b			;c492
	inc b			;c493
	djnz $+6		;c494
	ld (bc),a			;c496
	ld c,002h		;c497
	dec c			;c499
	nop			;c49a
	dec c			;c49b
	dec c			;c49c
	nop			;c49d
	dec c			;c49e
	dec c			;c49f
	nop			;c4a0
	dec c			;c4a1
	dec c			;c4a2
	inc c			;c4a3
	dec c			;c4a4
	ld a,(bc)			;c4a5
	nop			;c4a6
	ld a,(bc)			;c4a7
	ld a,(bc)			;c4a8
	nop			;c4a9
	ld a,(bc)			;c4aa
	ld a,(bc)			;c4ab
	nop			;c4ac
	ld a,(bc)			;c4ad
	ld a,(bc)			;c4ae
	nop			;c4af
	ex af,af'			;c4b0
	ld b,000h		;c4b1
	ld b,006h		;c4b3
	nop			;c4b5
	ld b,006h		;c4b6
	nop			;c4b8
	ld b,006h		;c4b9
	nop			;c4bb
	dec b			;c4bc
	inc b			;c4bd
	djnz $+6		;c4be
	ld (bc),a			;c4c0
	ld c,002h		;c4c1
	dec bc			;c4c3
	nop			;c4c4
	dec bc			;c4c5
	dec bc			;c4c6
	nop			;c4c7
	dec bc			;c4c8
	dec bc			;c4c9
	nop			;c4ca
	dec bc			;c4cb
	dec bc			;c4cc
	nop			;c4cd
	dec bc			;c4ce
	djnz $+2		;c4cf
	djnz $+18		;c4d1
	nop			;c4d3
	djnz $+18		;c4d4
	nop			;c4d6
	djnz $+18		;c4d7
	rrca			;c4d9
	ld c,00ch		;c4da
	nop			;c4dc
	inc c			;c4dd
	inc c			;c4de
	nop			;c4df
	inc c			;c4e0
	inc c			;c4e1
	nop			;c4e2
	inc c			;c4e3
	inc c			;c4e4
	nop			;c4e5
	ld a,(bc)			;c4e6
	add hl,bc			;c4e7
	nop			;c4e8
	add hl,bc			;c4e9
	add hl,bc			;c4ea
	nop			;c4eb
	add hl,bc			;c4ec
	add hl,bc			;c4ed
	nop			;c4ee
	add hl,bc			;c4ef
	rlca			;c4f0
	nop			;c4f1
	add hl,bc			;c4f2
	ld a,(bc)			;c4f3
	nop			;c4f4
	ld a,(bc)			;c4f5
	ld a,(bc)			;c4f6
	nop			;c4f7
	ld a,(bc)			;c4f8
	ld a,(bc)			;c4f9
	nop			;c4fa
	ld a,(bc)			;c4fb
	ld a,(bc)			;c4fc
	nop			;c4fd
	ld a,(bc)			;c4fe
	ex af,af'			;c4ff
	nop			;c500
	ex af,af'			;c501
	ex af,af'			;c502
	nop			;c503
	ex af,af'			;c504
	ex af,af'			;c505
	nop			;c506
	ex af,af'			;c507
	ex af,af'			;c508
	nop			;c509
	ex af,af'			;c50a
	inc c			;c50b
	nop			;c50c
	inc c			;c50d
	inc c			;c50e
	nop			;c50f
	inc c			;c510
	inc c			;c511
	nop			;c512
	inc c			;c513
	inc c			;c514
	nop			;c515
	ld a,(bc)			;c516
	add hl,bc			;c517
	nop			;c518
	add hl,bc			;c519
	add hl,bc			;c51a
	nop			;c51b
	add hl,bc			;c51c
	add hl,bc			;c51d
	nop			;c51e
	add hl,bc			;c51f
	rlca			;c520
	nop			;c521
	add hl,bc			;c522
	ld a,(bc)			;c523
	nop			;c524
	ld a,(bc)			;c525
	ld a,(bc)			;c526
	nop			;c527
	ld a,(bc)			;c528
	ld a,(bc)			;c529
	nop			;c52a
	ld a,(bc)			;c52b
	ld a,(bc)			;c52c
	nop			;c52d
	ld a,(bc)			;c52e
	ex af,af'			;c52f
	nop			;c530
	ex af,af'			;c531
	ex af,af'			;c532
	nop			;c533
	ex af,af'			;c534
	ex af,af'			;c535
	nop			;c536
	ex af,af'			;c537
	ex af,af'			;c538
	nop			;c539
	ex af,af'			;c53a
	rst 38h			;c53b
	inc bc			;c53c
	add a,014h		;c53d
	add a,b			;c53f
	inc d			;c540
	dec e			;c541
	nop			;c542
	nop			;c543
	nop			;c544
	nop			;c545
	dec e			;c546
	dec de			;c547
	add hl,de			;c548
	jr $+24		;c549
	add a,b			;c54b
	ld d,01dh		;c54c
	nop			;c54e
	nop			;c54f
	nop			;c550
	nop			;c551
	nop			;c552
	nop			;c553
	nop			;c554
	nop			;c555
	ld d,080h		;c556
	ld d,022h		;c558
	nop			;c55a
	nop			;c55b
	nop			;c55c
	nop			;c55d
	ld (01e20h),hl		;c55e
	dec e			;c561
	rla			;c562
	inc e			;c563
	jr nz,$+23		;c564
	ld a,(de)			;c566
	ld e,014h		;c567
	add a,b			;c569
	inc d			;c56a
	dec e			;c56b
	nop			;c56c
	nop			;c56d
	nop			;c56e
	nop			;c56f
	dec e			;c570
	dec de			;c571
	add hl,de			;c572
	jr $+24		;c573
	add a,b			;c575
	ld d,01dh		;c576
	nop			;c578
	nop			;c579
	nop			;c57a
	nop			;c57b
	nop			;c57c
	nop			;c57d
	nop			;c57e
	nop			;c57f
	ld d,080h		;c580
	ld d,022h		;c582
	nop			;c584
	nop			;c585
	nop			;c586
	nop			;c587
	ld (01e20h),hl		;c588
	dec e			;c58b
	rla			;c58c
	inc e			;c58d
	jr nz,$+23		;c58e
	ld a,(de)			;c590
	ld e,01dh		;c591
	dec de			;c593
	add hl,de			;c594
	dec de			;c595
	add hl,de			;c596
	rla			;c597
	add hl,de			;c598
	rla			;c599
	ld d,017h		;c59a
	ld d,014h		;c59c
	dec e			;c59e
	dec de			;c59f
	add hl,de			;c5a0
	dec de			;c5a1
	add hl,de			;c5a2
	rla			;c5a3
	add hl,de			;c5a4
	rla			;c5a5
	ld d,017h		;c5a6
	ld d,014h		;c5a8
	ld e,01ch		;c5aa
	dec de			;c5ac
	inc e			;c5ad
	dec de			;c5ae
	add hl,de			;c5af
	dec de			;c5b0
	add hl,de			;c5b1
	rla			;c5b2
	ld d,017h		;c5b3
	add hl,de			;c5b5
	ld e,01ch		;c5b6
	dec de			;c5b8
	inc e			;c5b9
	dec de			;c5ba
	add hl,de			;c5bb
	dec de			;c5bc
	add hl,de			;c5bd
	rla			;c5be
	ld d,017h		;c5bf
	add hl,de			;c5c1
	inc e			;c5c2
	dec e			;c5c3
	add hl,de			;c5c4
	dec de			;c5c5
	add hl,de			;c5c6
	rla			;c5c7
	add hl,de			;c5c8
	rla			;c5c9
	ld d,019h		;c5ca
	rla			;c5cc
	ld d,014h		;c5cd
	dec e			;c5cf
	inc d			;c5d0
	inc de			;c5d1
	inc e			;c5d2
	inc de			;c5d3
	ld (de),a			;c5d4
	dec de			;c5d5
	ld (de),a			;c5d6
	add hl,de			;c5d7
	ld de,00c12h		;c5d8
	rrca			;c5db
	inc d			;c5dc
	dec c			;c5dd
	ld de,01214h		;c5de
	ld d,019h		;c5e1
	inc d			;c5e3
	jr $+29		;c5e4
	ld d,019h		;c5e6
	dec e			;c5e8
	ld (de),a			;c5e9
	ld d,019h		;c5ea
	inc d			;c5ec
	jr $+31		;c5ed
	inc d			;c5ef
	jr $+31		;c5f0
	ld (de),a			;c5f2
	add hl,de			;c5f3
	ld e,016h		;c5f4
	add hl,de			;c5f6
	ld e,017h		;c5f7
	inc e			;c5f9
	jr nz,$+23		;c5fa
	ld a,(de)			;c5fc
	ld e,0ffh		;c5fd
	nop			;c5ff
	nop			;c600
	sbc a,(hl)			;c601
	jp 0000dh		;c602
	dec c			;c605
	dec c			;c606
	nop			;c607
	dec c			;c608
	dec c			;c609
	nop			;c60a
	dec c			;c60b
	dec c			;c60c
	inc c			;c60d
	dec c			;c60e
	ld a,(bc)			;c60f
	nop			;c610
	ld a,(bc)			;c611
	ld a,(bc)			;c612
	nop			;c613
	ld a,(bc)			;c614
	ld a,(bc)			;c615
	nop			;c616
	ld a,(bc)			;c617
	ld a,(bc)			;c618
	nop			;c619
	ex af,af'			;c61a
	ld b,000h		;c61b
	ld b,006h		;c61d
	nop			;c61f
	ld b,006h		;c620
	nop			;c622
	ld b,006h		;c623
	nop			;c625
	dec b			;c626
	inc b			;c627
	djnz $+6		;c628
	ld (bc),a			;c62a
	ld c,002h		;c62b
	dec c			;c62d
	nop			;c62e
	dec c			;c62f
	dec c			;c630
	nop			;c631
	dec c			;c632
	dec c			;c633
	nop			;c634
	dec c			;c635
	dec c			;c636
	inc c			;c637
	dec c			;c638
	ld a,(bc)			;c639
	nop			;c63a
	ld a,(bc)			;c63b
	ld a,(bc)			;c63c
	nop			;c63d
	ld a,(bc)			;c63e
	ld a,(bc)			;c63f
	nop			;c640
	ld a,(bc)			;c641
	ld a,(bc)			;c642
	nop			;c643
	ex af,af'			;c644
	ld b,000h		;c645
	ld b,006h		;c647
	nop			;c649
	ld b,006h		;c64a
	nop			;c64c
	ld b,006h		;c64d
	nop			;c64f
	dec b			;c650
	inc b			;c651
	djnz $+6		;c652
	ld (bc),a			;c654
	ld c,002h		;c655
	dec c			;c657
	nop			;c658
	dec c			;c659
	dec c			;c65a
	nop			;c65b
	dec c			;c65c
	dec c			;c65d
	nop			;c65e
	dec c			;c65f
	dec c			;c660
	nop			;c661
	dec c			;c662
	dec c			;c663
	nop			;c664
	dec c			;c665
	dec c			;c666
	nop			;c667
	dec c			;c668
	dec c			;c669
	nop			;c66a
	dec c			;c66b
	dec c			;c66c
	nop			;c66d
	dec c			;c66e
	ld b,000h		;c66f
	ld b,006h		;c671
	nop			;c673
	ld b,006h		;c674
	nop			;c676
	ld b,006h		;c677
	nop			;c679
	ld b,006h		;c67a
	nop			;c67c
	ld b,006h		;c67d
	nop			;c67f
	ld b,006h		;c680
	nop			;c682
	ld b,006h		;c683
	nop			;c685
	ld b,00dh		;c686
	nop			;c688
	dec c			;c689
	dec c			;c68a
	nop			;c68b
	dec c			;c68c
	dec c			;c68d
	nop			;c68e
	dec c			;c68f
	dec c			;c690
	nop			;c691
	dec c			;c692
	ex af,af'			;c693
	nop			;c694
	ex af,af'			;c695
	rlca			;c696
	nop			;c697
	rlca			;c698
	ld b,000h		;c699
	ld b,005h		;c69b
	nop			;c69d
	dec b			;c69e
	ex af,af'			;c69f
	nop			;c6a0
	ex af,af'			;c6a1
	ex af,af'			;c6a2
	nop			;c6a3
	ex af,af'			;c6a4
	ex af,af'			;c6a5
	nop			;c6a6
	ex af,af'			;c6a7
	ex af,af'			;c6a8
	nop			;c6a9
	ex af,af'			;c6aa
	ld b,000h		;c6ab
	ld b,006h		;c6ad
	nop			;c6af
	ld b,008h		;c6b0
	nop			;c6b2
	ex af,af'			;c6b3
	dec b			;c6b4
	nop			;c6b5
	dec b			;c6b6
	ld b,000h		;c6b7
	ld b,005h		;c6b9
	nop			;c6bb
	dec b			;c6bc
	inc b			;c6bd
	nop			;c6be
	inc b			;c6bf
	ld (bc),a			;c6c0
	nop			;c6c1
	ld (bc),a			;c6c2
	rst 38h			;c6c3
	ld l,a			;c6c4
	call nz,0c3f2h		;c6c5
	jp 0cdc4h		;c6c8
	ld hl,08800h		;c6cb
	ld (0c7e4h),hl		;c6ce
	call 0c7a5h		;c6d1
	ret			;c6d4
	ld ix,0c7e6h		;c6d5
	ld b,019h		;c6d9
	push bc			;c6db
	ld c,(ix+000h)		;c6dc
	ld b,(ix+001h)		;c6df
	call 0c742h		;c6e2
	ld a,(ix+000h)		;c6e5
	ld c,a			;c6e8
	sub 07fh		;c6e9
	call 0c74bh		;c6eb
	ld d,c			;c6ee
	add a,c			;c6ef
	ld c,a			;c6f0
	xor d			;c6f1
	and 080h		;c6f2
	jr nz,$+28		;c6f4
	ld a,(ix+001h)		;c6f6
	ld b,a			;c6f9
	sub 058h		;c6fa
	call 0c74bh		;c6fc
	add a,b			;c6ff
	ld b,a			;c700
	cp 0b0h		;c701
	jr nc,$+13		;c703
	ld (ix+000h),c		;c705
	ld (ix+001h),b		;c708
	call 0c747h		;c70b
	jr $+5		;c70e
	call 0c71dh		;c710
	inc ix		;c713
	inc ix		;c715
	inc ix		;c717
	pop bc			;c719
	djnz $-63		;c71a
	ret			;c71c
	ld a,080h		;c71d
	call 0c775h		;c71f
	add a,040h		;c722
	ld (ix+000h),a		;c724
	ld a,058h		;c727
	call 0c775h		;c729
	add a,040h		;c72c
	ld (ix+001h),a		;c72e
	ld b,a			;c731
	ld c,(ix+000h)		;c732
	call 0c747h		;c735
	ld a,002h		;c738
	call 0c775h		;c73a
	inc a			;c73d
	ld (ix+002h),a		;c73e
	ret			;c741
	ld a,(0c831h)		;c742
	or a			;c745
	ret nz			;c746
	call 0c7d7h		;c747
	ret			;c74a
	bit 7,a		;c74b
	push bc			;c74d
	jr z,$+23		;c74e
	neg		;c750
	sra a		;c752
	sra a		;c754
	ld b,(ix+002h)		;c756
	sra a		;c759
	djnz $-2		;c75b
	or a			;c75d
	jr nz,$+3		;c75e
	inc a			;c760
	neg		;c761
	pop bc			;c763
	ret			;c764
	sra a		;c765
	sra a		;c767
	ld b,(ix+002h)		;c769
	sra a		;c76c
	djnz $-2		;c76e
	or a			;c770
	pop bc			;c771
	ret nz			;c772
	inc a			;c773
	ret			;c774
	ld de,(0c7e4h)		;c775
	call 0c798h		;c779
	push hl			;c77c
	ld e,04bh		;c77d
	ld a,(0c7e4h)		;c77f
	call 0c798h		;c782
	ld de,0004bh		;c785
	add hl,de			;c788
	ld de,00101h		;c789
	xor a			;c78c
	sbc hl,de		;c78d
	jr nc,$-2		;c78f
	add hl,de			;c791
	dec hl			;c792
	ld (0c7e4h),hl		;c793
	pop af			;c796
	ret			;c797
	ld h,a			;c798
	ld l,000h		;c799
	ld d,l			;c79b
	ld b,008h		;c79c
	add hl,hl			;c79e
	jr nc,$+3		;c79f
	add hl,de			;c7a1
	djnz $-4		;c7a2
	ret			;c7a4
	ld b,019h		;c7a5
	ld ix,0c7e6h		;c7a7
	push bc			;c7ab
	call 0c71dh		;c7ac
	inc ix		;c7af
	inc ix		;c7b1
	inc ix		;c7b3
	pop bc			;c7b5
	djnz $-11		;c7b6
	ret			;c7b8
	ld a,0afh		;c7b9
	sub b			;c7bb
	ld b,a			;c7bc
	and a			;c7bd
	rra			;c7be
	scf			;c7bf
	rra			;c7c0
	and a			;c7c1
	rra			;c7c2
	xor b			;c7c3
	and 0f8h		;c7c4
	xor b			;c7c6
	ld h,a			;c7c7
	ld a,c			;c7c8
	rlca			;c7c9
	rlca			;c7ca
	rlca			;c7cb
	xor b			;c7cc
	and 0c7h		;c7cd
	xor b			;c7cf
	rlca			;c7d0
	rlca			;c7d1
	ld l,a			;c7d2
	ld a,c			;c7d3
	and 007h		;c7d4
	ret			;c7d6
	call 0c7b9h		;c7d7
	ld b,a			;c7da
	inc b			;c7db
	ld a,001h		;c7dc
	rrca			;c7de
	djnz $-1		;c7df
	xor (hl)			;c7e1
	ld (hl),a			;c7e2
	ret			;c7e3
	nop			;c7e4
	nop			;c7e5
	dec c			;c7e6
	jp z,033cdh		;c7e7
	ld (hl),a			;c7ea
	dec hl			;c7eb
	call 00aeah		;c7ec
	jp 03294h		;c7ef
	ld (0337bh),hl		;c7f2
	push bc			;c7f5
	ld bc,03371h		;c7f6
	push bc			;c7f9
	call 028c4h		;c7fa
	ex de,hl			;c7fd
	ld c,000h		;c7fe
	ld a,(03e11h)		;c800
	cp 020h		;c803
	jp nz,03336h		;c805
	ld a,(03cf1h)		;c808
	cp 010h		;c80b
	jp z,0332eh		;c80d
	cp 008h		;c810
	jp z,0330eh		;c812
	ld bc,0fff6h		;c815
	ld d,b			;c818
	ld e,b			;c819
	add hl,bc			;c81a
	inc de			;c81b
	jp c,032fbh		;c81c
	push hl			;c81f
	ex de,hl			;c820
	ld a,h			;c821
	or l			;c822
	call nz,032f9h		;c823
	ld a,03ah		;c826
	pop bc			;c828
	add a,c			;c829
	jp 03366h		;c82a
	xor a			;c82d
	add hl,hl			;c82e
	adc a,030h		;c82f
	nop			;c831
	ld d,d			;c832
	ld hl,0ca61h		;c833
	jr $+5		;c836
	ld hl,0caeeh		;c838
	ld (0c9dah),sp		;c83b
	push hl			;c83f
	ld hl,0c9dch		;c840
	ld (0c9d8h),hl		;c843
	call 0c208h		;c846
	pop hl			;c849
	ld b,(hl)			;c84a
	xor a			;c84b
	or b			;c84c
	ret z			;c84d
	ld a,b			;c84e
	rrca			;c84f
	rrca			;c850
	and 007h		;c851
	jr nz,$+4		;c853
	ld a,008h		;c855
	ld b,a			;c857
	ld c,008h		;c858
	add a,c			;c85a
	djnz $-1		;c85b
	ld (0c901h),a		;c85d
	xor a			;c860
	ld b,(hl)			;c861
	bit 5,b		;c862
	jr z,$+4		;c864
	add a,018h		;c866
	ld (0c8b1h),a		;c868
	ld a,b			;c86b
	rlca			;c86c
	rlca			;c86d
	and 003h		;c86e
	ld (0c919h),a		;c870
	ld a,b			;c873
	and 003h		;c874
	ld b,a			;c876
	inc hl			;c877
	ld e,(hl)			;c878
	inc hl			;c879
	ld d,(hl)			;c87a
	push hl			;c87b
	ex de,hl			;c87c
	call 0c885h		;c87d
	pop hl			;c880
	ret nz			;c881
	inc hl			;c882
	jr $-57		;c883
	push hl			;c885
	ld a,(hl)			;c886
	ld e,a			;c887
	ld d,000h		;c888
	add hl,de			;c88a
	ld d,h			;c88b
	ld e,l			;c88c
	pop hl			;c88d
	push hl			;c88e
	push de			;c88f
	push bc			;c890
	ld bc,0f7feh		;c891
	in a,(c)		;c894
	cpl			;c896
	and 00fh		;c897
	jr z,$+7		;c899
	ld sp,(0c9dah)		;c89b
	ret			;c89f
	inc hl			;c8a0
	ld a,(hl)			;c8a1
	cp 0ffh		;c8a2
	jp z,0c936h		;c8a4
	bit 5,(hl)		;c8a7
	jr z,$+3		;c8a9
	inc de			;c8ab
	ld b,000h		;c8ac
	ld a,r		;c8ae
	and 018h		;c8b0
	out (0feh),a		;c8b2
	djnz $-6		;c8b4
	push de			;c8b6
	push hl			;c8b7
	ld a,(de)			;c8b8
	ld b,a			;c8b9
	and 01fh		;c8ba
	push hl			;c8bc
	call 0c941h		;c8bd
	pop hl			;c8c0
	ld c,a			;c8c1
	ld a,(hl)			;c8c2
	push af			;c8c3
	and 01fh		;c8c4
	call 0c941h		;c8c6
	ld e,a			;c8c9
	ld a,c			;c8ca
	cp e			;c8cb
	jr z,$+14		;c8cc
	add a,a			;c8ce
	and 01fh		;c8cf
	cp e			;c8d1
	jr z,$+8		;c8d2
	add a,a			;c8d4
	and 01fh		;c8d5
	cp e			;c8d7
	jr nz,$+3		;c8d8
	inc c			;c8da
	ld d,e			;c8db
	ld a,d			;c8dc
	ld (0c917h),a		;c8dd
	ld a,c			;c8e0
	ld (0c910h),a		;c8e1
	pop af			;c8e4
	push af			;c8e5
	and 01fh		;c8e6
	jr z,$+4		;c8e8
	ld a,002h		;c8ea
	ld (0c915h),a		;c8ec
	ld a,b			;c8ef
	and 01fh		;c8f0
	jr z,$+4		;c8f2
	ld a,001h		;c8f4
	ld (0c90eh),a		;c8f6
	pop af			;c8f9
	rlca			;c8fa
	rlca			;c8fb
	and 003h		;c8fc
	inc a			;c8fe
	ld b,a			;c8ff
	ld h,012h		;c900
	ld l,0ffh		;c902
	push bc			;c904
	push hl			;c905
	call 0c94ah		;c906
	xor a			;c909
	dec c			;c90a
	jr nz,$+6		;c90b
	xor 001h		;c90d
	ld c,0efh		;c90f
	dec d			;c911
	jr nz,$+6		;c912
	xor 002h		;c914
	ld d,03ch		;c916
	and 003h		;c918
	jr z,$+10		;c91a
	cp 003h		;c91c
	ld a,010h		;c91e
	jr nz,$+4		;c920
	ld a,018h		;c922
	out (0feh),a		;c924
	ld e,a			;c926
	dec hl			;c927
	ld a,h			;c928
	or l			;c929
	ld a,e			;c92a
	jr nz,$-33		;c92b
	pop hl			;c92d
	pop bc			;c92e
	djnz $-43		;c92f
	pop hl			;c931
	pop de			;c932
	jp 0c891h		;c933
	pop bc			;c936
	pop de			;c937
	pop hl			;c938
	dec b			;c939
	ld a,b			;c93a
	and 003h		;c93b
	jp nz,0c88eh		;c93d
	ret			;c940
	ld e,a			;c941
	ld d,000h		;c942
	ld hl,0ca3dh		;c944
	add hl,de			;c947
	ld a,(hl)			;c948
	ret			;c949
	push af			;c94a
	push bc			;c94b
	push de			;c94c
	push hl			;c94d
	call 0c956h		;c94e
	pop hl			;c951
	pop de			;c952
	pop bc			;c953
	pop af			;c954
	ret			;c955
	ld hl,(0c9d8h)		;c956
	ld a,(hl)			;c959
	inc hl			;c95a
	cp 0ffh		;c95b
	jr nz,$+7		;c95d
	ld hl,0c9dch		;c95f
	ld a,(hl)			;c962
	inc hl			;c963
	ld (0c9d8h),hl		;c964
	or a			;c967
	ret z			;c968
	dec a			;c969
	jr nz,$+6		;c96a
	call 0c98dh		;c96c
	ret			;c96f
	dec a			;c970
	jr nz,$+6		;c971
	call 0c992h		;c973
	ret			;c976
	dec a			;c977
	jr nz,$+6		;c978
	call 0c988h		;c97a
	ret			;c97d
	dec a			;c97e
	call z,0c983h		;c97f
	ret			;c982
	ld hl,0c9bch		;c983
	jr $+15		;c986
	ld hl,0c9cah		;c988
	jr $+10		;c98b
	ld hl,0c9aeh		;c98d
	jr $+5		;c990
	ld hl,0c9a0h		;c992
	ld a,00eh		;c995
	dec a			;c997
	ld c,(hl)			;c998
	call 0c107h		;c999
	inc hl			;c99c
	jr nz,$-6		;c99d
	ret			;c99f
	add hl,bc			;c9a0
	rlca			;c9a1
	nop			;c9a2
	nop			;c9a3
	nop			;c9a4
	rra			;c9a5
	ld (hl),00fh		;c9a6
	nop			;c9a8
	nop			;c9a9
	nop			;c9aa
	nop			;c9ab
	dec b			;c9ac
	nop			;c9ad
	add hl,bc			;c9ae
	inc b			;c9af
	nop			;c9b0
	nop			;c9b1
	nop			;c9b2
	rra			;c9b3
	ld a,000h		;c9b4
	nop			;c9b6
	nop			;c9b7
	nop			;c9b8
	nop			;c9b9
	ld b,000h		;c9ba
	add hl,bc			;c9bc
	ex af,af'			;c9bd
	nop			;c9be
	nop			;c9bf
	nop			;c9c0
	rra			;c9c1
	ld a,000h		;c9c2
	nop			;c9c4
	nop			;c9c5
	nop			;c9c6
	nop			;c9c7
	inc b			;c9c8
	nop			;c9c9
	add hl,bc			;c9ca
	ex af,af'			;c9cb
	nop			;c9cc
	nop			;c9cd
	nop			;c9ce
	rra			;c9cf
	ld a,000h		;c9d0
	nop			;c9d2
	nop			;c9d3
	nop			;c9d4
	nop			;c9d5
	inc bc			;c9d6
	nop			;c9d7
	rlca			;c9d8
	jp z,05f36h		;c9d9
	ld bc,00100h		;c9dc
	ld (bc),a			;c9df
	nop			;c9e0
	ld bc,00001h		;c9e1
	ld bc,00002h		;c9e4
	ld bc,00001h		;c9e7
	ld bc,00002h		;c9ea
	ld bc,00001h		;c9ed
	ld bc,00202h		;c9f0
	ld bc,00001h		;c9f3
	ld bc,00002h		;c9f6
	ld bc,00001h		;c9f9
	ld bc,00002h		;c9fc
	ld bc,00001h		;c9ff
	ld bc,00002h		;ca02
	ld bc,00001h		;ca05
	inc bc			;ca08
	inc b			;ca09
	inc bc			;ca0a
	inc b			;ca0b
	ld bc,00100h		;ca0c
	ld (bc),a			;ca0f
	nop			;ca10
	ld bc,00001h		;ca11
	ld bc,00002h		;ca14
	ld bc,00001h		;ca17
	ld bc,00001h		;ca1a
	ld (bc),a			;ca1d
	ld (bc),a			;ca1e
	nop			;ca1f
	ld bc,00303h		;ca20
	inc bc			;ca23
	ld bc,00100h		;ca24
	ld (bc),a			;ca27
	nop			;ca28
	ld bc,00004h		;ca29
	nop			;ca2c
	inc bc			;ca2d
	nop			;ca2e
	nop			;ca2f
	inc b			;ca30
	nop			;ca31
	nop			;ca32
	inc bc			;ca33
	nop			;ca34
	nop			;ca35
	ld (bc),a			;ca36
	nop			;ca37
	ld bc,00202h		;ca38
	ld bc,000ffh		;ca3b
	defb 0fdh,0efh,0e1h	;illegal sequence		;ca3e
	push de			;ca41
	ret			;ca42
	cp (hl)			;ca43
	or e			;ca44
	xor c			;ca45
	sbc a,a			;ca46
	sub (hl)			;ca47
	adc a,(hl)			;ca48
	add a,(hl)			;ca49
	ld a,a			;ca4a
	ld (hl),a			;ca4b
	ld (hl),c			;ca4c
	ld l,d			;ca4d
	ld h,h			;ca4e
	ld e,a			;ca4f
	ld e,c			;ca50
	ld d,h			;ca51
	ld d,b			;ca52
	ld c,e			;ca53
	ld b,a			;ca54
	ld b,e			;ca55
	ccf			;ca56
	inc a			;ca57
	jr c,$+55		;ca58
	ld (02d2fh),a		;ca5a
	ld hl,(02628h)		;ca5d
	inc h			;ca60
	jp z,0ca7dh		;ca61
	ld l,c			;ca64
	xor d			;ca65
	jp z,093e8h		;ca66
	jp z,0aaeah		;ca69
	jp z,0beeah		;ca6c
	jp z,07de9h		;ca6f
	jp z,09329h		;ca72
	jp z,093ebh		;ca75
	jp z,0d7f1h		;ca78
	jp z,01100h		;ca7b
	ld b,b			;ca7e
	inc d			;ca7f
	ld (hl),h			;ca80
	inc d			;ca81
	ld a,c			;ca82
	add hl,de			;ca83
	or a			;ca84
	ld (hl),a			;ca85
	jr $-126		;ca86
	ld e,b			;ca88
	ld e,01dh		;ca89
	dec de			;ca8b
	add hl,de			;ca8c
	rst 38h			;ca8d
	ld bc,00605h		;ca8e
	rlca			;ca91
	ex af,af'			;ca92
	inc de			;ca93
	ld c,b			;ca94
	ex af,af'			;ca95
	ld c,d			;ca96
	ex af,af'			;ca97
	ld c,b			;ca98
	ex af,af'			;ca99
	ld c,d			;ca9a
	ld hl,(00b6bh)		;ca9b
	ld c,l			;ca9e
	dec bc			;ca9f
	ld c,e			;caa0
	dec bc			;caa1
	dec hl			;caa2
	dec bc			;caa3
	dec bc			;caa4
	rst 38h			;caa5
	ld bc,00403h		;caa6
	inc bc			;caa9
	rrca			;caaa
	ld e,c			;caab
	add hl,de			;caac
	ld d,a			;caad
	rla			;caae
	ld d,(hl)			;caaf
	ld d,017h		;cab0
	ld d,034h		;cab2
	xor e			;cab4
	ld h,b			;cab5
	ex de,hl			;cab6
	adc a,e			;cab7
	rst 38h			;cab8
	ld bc,00403h		;cab9
	nop			;cabc
	inc b			;cabd
	rrca			;cabe
	ld e,h			;cabf
	inc e			;cac0
	cp e			;cac1
	ld a,c			;cac2
	add hl,de			;cac3
	dec sp			;cac4
	add hl,sp			;cac5
	ld (hl),0b4h		;cac6
	ld h,b			;cac8
	ld (0d474h),a		;cac9
	rst 38h			;cacc
	add hl,de			;cacd
	rla			;cace
	ld d,017h		;cacf
	ld d,012h		;cad1
	djnz $+2		;cad3
	rrca			;cad5
	djnz $+17		;cad6
	ld d,c			;cad8
	ld de,00f6fh		;cad9
	ld l,l			;cadc
	dec c			;cadd
	ld l,h			;cade
	dec bc			;cadf
	ld l,d			;cae0
	jr z,$-88		;cae1
	xor b			;cae3
	adc a,b			;cae4
	rst 38h			;cae5
	dec c			;cae6
	inc c			;cae7
	ld a,(bc)			;cae8
	ex af,af'			;cae9
	ld b,005h		;caea
	inc bc			;caec
	ld bc,0f2e9h		;caed
	jp z,02100h		;caf0
	ld d,l			;caf3
	dec d			;caf4
	ld e,d			;caf5
	inc e			;caf6
	ld e,l			;caf7
	inc e			;caf8
	ld e,d			;caf9
	dec e			;cafa
	ld a,h			;cafb
	ld a,(de)			;cafc
	ld e,c			;cafd
	inc e			;cafe
	ld e,d			;caff
	add hl,de			;cb00
	halt			;cb01
	inc de			;cb02
	ld (hl),l			;cb03
	dec d			;cb04
	ld e,d			;cb05
	inc e			;cb06
	ld e,l			;cb07
	inc e			;cb08
	ld e,d			;cb09
	rra			;cb0a
	ld a,l			;cb0b
	inc e			;cb0c
	ld e,d			;cb0d
	add hl,de			;cb0e
	ld a,d			;cb0f
	ld a,(de)			;cb10
	sbc a,d			;cb11
	rst 38h			;cb12
	ld (bc),a			;cb13
	add hl,bc			;cb14
	ld a,(bc)			;cb15
	ld (bc),a			;cb16
	add hl,bc			;cb17
	ld (bc),a			;cb18
	ld de,01964h		;cb19
	ld hl,0cc55h		;cb1c
	ld ix,0ccbdh		;cb1f
	ld a,002h		;cb23
	jr $+16		;cb25
	ld de,00708h		;cb27
	ld hl,0e625h		;cb2a
	ld ix,0e645h		;cb2d
	ld a,002h		;cb31
	jr $+2		;cb33
	di			;cb35
	ld (0cbe3h),a		;cb36
	call 0cbf2h		;cb39
	ld c,040h		;cb3c
	ld b,008h		;cb3e
	push bc			;cb40
	call 0cbe2h		;cb41
	xor a			;cb44
	rlc (ix+000h)		;cb45
	rla			;cb49
	neg		;cb4a
	and (hl)			;cb4c
	ld b,a			;cb4d
	rra			;cb4e
	and 018h		;cb4f
	out (0feh),a		;cb51
	ld a,b			;cb53
	and 00fh		;cb54
	ld bc,0bffdh		;cb56
	out (c),a		;cb59
	pop bc			;cb5b
	dec b			;cb5c
	jp z,0cb68h		;cb5d
	push bc			;cb60
	pop bc			;cb61
	push bc			;cb62
	pop bc			;cb63
	push bc			;cb64
	pop bc			;cb65
	jr $-38		;cb66
	inc ix		;cb68
	dec de			;cb6a
	bit 7,d		;cb6b
	jr nz,$+14		;cb6d
	dec c			;cb6f
	jp z,0cb78h		;cb70
	nop			;cb73
	nop			;cb74
	jp 0cb3eh		;cb75
	inc hl			;cb78
	jr $-61		;cb79
	call 0cc1bh		;cb7b
	ret			;cb7e
	defb 020h		;cb7f
