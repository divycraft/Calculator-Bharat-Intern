import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage1 extends StatefulWidget {
  const introPage1({Key? key}) : super(key: key);

  @override
  State<introPage1> createState() => _introPage1State();
}

class _introPage1State extends State<introPage1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BHARAT ",style: TextStyle(fontSize: 31,color: Colors.orange,fontWeight: FontWeight.bold),),
                Text(" INTERN",style: TextStyle(fontSize: 31,color: Colors.green,fontWeight: FontWeight.bold),),
              ],
            ),
            Container(
              height: 400,
              child: Lottie.asset('lib/assets/animation/bharat.json'),
            ),
          ],
        ),
      )

    );
  }
}
