class SymbolTable {
  int rom;
  int ram;
  Table table;
  String symbol;
  int value;
  
  SymbolTable() {
    table=new Table();
    this.initST();
    this.rom=0;
    this.ram=16;
  }

  void initST() {
    TableRow newRow0=table.addRow();
    TableRow newRow1=table.addRow();
    TableRow newRow2=table.addRow();
    TableRow newRow3=table.addRow();
    TableRow newRow4=table.addRow();
    TableRow newRow5=table.addRow();
    TableRow newRow6=table.addRow();
    TableRow newRow7=table.addRow();
    TableRow newRow8=table.addRow();
    TableRow newRow9=table.addRow();
    TableRow newRow10=table.addRow();
    TableRow newRow11=table.addRow();
    TableRow newRow12=table.addRow();
    TableRow newRow13=table.addRow();
    TableRow newRow14=table.addRow();
    TableRow newRow15=table.addRow();
    TableRow newScreen=table.addRow();
    TableRow newKBD=table.addRow();
    TableRow newSP=table.addRow();
    TableRow newLCL=table.addRow();
    TableRow newARG=table.addRow();
    TableRow newTHIS=table.addRow();
    TableRow newTHAT=table.addRow();

    table.addColumn("symbol");
    table.addColumn("value");
    newRow0.setString("symbol", "R0"); newRow0.setInt("value", 0);
    newRow1.setString("symbol", "R1"); newRow1.setInt("value", 1);
    newRow2.setString("symbol", "R2"); newRow2.setInt("value", 2);
    newRow3.setString("symbol", "R3"); newRow3.setInt("value", 3);
    newRow4.setString("symbol", "R4"); newRow4.setInt("value", 4);
    newRow5.setString("symbol", "R5"); newRow5.setInt("value", 5);
    newRow6.setString("symbol", "R6"); newRow6.setInt("value", 6);
    newRow7.setString("symbol", "R7"); newRow7.setInt("value", 7);
    newRow8.setString("symbol", "R8"); newRow8.setInt("value", 8);
    newRow9.setString("symbol", "R9"); newRow9.setInt("value", 9);
    newRow10.setString("symbol", "R10"); newRow10.setInt("value", 10);
    newRow11.setString("symbol", "R11"); newRow11.setInt("value", 11);
    newRow12.setString("symbol", "R12"); newRow12.setInt("value", 12);
    newRow13.setString("symbol", "R13"); newRow12.setInt("value", 13);
    newRow14.setString("symbol", "R14"); newRow14.setInt("value", 14);
    newRow15.setString("symbol", "R15"); newRow15.setInt("value", 15);
    newScreen.setString("symbol", "SCREEN"); newScreen.setInt("value", 16384);
    newKBD.setString("symbol", "KBD"); newKBD.setInt("value", 24576);
    newSP.setString("symbol", "SP"); newSP.setInt("value", 0);
    newLCL.setString("symbol", "LCL"); newLCL.setInt("value", 1);
    newARG.setString("symbol", "ARG"); newARG.setInt("value", 2);
    newTHIS.setString("symbol", "THIS"); newTHIS.setInt("value", 3);
    newTHAT.setString("symbol", "THAT"); newTHAT.setInt("value", 4);    
  }
  
  void addElement(){
    //have temp row
    //with  variables
    //set  variables
    //add row(source0
   TableRow templateRow=table.addRow();
   String tempString=""; int tempVal=0;
   templateRow.setString("symbol", tempString); templateRow.setInt("value", tempVal); 

   tempString=symbol;
   tempVal=value;
   table.addRow(templateRow); //copy row but with new values
  }
  
  String getStringV(String symbol){ 
    //getsymbol to add to table
    return symbol;
  }
  
  int getValue(int value){
    //get value to add to table
    return value;
  }
  
  
  
boolean hasString(String symbol){
    TableRow result=table.findRow("symbol",symbol);
    result.getString(symbol);
    return true;
  }
  
}
