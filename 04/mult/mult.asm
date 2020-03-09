// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
//find value at ram0 and 1 and save. multiply together and save mult. set mult to ram2
//add ram1 together  as many times as  the value ofram0
//add r0 into r2 as many times as r1 isnt 0
	
	@i
	M=0    
	    
	@R2 
	M=0
	

(LOOP)
//if i <=RAM1, i++
	@i
	D=M
	@R1
	D=D-A
	@END
	D;JGT
	
	@R2
	D=M
	@R0
	D=D+M

	@R2
	M=D

	@i
	M=M+1


	@LOOP	
	0;JMP
(END)

	0;JMP
	

