class Code{
   String mn;
   String binary;
   Table jumpTable;
   Table destTable;
   Table compTable;
   String Comp;
   String Dest;
   String Jump;
   String Mnem;
//String compMnem;

  Code(){
// jumpC();
 jumpTable=new Table();
 this.initjT();
 
  destTable=new Table();
 this.initdT();
 
 compTable=new Table();
 this.initcT();
  }
  
 //create jump table 
  void initjT(){
    jumpTable.addColumn("id",Table.INT);
    jumpTable.addColumn("mn",Table.STRING);
    jumpTable.addColumn("binary",Table.STRING);
    for(int i=0; i<8;i++){
  jumpTable.addRow();
    }
  jumpTable.setInt(0,"id",0); jumpTable.setString(0,"mn","JGT"); jumpTable.setString(0,"binary","001");
  jumpTable.setInt(1,"id",1); jumpTable.setString(1,"mn","JEQ"); jumpTable.setString(1,"binary","010");
  jumpTable.setInt(2,"id",2); jumpTable.setString(2,"mn","JGE"); jumpTable.setString(2,"binary","011");
  jumpTable.setInt(3,"id",3); jumpTable.setString(3,"mn","JLT"); jumpTable.setString(3,"binary","100");
  jumpTable.setInt(4,"id",4); jumpTable.setString(4,"mn","JNE"); jumpTable.setString(4,"binary","101");
  jumpTable.setInt(5,"id",5); jumpTable.setString(5,"mn","JLE"); jumpTable.setString(5,"binary","110");
  jumpTable.setInt(6,"id",6); jumpTable.setString(6,"mn","JMP"); jumpTable.setString(6,"binary","111");
  jumpTable.setInt(7,"id",7); jumpTable.setString(7,"mn","null"); jumpTable.setString(7,"binary","000");
  }
  
  String getBinaryJ(String Mnem){
   TableRow result= jumpTable.findRow(Mnem,"mn"); 
   
    //jumpTable.getRow(jumpTable.findRow(Mnem,"mn"));
    String jump=result.getString("binary");
  return jump;
  }

 //create jump table 
  void initdT(){
    destTable.addColumn("id",Table.INT);
    destTable.addColumn("mn",Table.STRING);
    destTable.addColumn("binary",Table.STRING);
    for(int i=0; i<8;i++){
  destTable.addRow();
    }
  destTable.setInt(0,"id",0); destTable.setString(0,"mn","M"); destTable.setString(0,"binary","001");
  destTable.setInt(1,"id",1); destTable.setString(1,"mn","D"); destTable.setString(1,"binary","010");
  destTable.setInt(2,"id",2); destTable.setString(2,"mn","MD"); destTable.setString(2,"binary","011");
  destTable.setInt(3,"id",3); destTable.setString(3,"mn","A"); destTable.setString(3,"binary","100");
  destTable.setInt(4,"id",4); destTable.setString(4,"mn","AM"); destTable.setString(4,"binary","101");
  destTable.setInt(5,"id",5); destTable.setString(5,"mn","AD"); destTable.setString(5,"binary","110");
  destTable.setInt(6,"id",6); destTable.setString(6,"mn","AMD"); destTable.setString(6,"binary","111");
  destTable.setInt(7,"id",7); destTable.setString(7,"mn","null"); destTable.setString(7,"binary","000");
  }
  
  String getBinaryD(String Mnem){
   TableRow result= destTable.findRow(Mnem,"mn"); 
   
    //jumpTable.getRow(jumpTable.findRow(Mnem,"mn"));
    String dest=result.getString("binary");
  return dest;
  }
  
