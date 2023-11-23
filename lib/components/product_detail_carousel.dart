import 'dart:async';
import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/product_Screen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class ProductDetailCarousel extends StatefulWidget {
  const ProductDetailCarousel({super.key});

  @override
  State<ProductDetailCarousel> createState() => _ProductDetailCarouselState();
}

class _ProductDetailCarouselState extends State<ProductDetailCarousel> {
  int _pageIndex = 0;
  final PageController pageController = PageController();

  bool isActive = false;

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

  openProductDetailScreen(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          children: [
            Center(
              child: Container(
                // color: baseColor,
                width: size.width * 0.8,
                height: 250,
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  onPageChanged: (value) => setState(() {
                    _pageIndex = value;
                  }),
                  itemBuilder: (context, index) {
                    // final carouselItem = widget.images[index];
                    return Image.asset(
                      productphoto,
                      fit: BoxFit.cover,
                      // height: detailsCarouselHeight,
                      // width: size.width
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    ...Iterable<int>.generate(3).toList().map(
                          (idx) => Transform.scale(
                            scale: idx == _pageIndex ? 1.5 : 1.5,
                            child: AnimatedContainer(
                              curve: Curves.bounceIn,
                              duration: const Duration(milliseconds: 100),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  color: idx == _pageIndex
                                      ? bottomBarColor
                                      : Colors.white,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  border: Border.all(
                                      color: bottomBarColor, width: 1)),
                              width: 4,
                              height: 4,
                            ),
                          ),
                        ),
                  ],
                ),
              ),
              Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                    color: const Color(0xffFDFDFD),
                    borderRadius: BorderRadius.circular(30)),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        isActive = !isActive;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: isActive ? Colors.pink : Colors.grey,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: const Color(0xffFDFDFD),
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: IconButton(
                            onPressed: () {
                              // shareImages(slug);
                            },
                            icon: const Icon(
                              Icons.share_outlined,
                              size: 25,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
