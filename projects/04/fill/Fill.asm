// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed.
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

	(RESET)
	@SCREEN
	D=A
	@pos
	M=D

	(CHECK_KEYBOARD)
	@KBD
	D=M

	@COLOR
	D;JGT

	D=0
	@FILL
	0;JMP

	(COLOR)
	D=-1

	(FILL)
	@pos
	A=M
	M=D

	// Reset if pos=KBD after incrementing
	@pos
	M=M+1

	@KBD
	D=A
	@pos
	D=D-M

	@RESET
	D;JEQ

	@CHECK_KEYBOARD
	0;JMP
