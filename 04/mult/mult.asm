// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//find value at ram0 and 1 and save. multiply together and save mult. set mult to ram2
//add ram1 together  as many times as  the value ofram0
	@1
	D=M
	@i
	M=D
	@0
	D=A
	@2
	M=D
	

(LOOP)
//if i <=RAM0, i++
	@i
	D=M
	//Max value
	@END
	D;JGT//if D=D-A>0 JGT
	@R1
	D=D-M
@i
M=D
	@R2
	D=M

	@R0
	M=D+M

	@R2
	M=D

	
	@LOOP
	0;JMP
(END)
	0;JMP
	

