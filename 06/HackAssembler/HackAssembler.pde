Parser parser;
//SymbolTable st;
BufferedReader input;
PrintWriter output;
SymbolTable st;
Code code;
String fileName="Max";
int  rom=16;
int ram=0;

void setup() {
  //initialize symbol table with predefined symbols and pre=allocated ram address
  output=createWriter(fileName+".hack");
  parser= new Parser(fileName+".asm");
  code=new Code();
  //code2=new Code2();
  st= new SymbolTable();

  noLoop();
}

void draw() {
  firstPass();
  //println(parser.current);
 parser.i=0;
  parser.current=parser.text[parser.i].trim();
  secondPass();
    output.flush();
    output.close();
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
    

    if ((checkwhite()==false) && (checkComments()==false)) {
    println("mOve");

      if(parser.cmdtype()=="A_COMMAND"){
       println("a");
       rom++;
       //st.incRom();
    }
    else if(parser.cmdtype()== "C_COMMAND")
      {
        println("c");
        rom++;
         //st.incRom();
      }
      else if(parser.cmdtype()=="L_COMMAND"){
        //symbolTable.addL(parser.symbol.substring(0,parser.current-2),parser.i);
      String symbol=parser.symbol();
     // int address=this.st.getAddress(symbol);
      this.st.addElement(symbol,binary((rom),16));
      }
       
   }
    }}



  //runn through entire program and parse each line
  //if symbolic A instruction encountered, look up Xxx in symbol table. 
  //If symbol is found replceit with numeric meaning
  //if not found must represent new variable
  //for new variable, add pair (Xxx,n) to symbol  table where n  is next available  RAM
void secondPass() {
 while (parser.moreCommands()==true) {
    parser.advance();
    String instruction=null;
    
    if ((checkwhite()==false) && (checkComments()==false)) {
      
    if (parser.cmdtype()=="A_COMMAND"){
      String  temp=parser.current;
       String tmp=temp.substring(1);
       println(tmp+"tmp");
       
          if(isnumber(tmp)==true){
            String write=binary(int(tmp),16);
            println("write"+write);
            output.println(write);
          }
          else{
          if(st.contains(tmp)==true){
            int tempr = Integer.parseInt(st.getAddress(tmp));
           String write=binary(tempr,16);
            println(write+"write");
            output.println(write);
          }
          else{st.addElement(tmp,binary(ram,16));
          String write=binary(ram,16);
          println(write+"write3");
          output.println(write);
          ram++;
          }
         //int address=getAddress(tmp);
          //st.addElement(tmp,address);
          }
          }
       
      if(parser.cmdtype()=="C_COMMAND"){
        String ins="111";
        String compt = parser.comp();
         String  destt=parser.dest();
         String  jumpt=parser.jump();
           
           println("compt"+compt);
         String comp=code.getBinaryC(compt);
        String dest=code.getBinaryD(destt);
          String jump=code.getBinaryJ(jumpt);
          instruction=ins+comp+dest+jump;
          println("instruct"+instruction);
           this.output.println(instruction);
        }
        
        if(parser.cmdtype()=="L_COMMAND"){
           this.output.println(instruction);
          // this.output.newLine();
        }
      }
 }}
 // }

boolean checkwhite() {
  if (parser.current.length()==0) {
    return true;
  } else {
    return false;
  }
}

