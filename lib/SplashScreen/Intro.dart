import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../homePage.dart';
import 'Intro_Page_2.dart';
import 'Intro_Page_3.dart';
import 'Intro_page_1.dart';
class introSplash extends StatefulWidget {
  const introSplash({super.key});

  @override
  State<introSplash> createState() => _introSplashState();
}

class _introSplashState extends State<introSplash> {
  PageController _controller= PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index){
              setState(() {
                onLastPage=(index==2);
              });
            },
            controller: _controller,
            children: [
              introPage1(),
              introPage2(),
              introPage3(),

            ],
          ),
          
          Container(
            alignment: Alignment(0,0.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //skip
                  GestureDetector(
                      onTap: (){
                        _controller.jumpToPage(2);
                      },
                      child: Text("Skip",style: TextStyle(fontSize: 21,color: Colors.orange))
                  ),

                  //indicator
                  SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                    axisDirection: Axis.horizontal,
                    effect:  SlideEffect(
                        dotColor:  Colors.white,
                      type: SlideType.slideUnder,
                    ),
                  ),

                  // done or next
                  onLastPage
                  ?GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home_page(),));
                    },
                      child: Text("Done",style: TextStyle(fontSize: 21,color: Colors.green),)
                  ):
                  GestureDetector(
                      onTap: (){
                        _controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text("Next",style: TextStyle(fontSize: 21,))
                  ),

                ],
              ))
        ],
      ),
    );
  }
}
