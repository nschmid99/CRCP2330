class SymbolTable {
  int rom =0; //0
  int ram = 16; //16
  Table table;
  String symbol;
  String address;


  HashMap<String, String>symbolTable;

  SymbolTable() {
    symbolTable=new HashMap<String, String>();
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
    symbolTable.put("R10", "10");
    symbolTable.put("R11", "11");
    symbolTable.put("R12", "12");
    symbolTable.put("R13", "13");
    symbolTable.put("R14", "14");
    symbolTable.put("R15", "15");


    symbolTable.put("SCREEN", "16384");
    symbolTable.put("KBD", "24576");
  }



  void addElement(String symbol, String address) {
    symbolTable.put(symbol, address);
    incRam();
  }

  void addLt(String symbol, String address) {
    symbolTable.put(symbol, address);
  }


  boolean contains(String symbol) {
    return(symbolTable.containsKey(symbol));
  }

  String getAddress(String address) {
    return(symbolTable.get(address));
  }
  void incRam() {
    this.ram++;
  }
  void incRom() {
    this.rom++;
  }

  int getRam() {
    return this.ram;
  }

  int getRom() { 
    return this.rom;
  }
}
