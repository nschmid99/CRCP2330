 class Parser{

String [] text;
String current;
String next;
int i;

//constructor
Parser(String file){
  i=0;
  text=loadStrings(file);
  current=text[i].trim();
  
}
//boolean more commands, return boolean
boolean moreCommands(){
  //i> length of file there arent more.i<length thereare more
  if(i>=text.length){
  return(false);
  }else{
    current=text[i].trim();
  i++;
  return(true);
}
  
}

//command type A/C/L,  return A/C/L command
//a=0,c=1,label=everything else
void commandtye(){
String temp="";
if(current.charAt(0)==0){
  temp="a";
  }
  else if(current.charAt(0)==1){
  temp="c";
  }
  else{
  temp="l";
  }
  
}
//symbol(ignore for now, test  symbol-less first return string

//dest,return  string
void dest(String temp){
  //split temp. first 3 # are 1 4-10 are comp 11-13 are dest 14-16 are jump
  int d1; int d2; int  d3;
   if( temp=="null"){
  d1=0; d2=0; d3=0;
  }
  else if( temp=="M"){
  d1=0; d2=0; d3=1;
  }
  else if(temp=="D"){
  d1=0; d2=1; d3=0;
  }
 else if(temp=="MD"){
  d1=0; d2=1; d3=1;
  }
  else if( temp=="A"){
  d1=1; d2=0; d3=0;
  }
  else if(temp=="AM"){
  d1=1; d2=0; d3=1;
  }
  else if(temp=="AD"){
  d1=1; d2=1; d3=0;
  }
  else if(temp=="AMD"){
  d1=1; d2=1; d3=1;
  }
}
//comp, return string 28 posibilities
void comp(String temp){
  //split temp. first 3 # are 1 4-10 are comp 11-13 are dest 14-16 are jump
int c1; int c2; int c3; int c4; int c5; int c6;
  //check first number after 1. 
  if(temp=="0"){
    c1=1; c2=0; c3=1; c4=0; c5=1; c6=0;
  }
  else if(temp=="1"){
    c1=1; c2=1; c3=1; c4=1; c5=1; c6=1;
  }
  else if(temp=="-1"){
    c1=1; c2=1; c3=1; c4=0; c5=1; c6=0;
  }
  else if(temp=="D"){
    c1=0; c2=0; c3=1; c4=1; c5=0; c6=0;
  }
  else if(temp=="A"|| temp=="M"){
    c1=1; c2=0; c3=1; c4=0; c5=1; c6=0;
  }
  else if(temp=="!D"){
    c1=0; c2=0; c3=1; c4=1; c5=0; c6=1;
  }
  else if(temp=="!A"|| temp=="!M"){
    c1=1; c2=1; c3=0; c4=0; c5=0; c6=1;
  }
  else if(temp=="-D"){
    c1=0; c2=0; c3=1; c4=1; c5=1; c6=1;
  }
  else if(temp=="-A"||temp=="-M"){
    c1=1; c2=1; c3=0; c4=0; c5=1; c6=1;
  }
  else if(temp=="D+1"){
    c1=0; c2=1; c3=1; c4=1; c5=1; c6=1;
  }
  else if(temp=="A+1"||temp=="M+1"){
    c1=1; c2=1; c3=0; c4=1; c5=1; c6=1;
  }
  else if(temp=="D-1"){
    c1=0; c2=0; c3=1; c4=1; c5=1; c6=0;
  }
  else if(temp=="A-1"||temp=="M-1"){
    c1=1; c2=1; c3=0; c4=0; c5=1; c6=0;
  }
  else if(temp=="D+A"||temp=="D+M"){
    c1=0; c2=0; c3=0; c4=0; c5=1; c6=0;
  }
  else if(temp=="D-A"||temp=="D-M"){
    c1=0; c2=1; c3=0; c4=0; c5=1; c6=1;
  }
  else if(temp=="A-D"||temp=="M-D"){
    c1=0; c2=0; c3=0; c4=1; c5=1; c6=1;
  }
  else if(temp=="D&A"||temp=="D&M"){
    c1=0; c2=0; c3=0; c4=0; c5=0; c6=0;
  }
  else if(temp=="D|A"||temp=="D|M"){
    c1=0; c2=1; c3=0; c4=1; c5=0; c6=1;
  }
}
//jump, return string
void jump(String temp){
   int j1; int j2; int j3;
  if( temp=="null"){
  j1=0; j2=0; j3=0;
  }
  else if( temp=="JGT"){
  j1=0; j2=0; j3=1;
  }
  else if(temp=="JEQ"){
  j1=0; j2=1; j3=0;
  }
 else if(temp=="JGE"){
  j1=0; j2=1; j3=1;
  }
  else if( temp=="JLT"){
  j1=1; j2=0; j3=0;
  }
  else if(temp=="JNE"){
  j1=1; j2=0; j3=1;
  }
  else if(temp=="JLE"){
  j1=1; j2=1; j3=0;
  }
  else if(temp=="JMP"){
  j1=1; j2=1; j3=1;
  }
}
}
