import 'package:flutter/material.dart';
import 'package:travel_app/screens/home/homeScreen.dart';
import '../public/constant.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/images/sant_dom.jpg", fit: BoxFit.cover,),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:  [
                   const Text("Let's make", style:  TextStyle(
                      fontSize: 32,
                      wordSpacing: 2.5,
                      color: Colors.white
                    ),
                  ),
                   const Text("your dream\nvacation.", style: TextStyle(
                      fontSize: 36,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 4.5
                     ),
                   ),
                   const SizedBox(height: 50,),
                   Container(
                     height: 60,width: 60,
                     decoration: BoxDecoration(
                       color: fSecondaryColor,
                       borderRadius: BorderRadius.circular(20)
                     ),
                     child: IconButton(
                       onPressed: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                       },
                       icon: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
                     ),

                   )
            ],
          ),
              )
          ),

        ],
      ),
    );
  }
}
