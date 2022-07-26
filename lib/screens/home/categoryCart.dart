import 'package:flutter/material.dart';
import '../../public/constant.dart';

class CategoryCard extends StatelessWidget {

  final String title;
  final VoidCallback press;

  const CategoryCard({Key? key, required this.title, required this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: InkWell(
            onTap: press,
            child: Container(
              decoration: BoxDecoration(color: fPrimaryColor, borderRadius: BorderRadius.circular(15.0)),
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
