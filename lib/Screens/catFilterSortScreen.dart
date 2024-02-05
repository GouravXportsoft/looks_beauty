// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:looks_beauty/components/search_component.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:looks_beauty/provider/homeprovider.dart';
import 'package:provider/provider.dart';
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

    List sortList = [
      "Discount",
      "Price - Low to High",
      "Price - High to Low",
      "Top Rated",
      "New arrivals"
    ];
    return Scaffold(
      body: Consumer<HomeProvider>(builder: (_, homeProvider, __) {
        return Stack(
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
                          return Consumer<HomeProvider>(
                              builder: (_, provider, __) {
                            return SizedBox(
                                height: size.height / 2.5,
                                child: Column(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(14.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Sort By",
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                        child: ListView(
                                      children: sortList.map((e) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              // Toggle the checkbox state when the row is tapped
                                              provider.addToList(e);
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(e),
                                                  Checkbox(
                                                    activeColor:
                                                        baseColor, // Replace with your desired color
                                                    value: provider.sortList
                                                        .contains(e),
                                                    onChanged: (value) => {
                                                      provider.addToList(e),
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ))
                                  ],
                                ));
                          });
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
                              // Set the desired height for the bottom sheet content
                              // Adjust this value according to your needs
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
        );
      }),
    );
  }

  Widget CatGrid(context) {
    Size size = MediaQuery.of(context).size;
    final List CatImages = [mdImg, mdImg, mdImg, mdImg];
    final List CatImageText = [mdText, mdHairText, mdRestorText, mdImg];

    return Padding(
      padding: const EdgeInsets.only(bottom: 00),
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        physics: const BouncingScrollPhysics(),
        itemCount: 4,
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

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.transparent,
              border: Border.all(color: hintTextColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: tabCatBackcolor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              CatImages[indx],
                              height: 150,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.shopping_cart),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  CatImageText[indx],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const Text(
                  bestsellerText,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 25,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                            child: Text(
                          "Rs. 449",
                          style: TextStyle(color: Colors.green),
                        )),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 19,
                        ),
                      ),
                      const Text('4.8')
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget Cat_Grid(context) {
    Size size = MediaQuery.of(context).size;
    final List CatImages = [mdImg, mdImg, mdImg, mdImg];
    final List CatImageText = [mdText, mdHairText, mdRestorText, mdImg];

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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: tabCatBackcolor,
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Image.asset(
                              CatImages[indx],
                              height: 150,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.shopping_cart),
                                Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  CatImageText[indx],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                const Text(
                  bestsellerText,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 25,
                        width: 60,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                            child: Text(
                          "Rs. 449",
                          style: TextStyle(color: Colors.green),
                        )),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 19,
                        ),
                      ),
                      const Text('4.8')
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
