Parser parser;
SymbolTable st;
BufferedReader reader;
PrintWriter output;
String fileName="Pong";
int rom=0;
int ram=15;

void setup(){
  //initialize symbol table with predefined symbols and pre=allocated ram address
  parser= new Parser(fileName);
  st= new SymbolTable();
  output=createWriter(fileName+".hack");
  
}

void draw(){
firstPass();
secondPass();
}

void firstPass(){
  //run through assembly line by line. build symbol table without generating coed
  //keep running number recording ROM add to where  current  command  will be loaded
  //number starts at 0 and is  incremented byt 1 whenever A/C inst is encountered
  //if  pseudocommand (Xxx) is encountered, add new entery to symbol table
  //first pass is  to enter all labels and ROM addresses into symbol table
  while(parser.moreCommands()==true){
    parser.advance();
    if((parser.current.length()!=0) && (parser.current.startsWith("/",0)==false)){
    switch(parser.cmdtype()){
      case "A_COMMAND":
      {
       rom++;
      break;
      }
      case "C_COMMAND":
      {
       rom++;
      break;
      }
      case "L_COMMAND":{
        //symboltable
        
      }
    
    }
    }
    
  }
}
void secondPass(){
  //runn through entire program and parse each line
  //if symbolic A instruction encountered, look up Xxx in symbol table. 
  //If symbol is found replceit with numeric meaning
  //if not found must represent new variable
  //for new variable, add pair (Xxx,n) to symbol  table where n  is next available  RAM
}
