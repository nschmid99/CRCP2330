class Parser{

String [] text;
String current;
 String commandtype;
 boolean f=true;
int i;

//constructor
Parser(String file){
  this.i=0;
  this.text=loadStrings(file);
  this.current=text[i].trim();
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
   this.current=text[i].trim();
  i++;
  println("advance");
  
}


//command type A/C/L,  return A/C/L command
//a=0,c=1,label=everything else
String cmdtype(){
 String temp="";
if(current.startsWith("@")){  //error here? string index out of range
  temp="A_COMMAND";
  println("a_cmd");
  }

  else if(current.startsWith("(")){
  temp="L_COMMAND";
  println("l_cmd");
  }
   else {
  temp="C_COMMAND";
  println("c_cmd");
  }
  return temp;
}
//symbol(ignore for now, test  symbol-less first return string
String symbol(){
  String trimmedLine=this.current.trim();

if(commandtype=="L_COMMAND"){
  return trimmedLine.replace("(","").replace(")","");
}
else if(commandtype=="A_COMMAND"){
  return trimmedLine.substring(1);
}

else{
  return trimmedLine;
}
}

//dest,return  string
String dest(){
  String rDest;
  if(current.contains("=")){
  int endIndex=current.lastIndexOf("=");
  rDest=current.substring(0,endIndex);}

  else{
  rDest="null";}
  return rDest;
  }
 
//comp, return string 28 posibilities
String comp(){
  String rComp=current.trim();
  if(current.contains("=")){
  int neq=current.lastIndexOf("=");
   rComp=current.substring(neq+1,rComp.length());
  }
  else if(current.contains(";")){
  int nsem=current.lastIndexOf(";");
   rComp=current.substring(0,nsem);
  }
  
  println(rComp+"rcomp");
  return rComp;

}
//jump, return string

 String jump(){ 
       String rJump;
       if(current.contains(";")){

     int nsem=current.lastIndexOf(";");
     rJump=current.substring(nsem+1).trim();
    println("rjmp"+rJump);}
   else{
  rJump="no";}
   return  rJump;
   
}}
