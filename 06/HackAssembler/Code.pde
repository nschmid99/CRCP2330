//class Code{

//  //DEST
//  Code(){
//  }
  
//  String dest(String strMn){
//    String destMnem;
//   if( strMn=="null"){
//  destMnem="000";
//  }
//  else if( strMn=="M"){
//  destMnem="001";
//  }
//  else if(strMn=="D"){
//  destMnem="010";
//  }
// else if(strMn=="MD"){
// destMnem="011";
//  }
//  else if(strMn=="A"){
//  destMnem="100";
//  }
//  else if(strMn=="AM"){
//  destMnem="101";
//  }
//  else if(strMn=="AD"){
//  destMnem="110";
//  }
//  else if(strMn=="AMD"){
//  destMnem="111";
//  }
//  else{return "invalid";}
//  println(destMnem);
// return destMnem;
//  }
 
//  //COMP
//  String comp(String strMn){
//  String compMnem;

//  //split temp. first 3 # are 1 4-10 are comp 11-13 are dest 14-16 are jump
//  if(strMn=="0"){
//    compMnem="0101010";
//  }
//  else if(strMn=="1"){
//    compMnem="0111111";
//  }
//  else if(strMn=="-1"){
//    compMnem="0111010";
//  }
//  else if(strMn=="D"){
//   compMnem="0001100";
//  }
//  else if(strMn=="A"){
//    compMnem="0110000";
//  }
//  else if(strMn=="M"){
//    compMnem="1110000";
//  }
//  else if(strMn=="!D"){
//   compMnem="0001101";
//  }
//  else if(strMn=="!A"){
//    compMnem="0110001";
//  }
//  else if(strMn=="!M"){
//    compMnem="1110001";
//  }
//  else if(strMn=="-D"){
//   compMnem="0001111";
//  }
//  else if(strMn=="-A"){
//    compMnem="0110011";
//  }
//  else if(strMn=="-M"){
//    compMnem="1110011";
//  }
//  else if(strMn=="D+1"){
//    compMnem="0011111";
//  }
//  else if(strMn=="A+1"){
//    compMnem="0110111";
//  }
//  else if(strMn=="M+1"){
//    compMnem="0110111";
//  }
//  else if(strMn=="D-1"){
//   compMnem="0001110";
//  }
//  else if(strMn=="A-1"){
//    compMnem="0110010";
//  }
//  else if(strMn=="M-1"){
//    compMnem="1110010";
//  }
//  else if(strMn=="D+A"){
//    compMnem="0000010";
//  }
//  else if(strMn=="D+M"){
//    compMnem="1000010";
//  }
//  else if(strMn=="D-A"){
//    compMnem="0010011";
//  }
//   else if(strMn=="D-M"){
//    compMnem="1010011";
//  }
//  else if(strMn=="A-D"){
//   compMnem="0000111";
//  }
//   else if(strMn=="M-D"){
//   compMnem="1000111";
//  }
//  else if(strMn=="D&A"){
//   compMnem="0000000";
//  }
//  else if(strMn=="D&M"){
//   compMnem="1000000";
//  }
//  else if(strMn=="D|A"){
//    compMnem="0010101";
//  }
//   else if(strMn=="D|"){
//    compMnem="0010101";
//  }
//  else{
//  return "invalid";
//  }
//  println(compMnem);
// // c=compMnem;
// return compMnem;
//  }
  
//  //JUMP
//  String jump(String strMn){
//  println("jump");
//  String jumpMnem;
//  if( strMn=="null"){
//  jumpMnem="000";
//  }
  
//  else if( strMn=="JGT"){
//  jumpMnem="001";
//  }
  
//  else if(strMn=="JEQ"){
//  jumpMnem="010";
//  }
  
// else if(strMn=="JGE"){
//  jumpMnem="011";
//  }
  
//  else if( strMn=="JLT"){
//  jumpMnem="100";
//  }
  
//  else if(strMn=="JNE"){
//  jumpMnem="101";
//  }
  
//  else if(strMn=="JLE"){
//  jumpMnem="110";
//  }
  
//  else if(strMn=="JMP"){
//  jumpMnem="111";
//  }
//  else{
//    return "invalid";
//  }
//  println(jumpMnem);
// return jumpMnem;
//}
  
//}
