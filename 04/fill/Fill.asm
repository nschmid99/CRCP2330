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
// 1=black 0=white. when keypressed, screen=1 when keypressed=false. screen=0

@8192
  D=A
  @n  
   M=D  // n = RAM[0]

  @i
  M=0  // i = 0

  @KBD
  D=M
  @i
  D=M
  @SCREEN
  A=A+D
  M=0
  D;JEQ

(LOOP)
   @i
   D=M
   @SCREEN
   M=M+D 
   M=-1
   @END
   0;JMP

(END)
   @LOOP  // program’s end
   0;JMP                                                               