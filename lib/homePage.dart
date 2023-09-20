import 'package:calculater_app/utils/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});
  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  var userinput="";
  var answer="0";
  var fontS=27.0;
  var col=Colors.white;
  var chStyle=false ;
  List<String> butText=[
    "C", "DEL", "%", "/",
    "7", "8", "9", "x",
    "4", "5", "6", "-",
    "1", "2", "3", "+",
    "0", ".","ANS", "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                          child: Text(userinput,style: TextStyle(color: Colors.white,fontSize: 35,fontWeight: FontWeight.bold),)),
                      SizedBox(height: 20,),
                      Container(
                        alignment: Alignment.bottomRight,
                          child: Text(answer,style: TextStyle(color: col,fontSize: fontS,fontWeight: FontWeight.bold),)),
                    ],
                  ),
                ),
              ),
          ),
          Expanded(
          flex: 2,
           child:Container(
             child:GridView.builder(
               itemCount: butText.length,
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
               itemBuilder: (context, index) {
                 switch (index){
                   case 0:
                     return buttons(
                       buttonTap: (){
                         setState(() {
                           userinput="";
                           answer="0";
                           col=Colors.white;
                           fontS=27.0;
                         });
                       },
                       text: butText[index],
                       colol: Colors.orangeAccent,
                       textcol: Colors.white,
                     );
                   case 1:
                     return buttons(
                       buttonTap: (){
                         setState(() {
                           userinput=userinput.substring(0,userinput.length-1);
                         });
                       },
                         text: butText[index],
                       colol: Colors.orangeAccent,
                       textcol: Colors.white,
                     );

                   case 19:
                     return buttons(
                       buttonTap: (){
                         setState(() {
                           onEqualPress();
                         });
                       },
                       text: butText[index],
                       colol: Colors.orangeAccent,
                       textcol: Colors.white,
                     );
                   default:
                     if(butText[index]=='ANS'){
                       return buttons(
                         buttonTap: (){
                           setState(() {

                             onEqualPress();
                             fontS=39.0;
                             col=Colors.green.shade700;
                             userinput="";
                             chStyle=true;
                           });
                         },
                         text: butText[index],
                         colol: Colors.grey[800] ,
                         textcol: isOper(butText[index])?Colors.deepOrange[600]:Colors.white,
                       );
                     }
                     return buttons(
                       buttonTap: (){
                         setState(() {
                           if (chStyle){
                             col=Colors.white;
                             fontS=27.0;
                             chStyle=false;
                           }
                           userinput+=butText[index];
                         });
                       },
                       text: butText[index],
                       colol: Colors.grey[800] ,
                       textcol: isOper(butText[index])?Colors.deepOrange[600]:Colors.white,
                     );
                 }
               }
             ),
            ),
          ),
        ],
      ),
    );
  }
  bool isOper(String s) {
    if (s == "%" || s == "/" || s == "x" || s == "-" || s == "+" || s == "=") {
      return true;
    }
    return false;
  }

  void onEqualPress(){
    String finalQues=userinput;
    finalQues=finalQues.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQues);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer=eval.toString();
  }
}
