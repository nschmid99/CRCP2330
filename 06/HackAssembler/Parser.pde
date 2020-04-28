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
  else if(current.charAt(0)==1{
  temp="c";
  }
  else{
  temp="l";
  }
  
}}
//symbol(ignore for now, test  symbol-less first return string

//dest,return  string
void dest(int d1, int d2, int  d3){
  else if(String temp="null"){
  d1=0, d2=0, d3=0;
  }
  if(String temp="M"){
  d1=0, d2=0, d3=1;
  }
  else if(String temp="D"){
  d1=0, d2=1, d3=0;
  }
 else if(String temp="MD"){
  d1=0, d2=1, d3=1;
  }
  else if(String temp="A"){
  d1=1, d2=0, d3=0;
  }
  else if(String temp="AM"){
  d1=1, d2=0, d3=1;
  }
  else if(String temp="AD"){
  d1=1, d2=1, d3=0;
  }
  else if(String temp="AMD"){
  d1=1, d2=1, d3=1;
  }
}
//comp, return string 28 posibilities
void comp(){}
//jump, return string
void jump(){}
}
