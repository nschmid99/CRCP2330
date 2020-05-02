 class Parser{

String [] text;
String current;
//String next;
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
  return(true);
  }
  }
  
void advance(){
    current=text[i].trim();
  i++;
}

//command type A/C/L,  return A/C/L command
//a=0,c=1,label=everything else
String cmdtype(){
  String commandtype;
if(current.charAt(0)==0){
  commandtype="A_COMMAND";
  }
  else if(current.charAt(0)==1){
  commandtype="C_COMMAND";
  }
  else{
  commandtype="L_COMMAND";
  }
  return commandtype;
}
//symbol(ignore for now, test  symbol-less first return string

//dest,return  string
String dest(){
  //split temp. first 3 # are 1 4-10 are comp 11-13 are dest 14-16 are jump
  int d1=0; int d2=0; int  d3=0;
   if( current=="null"){
  d1=0; d2=0; d3=0;
  }
  else if( current=="M"){
  d1=0; d2=0; d3=1;
  }
  else if(current=="D"){
  d1=0; d2=1; d3=0;
  }
 else if(current=="MD"){
  d1=0; d2=1; d3=1;
  }
  else if(current=="A"){
  d1=1; d2=0; d3=0;
  }
  else if(current=="AM"){
  d1=1; d2=0; d3=1;
  }
  else if(current=="AD"){
  d1=1; d2=1; d3=0;
  }
  else if(current=="AMD"){
  d1=1; d2=1; d3=1;
  }
  String destMnem=str(d1+d2+d3);
 return destMnem;
}
//comp, return string 28 posibilities
String comp(){
  //split temp. first 3 # are 1 4-10 are comp 11-13 are dest 14-16 are jump
int c1=0; int c2=0; int c3=0; int c4=0; int c5=0; int c6=0;
  //check first number after 1. 
  if(current=="0"){
    c1=1; c2=0; c3=1; c4=0; c5=1; c6=0;
  }
  else if(current=="1"){
    c1=1; c2=1; c3=1; c4=1; c5=1; c6=1;
  }
  else if(current=="-1"){
    c1=1; c2=1; c3=1; c4=0; c5=1; c6=0;
  }
  else if(current=="D"){
    c1=0; c2=0; c3=1; c4=1; c5=0; c6=0;
  }
  else if(current=="A"|| current=="M"){
    c1=1; c2=0; c3=1; c4=0; c5=1; c6=0;
  }
  else if(current=="!D"){
    c1=0; c2=0; c3=1; c4=1; c5=0; c6=1;
  }
  else if(current=="!A"|| current=="!M"){
    c1=1; c2=1; c3=0; c4=0; c5=0; c6=1;
  }
  else if(current=="-D"){
    c1=0; c2=0; c3=1; c4=1; c5=1; c6=1;
  }
  else if(current=="-A"||current=="-M"){
    c1=1; c2=1; c3=0; c4=0; c5=1; c6=1;
  }
  else if(current=="D+1"){
    c1=0; c2=1; c3=1; c4=1; c5=1; c6=1;
  }
  else if(current=="A+1"||current=="M+1"){
    c1=1; c2=1; c3=0; c4=1; c5=1; c6=1;
  }
  else if(current=="D-1"){
    c1=0; c2=0; c3=1; c4=1; c5=1; c6=0;
  }
  else if(current=="A-1"||current=="M-1"){
    c1=1; c2=1; c3=0; c4=0; c5=1; c6=0;
  }
  else if(current=="D+A"||current=="D+M"){
    c1=0; c2=0; c3=0; c4=0; c5=1; c6=0;
  }
  else if(current=="D-A"||current=="D-M"){
    c1=0; c2=1; c3=0; c4=0; c5=1; c6=1;
  }
  else if(current=="A-D"||current=="M-D"){
    c1=0; c2=0; c3=0; c4=1; c5=1; c6=1;
  }
  else if(current=="D&A"||current=="D&M"){
    c1=0; c2=0; c3=0; c4=0; c5=0; c6=0;
  }
  else if(current=="D|A"||current=="D|M"){
    c1=0; c2=1; c3=0; c4=1; c5=0; c6=1;
  }
 String compMnem=str(c1+c2+c3+c4+c5+c6);
 return compMnem;
}
//jump, return string
String jump(){
   int j1=0; int j2=0; int j3=0;
  if( current=="null"){
  j1=0; j2=0; j3=0;
  }
  else if( current=="JGT"){
  j1=0; j2=0; j3=1;
  }
  else if(current=="JEQ"){
  j1=0; j2=1; j3=0;
  }
 else if(current=="JGE"){
  j1=0; j2=1; j3=1;
  }
  else if( current=="JLT"){
  j1=1; j2=0; j3=0;
  }
  else if(current=="JNE"){
  j1=1; j2=0; j3=1;
  }
  else if(current=="JLE"){
  j1=1; j2=1; j3=0;
  }
  else if(current=="JMP"){
  j1=1; j2=1; j3=1;
  }
  
 String jmpMnem=str(j1+j2+j3);
 return jmpMnem;
}

}