    void initcT(){
    compTable.addColumn("id",Table.INT);
    compTable.addColumn("mn",Table.STRING);
    compTable.addColumn("binary",Table.STRING);
    for(int i=0; i<29;i++){
  compTable.addRow();
    }
   compTable.setInt(0,"id",0); compTable.setString(0,"mn","0"); compTable.setString(0,"binary","0101010");
  compTable.setInt(1,"id",1); compTable.setString(1,"mn","1"); compTable.setString(1,"binary","0111111");
  compTable.setInt(2,"id",2); compTable.setString(2,"mn","-1"); compTable.setString(2,"binary","0111010");
  compTable.setInt(3,"id",3); compTable.setString(3,"mn","D"); compTable.setString(3,"binary","0001100");
  compTable.setInt(4,"id",4); compTable.setString(4,"mn","A"); compTable.setString(4,"binary","0110000");
  compTable.setInt(5,"id",5); compTable.setString(5,"mn","M"); compTable.setString(5,"binary","1110000");
  compTable.setInt(6,"id",6); compTable.setString(6,"mn","!D"); compTable.setString(6,"binary","0001101");
  compTable.setInt(7,"id",7); compTable.setString(7,"mn","!A"); compTable.setString(7,"binary","0110001");
  compTable.setInt(8,"id",8); compTable.setString(8,"mn","!M"); compTable.setString(8,"binary","1110001");
  compTable.setInt(9,"id",9); compTable.setString(9,"mn","-D"); compTable.setString(9,"binary","0001111");
  compTable.setInt(10,"id",10); compTable.setString(10,"mn","-A"); compTable.setString(10,"binary","0110011");
  compTable.setInt(11,"id",11); compTable.setString(11,"mn","-M"); compTable.setString(11,"binary","1110011");
  compTable.setInt(12,"id",12); compTable.setString(12,"mn","D+1"); compTable.setString(12,"binary","0011111");
  compTable.setInt(13,"id",13); compTable.setString(13,"mn","A+1"); compTable.setString(13,"binary","0110111");
  compTable.setInt(14,"id",14); compTable.setString(14,"mn","M+1"); compTable.setString(14,"binary","0110111");
  compTable.setInt(15,"id",15); compTable.setString(15,"mn","D-1"); compTable.setString(15,"binary","0001110");
  compTable.setInt(16,"id",16); compTable.setString(16,"mn","A-1"); compTable.setString(16,"binary","0110010");
  compTable.setInt(17,"id",17); compTable.setString(17,"mn","M-1"); compTable.setString(17,"binary","1110010");
  compTable.setInt(18,"id",18); compTable.setString(18,"mn","D+A"); compTable.setString(18,"binary","0000010");
  compTable.setInt(19,"id",19); compTable.setString(19,"mn","D+M"); compTable.setString(19,"binary","1000010");
  compTable.setInt(20,"id",20); compTable.setString(20,"mn","D-A"); compTable.setString(20,"binary","0010011");
  compTable.setInt(21,"id",21); compTable.setString(21,"mn","D-M"); compTable.setString(21,"binary","1010011");
  compTable.setInt(22,"id",22); compTable.setString(22,"mn","A-D"); compTable.setString(22,"binary","0000111");
  compTable.setInt(23,"id",23); compTable.setString(23,"mn","M-D"); compTable.setString(23,"binary","1000111");
  compTable.setInt(24,"id",24); compTable.setString(24,"mn","D&A"); compTable.setString(24,"binary","0000000");
  compTable.setInt(25,"id",25); compTable.setString(25,"mn","D&M"); compTable.setString(25,"binary","1000000");
  compTable.setInt(26,"id",26); compTable.setString(26,"mn","D|A"); compTable.setString(26,"binary","0010101");
  compTable.setInt(27,"id",27); compTable.setString(27,"mn","D|M"); compTable.setString(27,"binary","1010101");
  }
  
  String getBinaryC(String Mnem){
   TableRow result= compTable.findRow(Mnem,"mn"); 
   
    //jumpTable.getRow(jumpTable.findRow(Mnem,"mn"));
    String comp=result.getString("binary");  //nullptrexep
  return comp;
  }


}
