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
                SliverAppBar(
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
                        autoPlayAnimationDuration: Duration(milliseconds: 600),
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
                    CatGrid(context)
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
                            child: Center(
                              child: Text("Bottom Sheet Content"),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(color: base2Color),
                      height: 100,
                      width: size.width * .5,
                      // width: size.width / 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.sort), Text("Sort by")],
                      ),
                    ),
                  ),
                ),
                SizedBox(
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
                              child: Center(
                                child: Text("Bottom Sheet Content"),
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(color: base2Color),
                        height: 100,
                        child: Row(
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

    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Text(
            "Hair Care",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: size.height * 4, // Set a specific height for the container
          child: Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
              ),
              itemBuilder: (BuildContext context, indx) {
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        decoration: BoxDecoration(color: Colors.blue),
                      ),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                      Text("data"),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
