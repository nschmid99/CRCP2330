class SymbolTable {
  int rom;
  int ram;
  Table table;
  String symbol;
  String value;
  int addn=16;
  HashMap<String,String>symbolTable;
  
  SymbolTable() {
    symbolTable=new HashMap<String,String>();
    symbolTable.put("SP", "0");
    symbolTable.put("LCL", "1");
    symbolTable.put("ARG", "2");
    symbolTable.put("THIS", "3");
    symbolTable.put("THAT", "4");    
        
    symbolTable.put("R0", "0");
    symbolTable.put("R1", "1");
    symbolTable.put( "R2", "2");
   symbolTable.put( "R3", "3");
    symbolTable.put( "R4", "4");
    symbolTable.put("R5", "5");
    symbolTable.put( "R6", "6");
    symbolTable.put("R7", "7");
    symbolTable.put( "R8", "8");
    symbolTable.put("R9", "9");
    
    symbolTable.put("SCREEN", "16384");
    symbolTable.put("KBD", "24576");
  }

 
  
  void addElement(String symbol, String add){
    symbolTable.put(symbol,add);
  }
  
 void addL(String symbol, String add){
   //String num=Integer.toString(addn);
   symbolTable.put(symbol,add);
   addn++;
 }
  
boolean contains(String symbol){
  return(symbolTable.containsKey(symbol));
}

String getAddress(String add){
  return(symbolTable.get(add));
}}
  //void incRam(){
  //this.ram++;
  //}
  // void incRom(){
  //this.rom++;
  //}
  
//  int getRam(){
//  return this.ram;
//  }
  
//  int getRom(){ 
//  return this.rom;
//  }
//}
