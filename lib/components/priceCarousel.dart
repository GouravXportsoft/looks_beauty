import 'dart:async';

import 'package:flutter/material.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class PriceCaraousel extends StatefulWidget {
  const PriceCaraousel({super.key});

  @override
  State<PriceCaraousel> createState() => _PriceCaraouselState();
}

class _PriceCaraouselState extends State<PriceCaraousel> {
  int _pageIndex = 0;
  final PageController pageController1 = PageController();

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (mounted) {
        if (_pageIndex < 3 - 1) {
          setState(() {
            _pageIndex = _pageIndex + 1;
          });
          pageController1.animateToPage(
            _pageIndex,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        } else {
          setState(() {
            _pageIndex = 0;
          });
          pageController1.animateToPage(
            _pageIndex,
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeIn,
          );
        }
      } else {
        timer.cancel(); // Cancel the timer if the widget is disposed
      }
    });
  }

  @override
  void dispose() {
    pageController1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 10,
      child: Stack(children: [
        PageView.builder(
          controller: pageController1,
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
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        halfpricestoreImg,
                        height: size.height,
                        width: size.width,
                        fit: BoxFit.cover,
                      ),
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
