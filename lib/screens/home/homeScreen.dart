import 'package:flutter/material.dart';
import 'package:travel_app/public/constant.dart';
import 'categoryCart.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:travel_app/models/Product.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selected_index = 0;

  List <Product> products = [

    Product(image: "assets/images/sant.jpg", title: "Sant Benz", desc: "This place is best in Greece", loc: "Greece", price: 320, id: 1),
    Product(image: "assets/images/turkey.jpg", title: "Turkey Palace", desc: "This place is best in Turkey", loc: "Turkey", price: 390, id: 2),
    Product(image: "assets/images/welcome3.jpg", title: "San Francisco", desc: "This place is best in San Francisco", loc: "USA", price: 1810, id: 3),
    Product(image: "assets/images/ny.jpg", title: "New York", desc: "This place is best in USA", loc: "USA", price: 810, id: 4),
    Product(image: "assets/images/welcome1.jpg", title: "Sant Benz", desc: "This place is best in Greece", loc: "Greece", price: 480, id: 5),
    Product(image: "assets/images/santorini.jpg", title: "Sant Benz", desc: "This place is best in Greece", loc: "Greece", price: 820, id: 6),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Icon(
            Icons.person,
            color: fPrimaryColor,
            size: 30,
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Hey Chand", style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
            ),
            SizedBox(height: 5,),
            Text("Explore Beautiful World!", style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 16
            ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            hintText: "Search Places",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none
                            ),
                            prefixIcon: Icon(Icons.search),
                          ),
                        ),
                      )
                  ),
                  const SizedBox(width: 10,),
                  Container(
                    height: 60, width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0)
                    ),
                    child:IconButton(
                      onPressed: () {  },
                      icon: const Icon(
                        Icons.keyboard_voice, size: 30,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  [
                const Text(
                  "Explore Cities", style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: (){}, child: Text("All", style: TextStyle(color: fPrimaryColor),), )
              ],
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                   CategoryCard(title: "Popular", press: (){}),
                   CategoryCard(title: "Nearby", press: (){}),
                   CategoryCard(title: "Lakes", press: (){}),
                   CategoryCard(title: "Recents", press: (){}),
                ],
              ),
            ),
            SizedBox(
              height: 450,
              child:Swiper(
                itemCount: products.length,
                layout: SwiperLayout.STACK,
                itemWidth: 300,
                itemBuilder: (context, index){
                  return Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 450,
                            width: 300,
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(products[index].image, width: 300, height: 300,fit: BoxFit.cover,),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(products[index].title,
                                          style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold
                                          ),
                                        ),
                                        const SizedBox(height: 10,),
                                        Row(
                                          children: [
                                            Icon(
                                                Icons.location_on,
                                                color: fPrimaryColor,
                                            ),
                                            const SizedBox(width: 10,),
                                            Text(
                                              products[index].loc,
                                              style: TextStyle(
                                                color: fSecondaryColor
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 30,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "\$ ${products[index].price}",
                                            ),
                                            Icon(Icons.bookmark, color: fPrimaryColor,)
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  );
                },

              ) ,
            )
          ],
        ),
      ),
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
                label: "Favourite"
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

