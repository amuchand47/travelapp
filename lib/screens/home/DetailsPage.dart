import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../models/Product.dart';
import '../../public/constant.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class DetailsPage extends StatefulWidget {

  Product product;
  DetailsPage(this.product, {Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return DetailsPageState(product);
  }
}
class DetailsPageState extends State<DetailsPage> {
  Product product;
  DetailsPageState(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(product.image, fit: BoxFit.cover,),
          /// Custom Button
          SafeArea(
            child: Container(
              height: 57.6,
              margin: const EdgeInsets.only(top: 28.8, left: 28.8, right: 28.8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 57.6,
                      width: 57.6,
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: const Color(0x10000000),
                      ),
                      child: SvgPicture.asset('assets/svg/icon_left_arrow.svg'),
                    ),
                  ),
                  FavoriteButton()
                ],
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: const EdgeInsets.only(left: 28.8, top: 400, right: 28.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 2,
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.playfairDisplay(
                        fontSize: 46,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                    ),

                  ),
                  const SizedBox(height: 30,),
                  Text(
                    product.desc,
                    maxLines: 5,
                    overflow: TextOverflow.fade,
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),

                  ),
                  const SizedBox(height: 55,),
                  Container(
                    height: 62.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9.6),
                        color: Colors.white
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        padding: const EdgeInsets.only(left: 28.8, right: 28.8),
                        child: FittedBox(
                          child: Text(
                            'Explore Now >>',
                            style: GoogleFonts.lato(
                                fontSize: 26,
                                fontWeight: FontWeight.w700,
                                color: Colors.black
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// FavoriteButton Icon
///
class FavoriteButton extends StatefulWidget {
  const FavoriteButton({Key? key}) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 57.6,
        width: 57.6,
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(9.6),
          color: const Color(0x10000000),
        ),
        child: SvgPicture.asset(isFavorite
            ? 'assets/svg/icon_heart_fill_red.svg'
            : 'assets/svg/icon_heart_fill.svg'),
      ),
      onTap: () {
        print('Sebelum klik tombol => $isFavorite');
        setState(() {
          isFavorite = !isFavorite;
          print('Setelah klik tombol => $isFavorite');
        });
      },
    );
  }
}