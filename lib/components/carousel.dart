import 'dart:async';
import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/product_Screen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class Carousel extends StatefulWidget {
  // final double width;
  // final List itemList;
  // final Function(int) onClick;
  const Carousel({
    super.key,
    // required this.width,
    //  this.itemList,
    //  this.onClick
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int _pageIndex = 0;
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_pageIndex < 3 - 1) {
        setState(() {
          _pageIndex = _pageIndex + 1;
        });
        pageController.animateToPage(
          _pageIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      } else {
        setState(() {
          _pageIndex = 0;
        });
        pageController.animateToPage(
          _pageIndex,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  openProductDetailScreen(
    BuildContext context,
  ) {
    // print("Product ID: ${product.id}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductDetailScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: base2Color,
      width: size.width,
      height: size.height / 5.5,
      child: Stack(children: [
        PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          onPageChanged: (value) => setState(() {
            _pageIndex = value;
          }),
          itemBuilder: (context, index) {
            // final carouselItem = widget.itemList[index];
            return Stack(
              // alignment: AlignmentDirectional.center,
              children: [
                GestureDetector(
                    onTap: () {
                      // widget.onClick(int.parse(carouselItem['id']));
                      openProductDetailScreen(context);
                    },
                    child: Image.asset(
                      bannerImage,
                      fit: BoxFit.cover,
                      height: size.height,
                    )),
              ],
            );
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...Iterable<int>.generate(3).toList().map(
                      (idx) => Transform.scale(
                        scale: idx == _pageIndex ? 2 : 1,
                        child: AnimatedContainer(
                          curve: Curves.bounceIn,
                          duration: const Duration(milliseconds: 100),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: idx == _pageIndex
                                ? Color.fromARGB(255, 0, 0, 0)
                                : baseColor,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          width: 4,
                          height: 4,
                        ),
                      ),
                    )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
