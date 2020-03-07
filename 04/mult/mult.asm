// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//find value at ram0 and 1 and save. multiply together and save mult. set mult to ram2
//add ram1 together  as many times as  the value ofram0
	@i
	M=0
(LOOP)
//if i <=RAM0, i++
	@i
	D=M
	@0
	D=D-A //Max value
	@END
	D;JGT//if D=D-A>0 JGT

//add
	@i
	D=M
	@1
	M=D+D
	@2
	M=D
	@i
	M=M+1
	@LOOP
	0;JMP
(END)
	@END
	0;JMP

