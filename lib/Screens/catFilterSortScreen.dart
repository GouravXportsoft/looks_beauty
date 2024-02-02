// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:looks_beauty/components/search_component.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:velocity_x/velocity_x.dart';

class filterCatScreen extends StatefulWidget {
  const filterCatScreen({super.key});

  @override
  State<filterCatScreen> createState() => _filterCatScreenState();
}

class _filterCatScreenState extends State<filterCatScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List bannerImgs = [
      bannerImage,
      bannerImage,
      bannerImage,
      bannerImage,
      bannerImage
    ];

    return Container(
      decoration: const BoxDecoration(color: safeareaColor),
      child: Scaffold(
        body: Stack(
          children: [
            CustomScrollView(
              slivers: [
                const SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true, // Make the SearchComponent pinned at the top
                  backgroundColor: safeareaColor,
                  expandedHeight: 50, // Adjust the height as needed
                  flexibleSpace: SearchComponent(),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    VxSwiper.builder(
                        height: 160,
                        viewportFraction: 0.9,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 600),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        autoPlay: false,
                        itemCount: bannerImgs.length,
                        itemBuilder: ((context, index) {
                          return Container(
                            height: size.height,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  // width: 100,
                                  bannerImgs[index],
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          );
                        })),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8.0,
                      ),
                      child: Center(
                        child: Text(
                          "Hair Care",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    CatGrid(context),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(bannerImage)),
                    ),
                    Cat_Grid(context)
                  ]),
                )
              ],
            ),
            Row(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          // Your bottom sheet content goes here
                          return Container(
                            height: 200,
                            child: const Center(
                              child: Text("Bottom Sheet Content"),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(color: base2Color),
                      height: 50,
                      width: size.width * .5,
                      // width: size.width / 2,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.sort), Text("Sort by")],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            // Your bottom sheet content goes here
                            return Container(
                              height: 200,
                              child: const Center(
                                child: Text("Bottom Sheet Content"),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(color: base2Color),
                        height: 50,
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.filter), Text("Filter")],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget CatGrid(context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 00),
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(),
        itemCount: 6,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: size.height * .35,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, indx) {
          return Container(
            // width: double.infinity,
            clipBehavior: Clip.antiAlias,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: hintTextColor),
            ),
            child: Column(
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                      color: trendingHimcolor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget Cat_Grid(context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(bottom: 50),
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(),
        itemCount: 2,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: size.height * .35,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemBuilder: (BuildContext context, indx) {
          return Container(
            // width: double.infinity,
            clipBehavior: Clip.antiAlias,
            height: size.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: hintTextColor),
            ),
            child: Column(
              children: [
                Container(
                  height: 140,
                  decoration: const BoxDecoration(
                      color: trendingHimcolor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
