import 'dart:async';
import 'package:flutter/material.dart';
import 'package:travel_app/public/constant.dart';
import 'package:travel_app/screens/favourite/Favourite.dart';
import 'package:travel_app/screens/home/HomeBody.dart';
import 'package:travel_app/screens/Setting/Setting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selected_index = 0;

  final screens = [ HomeBody(), Favourite(), Setting() ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: screens[selected_index],

      // bottom navigation bar

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selected_index,
          onTap: (value){
            setState(() {
              selected_index= value;
            });
          },
          backgroundColor: Colors.white,
          items:const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home"
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: "Favourite",
            ),

            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting"
            ),

        ]
      ),

    );
  }
}


