Parser parser;
SymbolTable st;
BufferedReader input;
PrintWriter output;
String fileName="Add";
String  c;
Code code;
//int rom;

void setup() {
  //initialize symbol table with predefined symbols and pre=allocated ram address
  output=createWriter(fileName+".hack");
  parser= new Parser(fileName+".asm");
  //reader=new BufferedReader(output);
  st= new SymbolTable();

  noLoop();
}

void draw() {
 firstPass();
  parser.i=0;
  parser.current=parser.text[parser.i].trim();
  //println(parser.current);
  secondPass();
  
      output.flush();
    output.close();
  //println(ram);
 exit();
}

//run through assembly line by line. build symbol table without generating coed
  //keep running number recording ROM add to where  current  command  will be loaded
  //number starts at 0 and is  incremented byt 1 whenever A/C inst is encountered
  //if  pseudocommand (Xxx) is encountered, add new entery to symbol table
  //first pass is  to enter all labels and ROM addresses into symbol table
void firstPass() {
  println("first");
 
  while (parser.moreCommands()==true) {
    parser.advance();
    //checkAt();
    if ((checkwhite()==false) && (checkComments()==false)) {
    println("mOve");
      if(parser.cmdtype()=="A_COMMAND"){
      st.incRom();
       println("a");
    }
    else if(parser.cmdtype()== "C_COMMAND")
      {
        println("c");
          st.incRom();
        //break;
      }
    //case
    else if(parser.cmdtype()=="L_COMMAND")
      {
        //symboltable
        println("l");
        String symbol=parser.symbol();
        int address=this.st.getRom();
        this.st.addElement(symbol,address);
       // break;
      }
    }
    }}
//}


  //runn through entire program and parse each line
  //if symbolic A instruction encountered, look up Xxx in symbol table. 
  //If symbol is found replceit with numeric meaning
  //if not found must represent new variable
  //for new variable, add pair (Xxx,n) to symbol  table where n  is next available  RAM
void secondPass() {
  String temp="";
  println("2nd");
  while (parser.moreCommands()==true) {
    println("rd2");
    parser.advance();
    String instruction;
    //=null;
    if ((checkwhite()==false) && (checkComments()==false)) {
      if(parser.cmdtype()=="A_COMMAND")
        {    
          println("a1");
           //temp=split(parser.current,"@")[1];
          String  symbol=parser.symbol();
          boolean isNumber=isnumber(symbol);
          //ram data rom program
         String address=null;
          if(!isNumber){
             println("a2");
           boolean symbolHere=this.st.hasString(symbol);
           
             if(!symbolHere){
             int ram = this.st.getRam();
             this.st.addElement(symbol, ram);
             this.st.incRam();
           }
              
         // address=str(this.st.getValue(st.ram));
        //}
        // address=str.charAt(address
          else{address=symbol;}
        }
       
             
          temp=parser.current;
          if (temp.charAt(0)==0||temp.charAt(0)==1||temp.charAt(0)==2||temp.charAt(0)==3||
          temp.charAt(0)==4||temp.charAt(0)==5||temp.charAt(0)==6||temp.charAt(0)==7||
          temp.charAt(0)==8||temp.charAt(0)==9) {
            String temp2 =temp;
            temp=binary(int( temp2), 15);
            println(temp);
          instruction= "0"+temp;
          
           output.println(instruction);
        }
          //break;
        }
      if(parser.cmdtype()=="C_COMMAND")
        {
          println("c");
         // parser.dest();
          //parser.comp();
         // parser.jump();
         
          String comp = parser.comp();
          String dest=parser.dest();
          String jump=parser.jump();
         
          

         String ins="111";
         println(ins);
          instruction= ins+comp+dest+jump;
          //comp+dest+jump;
          println(instruction);
           output.println(instruction);
         // break;
        }
      }
    }
     //  println(instruction);
      //    output.println(instruction);

  
  
}


boolean checkwhite() {
  if (parser.current.length()==0) {
    return true;
  } else {
    return false;
  }
}

boolean checkComments() {
  if (parser.current.startsWith("//")) {
    parser.advance();
    return true;
  } else {
    println("comments false");
    return false;
  }
}
boolean checkAt() {
  if (parser.current.startsWith("@")) {
    parser.advance();
    return true;
  } else {
    return false;
  }
}

