import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class introPage2 extends StatefulWidget {
  const introPage2({super.key});

  @override
  State<introPage2> createState() => _introPage2State();
}

class _introPage2State extends State<introPage2> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.green[100],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("App Develpoment",style: TextStyle(fontSize: 31,fontWeight: FontWeight.bold,color: Colors.purple[800]),),
              SizedBox(height: 10,),
              Container(
                height: 300,
                child: Lottie.asset('lib/assets/animation/appDev.json'),
              ),
              SizedBox(height: 10,),
              Text("Intership",style: TextStyle(fontSize: 29,fontWeight: FontWeight.bold,color: Colors.blue[800]),),
            ],
          ),
        )

    );
  }
}
