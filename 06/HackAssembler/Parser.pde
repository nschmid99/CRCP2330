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
  return false;
  }
  
}

//command type A/C/L,  return A/C/L command

//symbol(ignore for now, test  symbol-less first return string

//dest,return  string

//comp, return string

//jump, return string

}