boolean isnumber(String temp){
   //String temp="";
  // String temp2="";
   split(parser.current, '@');
          checkAt();
         return true; 
} Parser parser;
SymbolTable st;
BufferedReader reader;
BufferedReader input;
PrintWriter output;
String fileName="Add";
int rom;
//int rom;

void setup() {
  //initialize symbol table with predefined symbols and pre=allocated ram address
  output=createWriter(fileName+".hack");
  parser= new Parser(fileName+".asm");
  //reader=new BufferedReader(output);
  st= new SymbolTable();

  noLoop();
void draw() {
  firstPass();
  //println(parser.current);
  secondPass();
  println(rom);
  exit();

      output.flush();
    output.close();
  //println(ram);
 exit();
}

void firstPass() {
  println("first");
  //run through assembly line by line. build symbol table without generating coed
//run through assembly line by line. build symbol table without generating coed
  //keep running number recording ROM add to where  current  command  will be loaded
  //number starts at 0 and is  incremented byt 1 whenever A/C inst is encountered
  //if  pseudocommand (Xxx) is encountered, add new entery to symbol table
  //first pass is  to enter all labels and ROM addresses into symbol table
void firstPass() {
  println("first");

  while (parser.moreCommands()==true) {
    parser.advance();
    //checkAt();
    if ((checkwhite()==false) && (checkComments()==false)) {
    println("mOve");
    switch(parser.cmdtype()) {
    case "A_COMMAND":
    {
     // String symb =parser.symbol();
    //switch(parser.cmdtype()) {
    //case "A_COMMAND":
    //{
      if(parser.cmdtype()=="A_COMMAND"){
      st.incRom();
      break;
       println("a");
      //break;
    }
    case "C_COMMAND":
    else if(parser.cmdtype()== "C_COMMAND")
      {
        println("a/c");
        println("c");
          st.incRom();
        break;
        //break;
      }
    case "L_COMMAND":
    //case
    else if(parser.cmdtype()=="L_COMMAND")
      {
        //symboltable
        println("l");
        String symbol=parser.symbol();
        int address=this.st.getRom();
        this.st.addElement(symbol,address);
        break;
       // break;
      }
    }
    }}
//}


  //runn through entire program and parse each line
  //if symbolic A instruction encountered, look up Xxx in symbol table. 
  //If symbol is found replceit with numeric meaning
  //if not found must represent new variable
  //for new variable, add pair (Xxx,n) to symbol  table where n  is next available  RAM
void secondPass() {
  String temp="";

  while (parser.moreCommands()==true) {
    parser.advance();
    String instruction=null;
    if ((checkwhite()==false) && (checkComments()==false)) {
      switch(parser.cmdtype()) {
      case "A_COMMAND":
        {    
           temp=split(parser.current,"@")[1];
          String  symbol=parser.symbol();
          boolean isNumber=isnumber(symbol);
          //ram data rom program
          String address=null;
          if(!isNumber){
           boolean symbolHere=this.st.hasString(symbol);

           if(!symbolHere){
             int ram = this.st.getRam();
             this.st.addElement(symbol, ram);
             this.st.incRam();
           }

           //address=str(this.st.getValue(symbol));
          }
          else{address=symbol;}

          temp=parser.current;
          if (temp.charAt(0)==0||temp.charAt(0)==1||temp.charAt(0)==2||temp.charAt(0)==3||
          temp.charAt(0)==4||temp.charAt(0)==5||temp.charAt(0)==6||temp.charAt(0)==7||
          temp.charAt(0)==8||temp.charAt(0)==9) {
            String temp2 =temp;
            temp=binary(int( temp2), 15);
          instruction= "0"+temp;
          println(temp);
           output.println(instruction);
        }
          break;
        }
      case "C_COMMAND":
        {
          println("c");
          String comp = parser.comp();
          String dest=parser.dest();
          String jump=parser.jump();

         String ins="111";
         println(ins);
          instruction= ins+comp+dest+jump;
          println(instruction);
           output.println(instruction);
          break;
        }
      }
    }
     //  println(instruction);
      //    output.println(instruction);

  }

}
boolean checkwhite() {
  if (parser.current.length()==0) {
@@ -66,25 +144,19 @@ boolean checkwhite() {
}

boolean checkComments() {
  //String temp;
  if (parser.current.startsWith("//")) {
    parser.advance();
    println(parser.current);
    return true;
  } else {
    println("print");
    println("comments false");
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
@@ -94,69 +166,5 @@ boolean isnumber(String temp){
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
