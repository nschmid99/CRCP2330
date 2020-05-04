Parser parser;
//SymbolTable st;
BufferedReader input;
PrintWriter output;
SymbolTable st;
Code code;
String fileName="Max";
int  rom=0;
int ram=16;

void setup() {
  //initialize symbol table with predefined symbols and pre=allocated ram address
  output=createWriter(fileName+".hack");
  parser= new Parser(fileName+".asm");
  
  code=new Code();
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
  //parser.removeComments(parser.current);
  println("first");
 
  while (parser.moreCommands()==true) {
    parser.advance();
    

    if ((checkwhite()==false) && (checkCommentsBegin()==false)) {
        if(checkCommentsin()==true){
   int index=parser.current.indexOf("//");
   String temp=parser.current.substring(index,parser.current.length());
   parser.current=parser.current.replace(temp,"");
   parser.current.trim();
   }

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
      //rom++;
     // rom++;
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
   //arser.removeComments(parser.current);
    parser.advance();
   
   String instruction;
    
    if ((checkwhite()==false) && (checkCommentsBegin()==false)) {
   if(checkCommentsin()==true){
   int index=parser.current.indexOf("//");
   String temp=parser.current.substring(index,parser.current.length());
   parser.current=parser.current.replace(temp,"");
   parser.current.trim();
   }

      
    if (parser.cmdtype()=="A_COMMAND"){
      
      String  temp=parser.current;
    //String  tmp=split(temp,"@")[1];
       String tmp=temp.substring(1);
      // println(tmp+"tmp");
       //checkAt();
          if(temp.startsWith("@R")){
            tmp=temp.substring(2);
            println(tmp+"tmp");
            String write=binary(int(tmp),16);
            println("write"+write);
            output.println(write);
          }
          else
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
          
       
      if(parser.cmdtype()=="C_COMMAND"){
         println(parser.current+"parser");
         if(parser.current.contains(";")){
        String ins="111";
        String compt = parser.comp();
         String  destt="null";
         String  jumpt=parser.jump();
   
           println("compt"+compt);
           println("jumpt"+jumpt);
         String comp=code.getBinc(compt);
        String dest=code.getBind("null");
          String jump=code.getBinj(jumpt);
         instruction=ins+comp+dest+jump;
          println("instruct"+ins+compt+destt+jumpt);
           this.output.println(instruction);}
           else if(parser.current.contains("=")){
             String ins="111";
        String compt = parser.comp();
         String  destt=parser.dest();
         String  jumpt="null";
   
           println("compt"+compt);
           println("jumpt"+jumpt);
         String comp=code.getBinc(compt);
        String dest=code.getBind(destt);
          String jump=code.getBinj(jumpt);
         instruction=ins+comp+dest+jump;
          println("instruct"+ins+compt+destt+jumpt);
           this.output.println(instruction);
           }
        }
    }}
        //if(parser.cmdtype()=="L_COMMAND"){
          // this.output.println(instruction);
          // this.output.newLine();
       //       }
 }//}
 // }

boolean checkwhite() {
  if (parser.current.length()==0) {
    return true;
  } else {
    return false;
  }
}

boolean checkCommentsin() {
  // String comment=parser.current;
//  String right;
  
  if (parser.current.contains("//")) {
 return true ;}
 else{
 return false;}
}
boolean checkCommentsBegin() {
  // String comment=parser.current;
  if (parser.current.startsWith("//")) {
 // String val=comment.substring(comment.indexOf("//"),comment.length());
  
 // val=val.replace("val","");
 // println(val);
    //String nocomment= comment.substring(parser.advance);
    int index=parser.current.indexOf("//");
  if(index>-1){
    parser.current.substring(0,index);
     //parser.advance();
    

    }
    return true;
}
else {
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
        return false;  }
        
}
