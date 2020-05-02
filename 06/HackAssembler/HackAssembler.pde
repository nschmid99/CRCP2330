Parser parser;
SymbolTable st;
BufferedReader reader;
PrintWriter output;
String fileName="Add";
int rom;

void setup() {
  //initialize symbol table with predefined symbols and pre=allocated ram address
  output=createWriter(fileName+".hack");
  parser= new Parser(fileName+".asm");
  st= new SymbolTable();

  noLoop();
}

void draw() {
  firstPass();
  //println(parser.current);
  secondPass();
  println(rom);
  exit();
}

void firstPass() {
  println("first");
  //run through assembly line by line. build symbol table without generating coed
  //keep running number recording ROM add to where  current  command  will be loaded
  //number starts at 0 and is  incremented byt 1 whenever A/C inst is encountered
  //if  pseudocommand (Xxx) is encountered, add new entery to symbol table
  //first pass is  to enter all labels and ROM addresses into symbol table
  while (parser.moreCommands()==true) {
    parser.advance();
    if ((checkwhite()==false) && (checkComments()==false)) {
    println("mOve");
    switch(parser.cmdtype()) {
    case "A_COMMAND":
    {
     // String symb =parser.symbol();
      st.incRom();
      break;
    }
    case "C_COMMAND":
      {
        println("a/c");
          st.incRom();
        break;
      }
    case "L_COMMAND":
      {
        //symboltable
        String symbol=parser.symbol();
        int address=this.st.getRom();
        this.st.addElement(symbol,address);
        break;
      }
    }
    }}
}
boolean checkwhite() {
  if (parser.current.length()==0) {
    return true;
  } else {
    return false;
  }
}

boolean checkComments() {
  //String temp;
  if (parser.current.startsWith("//")) {
    parser.advance();
    println(parser.current);
    return true;
  } else {
    println("print");
    return false;
  }
}
boolean checkAt() {
  //String temp;
  if (parser.current.startsWith("@")) {
   // println("@");
    parser.advance();
    //println(parser.current);
    return true;
  } else {
    //println("atsign");
    return false;
  }
}

boolean isnumber(String temp){
   //String temp="";
  // String temp2="";
   split(parser.current, '@');
          checkAt();
          temp=parser.current;
          if (temp.charAt(0)==0||temp.charAt(0)==1||temp.charAt(0)==2||temp.charAt(0)==3||
          temp.charAt(0)==4||temp.charAt(0)==5||temp.charAt(0)==6||temp.charAt(0)==7||
          temp.charAt(0)==8||temp.charAt(0)==9) {
            String temp2 =temp;
            temp=binary(int( temp2), 16);}
            
           // output.println(temp2);
           //println("a2");}
          // return "0"+temp2;     
         return true; 
} 

void secondPass() {
  String temp="";
  String temp2="";

  //runn through entire program and parse each line
  //if symbolic A instruction encountered, look up Xxx in symbol table. 
  //If symbol is found replceit with numeric meaning
  //if not found must represent new variable
  //for new variable, add pair (Xxx,n) to symbol  table where n  is next available  RAM
  while (parser.moreCommands()==true) {
    parser.advance();
    if ((checkwhite()==false) && (checkComments()==false)) {
      switch(parser.cmdtype()) {
      case "A_COMMAND":
        {
         // println("a");
        /*  split(parser.current, '@');
          checkAt();
          temp=parser.current;
          if (temp.charAt(0)==0||temp.charAt(0)==1||temp.charAt(0)==2||temp.charAt(0)==3||temp.charAt(0)==4||temp.charAt(0)==5||temp.charAt(0)==6||temp.charAt(0)==7||temp.charAt(0)==8||temp.charAt(0)==9) {
            temp2=binary(int( temp), 16);
            output.println(temp2);
            println("a2");
          }*/
          String  symbol=parser.symbol();
          boolean isNumber=isnumber(symbol);
          
          if(!isNumber){
          //  boolean symbol=this.symbolTable.hasString();
          }
          break;
        }
      case "C_COMMAND":
        {
          println("c");
          String comp = parser.comp();
          String dest=parser.dest();
          String jump=parser.jump();

          String instruction="111";
          String ins= instruction+comp+dest+jump;
          println(ins);
          output.println(ins);

          break;
        }
      }
    }
    output.flush();
    output.close();
  }
  
}
