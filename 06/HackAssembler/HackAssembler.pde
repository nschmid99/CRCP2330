Parser parser;
BufferedReader input;
PrintWriter output;
SymbolTable st;
Code code;
String saveL;
String symbol;
String fileName="Rect";
int  rom=0;
int ram;

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
  while (parser.moreCommands()==true) {
    parser.advance();


    if ((checkwhite()==false) && (checkCommentsBegin()==false)) {
      if (checkCommentsin()==true) {
        int index=parser.current.indexOf("//");
        String temp=parser.current.substring(index, parser.current.length());
        parser.current=parser.current.replace(temp, "");
        parser.current.trim();
      }


      if (parser.cmdtype()=="A_COMMAND") {
        st.incRom();
      } else if (parser.cmdtype()== "C_COMMAND")
      {
        st.incRom();
      } else if (parser.cmdtype()=="L_COMMAND") {
        symbol=parser.symbol();
        String  symbag= symbol.substring(1, symbol.length()-1);
        String address=Integer.toString(this.st.getRom());
        this.st.addLt(symbag, address);
      }
    }
  }
}



//runn through entire program and parse each line
//if symbolic A instruction encountered, look up Xxx in symbol table. 
//If symbol is found replceit with numeric meaning
//if not found must represent new variable
//for new variable, add pair (Xxx,n) to symbol  table where n  is next available  RAM
void secondPass() {
  while (parser.moreCommands()==true) {
    parser.advance();

    String instruction;

    if ((checkwhite()==false) && (checkCommentsBegin()==false)) {
      if (checkCommentsin()==true) {
        int index=parser.current.indexOf("//");
        String temp=parser.current.substring(index, parser.current.length());
        parser.current=parser.current.replace(temp, "");
        parser.current.trim();
      }


      if (parser.cmdtype()=="A_COMMAND") {
        String  temp=parser.current;
        String tmp=temp.substring(1);

        if (st.contains(tmp)==true) {
          int tempr = Integer.parseInt(st.getAddress(tmp));
          String write=binary(tempr, 16);
          output.println(write);
        } else if (isnumber(tmp)==true) {
          int r=Integer.parseInt(tmp);
          ;
          String write=binary(r, 16);
          output.println(write);
        } else {    
          ram=this.st.getRam();
          String newAd=Integer.toString(ram);
          st.addElement(tmp, newAd); 
          output.println(binary(ram, 16));
        }
      } else if (parser.cmdtype()=="C_COMMAND") {

        String ins="111";
        String compt = parser.comp();
        String  destt=parser.dest();
        String  jumpt=parser.jump();


        String comp=code.getBinc(compt);
        String dest=code.getBind(destt);
        String jump=code.getBinj(jumpt);


        instruction=ins+comp+dest+jump;
        this.output.println(instruction);
      } else if (parser.cmdtype()=="L_COMMAND") {
        String syd=parser.symbol();

        if (st.contains(syd)==true);
      }
    }
  }
}



boolean checkwhite() {
  if (parser.current.length()==0) {
    return true;
  } else {
    return false;
  }
}

boolean checkCommentsin() {


  if (parser.current.contains("//")) {
    return true ;
  } else {
    return false;
  }
}
boolean checkCommentsBegin() {

  if (parser.current.startsWith("//")) {

    int index=parser.current.indexOf("//");
    if (index>-1) {
      parser.current.substring(0, index);
    }
    return true;
  } else {
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

boolean isnumber(String temp) {
  if (temp.startsWith("0")||temp.startsWith("1")||temp.startsWith("2")||temp.startsWith("3")|
    temp.startsWith("4")|temp.startsWith("5")||temp.startsWith("6")||temp.startsWith("7")||
    temp.startsWith("8")||temp.startsWith("9")) {   
    return true;
  } else {
    return false;
  }
}