boolean checkComments() {
   String comment=parser.current;
  if (parser.current.contains("//")) {
 // String val=comment.substring(comment.indexOf("//"),comment.length());
  
 // val=val.replace("val","");
 // println(val);
    //String nocomment= comment.substring(parser.advance);
    
 //  parser.advance();
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
   //temp=parser.current;
   println("temprn"+temp);
   //temp.split(temp, '@');
   //println("tempsplit"+temp.charAt(1));
   if (temp.startsWith("0")||temp.startsWith("1")||temp.startsWith("2")||temp.startsWith("3")|
          temp.startsWith("4")|temp.startsWith("5")||temp.startsWith("6")||temp.startsWith("7")||
          temp.startsWith("8")||temp.startsWith("9")) {   
             println("true");
         return true;
      
     }
         else {
         println("false");
        return false;}}
        
        
        
        
        
        
//} arser parser;
//SymbolTable st;
//BufferedReader input;
//PrintWriter output;
//SymbolTable st;
//Code code;
//String fileName="Max";

//void setup() {
//  //initialize symbol table with predefined symbols and pre=allocated ram address
//  output=createWriter(fileName+".hack");
//  parser= new Parser(fileName+".asm");
//  code=new Code();
//  //code2=new Code2();
//  st= new SymbolTable();

//  noLoop();
//}

//void draw() {
//  firstPass();
//  //println(parser.current);
// parser.i=0;
//  parser.current=parser.text[parser.i].trim();
//  secondPass();
//    output.flush();
//    output.close();
// exit();
//}

////run through assembly line by line. build symbol table without generating coed
//  //keep running number recording ROM add to where  current  command  will be loaded
//  //number starts at 0 and is  incremented byt 1 whenever A/C inst is encountered
//  //if  pseudocommand (Xxx) is encountered, add new entery to symbol table
//  //first pass is  to enter all labels and ROM addresses into symbol table
//void firstPass() {
//  println("first");
 
//  while (parser.moreCommands()==true) {
//    parser.advance();
    

//    if ((checkwhite()==false) && (checkComments()==false)) {
//    println("mOve");

//      if(parser.cmdtype()=="A_COMMAND"){
//       println("a");
//       //st.incRom();
//    }
//    else if(parser.cmdtype()== "C_COMMAND")
//      {
//        println("c");
//         //st.incRom();
//      }
//      else if(parser.cmdtype()=="L_COMMAND"){
//        //symbolTable.addL(parser.symbol.substring(0,parser.current-2),parser.i);
//      String symbol=parser.symbol();
//     // int address=this.st.getAddress(symbol);
//      this.st.addL(symbol);
//      }
       
//   }
//    }}



//  //runn through entire program and parse each line
//  //if symbolic A instruction encountered, look up Xxx in symbol table. 
//  //If symbol is found replceit with numeric meaning
//  //if not found must represent new variable
//  //for new variable, add pair (Xxx,n) to symbol  table where n  is next available  RAM
//void secondPass() {
// while (parser.moreCommands()==true) {
//    parser.advance();
//    String instruction=null;
    
//    if ((checkwhite()==false) && (checkComments()==false)) {
      
//    if (parser.cmdtype()=="A_COMMAND"){
//      String symbol =parser.symbol();
//      println(symbol);
//     // Character firstchar=symbol.charAt(0);
//        boolean isSymbol =(!(Character.isDigit(symbol.charAt(0))));
       
       
//       String address=null;
//      if(isSymbol==true){
//        boolean symbolExists = this.st.contains(symbol);
//        // if(this.symbolTable.contains(symbol));
//       // boolean symbolExists=false;
//         if(symbolExists==false){
//             int data=this.st.getAddress(symbol);
//             this.st.addElement(symbol,data);
//         }
         
//         address=Integer.toString(this.st.getAddress(symbol));
//       } else{
//         address=symbol;
//         //output=binary(address,16);
//     }
//        }

   

//      if(parser.cmdtype()=="C_COMMAND"){
//        String ins="111";
//        //if(parser.current.contains("=")==true){
//        String compt = parser.comp();
//         String  destt=parser.dest();
//          // println(compt+"compt");
//         String  jumpt=parser.jump();
           
//           println("compt"+compt);
//          //instruction.append("111");
//         String comp=code.getBinaryC(compt);
//        String dest=code.getBinaryD(destt);
//          String jump=code.getBinaryJ(jumpt);
//          instruction=ins+comp+dest+jump;
//          println("instruct"+instruction);
//           this.output.println(instruction);
//        }
        
//        if(parser.cmdtype()=="L_COMMAND"){
//           this.output.println(instruction);
//           //this.output.newLine();
//        }
//      }
//    }}
// // }

//boolean checkwhite() {
//  if (parser.current.length()==0) {
//    return true;
//  } else {
//    return false;
//  }
//}

//boolean checkComments() {
//   String comment=parser.current;
//  if (parser.current.contains("//")) {
// // String val=comment.substring(comment.indexOf("//"),comment.length());
  
// // val=val.replace("val","");
// // println(val);
//    //String nocomment= comment.substring(parser.advance);
    
// //  parser.advance();
//    return true;
//  } else {
//    println("comments false");
//    return false;
//  }
////}
////boolean checkAt() {
////  if (parser.current.startsWith("@")) {
////    parser.advance();
////    return true;
////  } else {
////    return false;
////  }
////}

//boolean isnumber(String temp){
//   //String temp="";
//  // String temp2="";
//   //temp=parser.current;
//   println("temprn"+temp);
//   //temp.split(temp, '@');
//   //println("tempsplit"+temp.charAt(1));
//   if (temp.startsWith("0")||temp.startsWith("1")||temp.startsWith("2")||temp.startsWith("3")|
//          temp.startsWith("4")|temp.startsWith("5")||temp.startsWith("6")||temp.startsWith("7")||
//          temp.startsWith("8")||temp.startsWith("9")) {   
//             println("true");
//         return true;
      
//     }
//         else {
//         println("false");
//         return false;}
//} }
