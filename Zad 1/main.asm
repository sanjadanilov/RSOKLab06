TITLE rs32templ.asm

; Opis: opis programa

; ukljucivanje biblioteke
INCLUDE rs32tfzr.inc

;-------------------------------------------------------------------------------
; segment podataka
;-------------------------------------------------------------------------------
.data
	; podaci
	broj db 0ah ;definisi promenljivu broj velicine bajt i postavi je na vrednost 0Ah(10 decimalno)
	zbir db 0h	;definisi promenljivu zbir velicine bajt i postavi je na vrednost 0h
;-------------------------------------------------------------------------------
; kodni segment
;-------------------------------------------------------------------------------
.code

main PROC


	; kod programa
	mov ecx, 0			;resetuj brojacki registar
	mov eax, 0			;resetuj EAX
	mov cl, broj		;u cl ucitaj broj
	call ZbirBrojeva	;pozovi proceduru ZbirBrojeva
	mov zbir,al			;u promenljivu zbir upisi vrednost koja se nalazi u AL

	; povratak u operativni sistem
	exit
main ENDP
;------------------------------------------------------------
;PROCEDURA	ZbirBrojeva										
;------------------------------------------------------------
;Ulaz
;------------------------------------------------------------
;ECX - broj ponavljanja petlje
;-broj do kog se racuna zbir po obrascu 1+2+3+...+broj
;------------------------------------------------------------
;Izlaz
;------------------------------------------------------------
;AL - Izracunat zbir 
;------------------------------------------------------------
	ZbirBrojeva PROC	;pocetak procedure	
sabiraj:				;labela koja se koristi za loop
	add al, cl			;saberi vrednost iz AL sa vrednosti iz CL
	loop sabiraj		;skaci na labelu sabiraj sve dok ECX ne postane 0
	ret					;povratak u main
ZbirBrojeva ENDP		;kraj procedure
END main	; glavna procedura programa