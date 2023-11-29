import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/MyOrder.dart';
import 'package:looks_beauty/components/search_component.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  int selectedCategoryIndex = 0; // 0 for Women's, 1 for Men's

  final List menImg = [
    menHairImg,
    menBeardImg,
    menSkinImg,
    menBathImg,
    menWelnessImg
  ];
  final List menImgname = [
    "Hair",
    "Beard",
    "Skin Care",
    "Bath & Body",
    "wellness"
  ];

  final List womenImg = [
    womenMakeUpImg,
    womenFaceImg,
    womenHairImg,
    womenLipImg,
    womenEyeImg,
    womenNailImg,
    womenSpaImg,
    womenOtherImg
  ];

  final List womenimgName = [
    "MakeUp",
    "Face",
    "Hair",
    "Lip Care",
    "Eyes",
    "Nails",
    "Spa",
    "Other"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: safeareaColor),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: safeareaColor,
              expandedHeight: 50,
              flexibleSpace:
                  SearchComponent(), // Make sure to implement SearchComponent
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildCategoryRow("MEN'S", 1),
                      buildCategoryRow("WOMEN'S", 0),
                      selectedCategoryIndex == 0
                          ? GestureDetector(
                              onTap: () {
                                navigateToMyOrderScreen();
                              },
                              child: womenGridItem(),
                            )
                          : GestureDetector(
                              onTap: () {
                                navigateToMyOrderScreen();
                              },
                              child: menGridItem(),
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCategoryRow(String label, int index) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: Ink(
              width: 70,
              decoration: BoxDecoration(
                color: selectedCategoryIndex == index ? baseColor : null,
                border: Border.all(
                  color:
                      selectedCategoryIndex == index ? baseColor : base2Color,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    label,
                    style: TextStyle(
                      color: selectedCategoryIndex == index
                          ? Colors.white
                          : baseColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
    );
  }

  void navigateToMyOrderScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyOrderScreen()),
    );
  }

  Widget menGridItem() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      cacheExtent: 0,
      shrinkWrap: true,
      itemCount: menImg.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return buildGridItem(menImg[index], menImgname[index]);
      },
    );
  }

  Widget womenGridItem() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: womenImg.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return buildGridItem(womenImg[index], womenimgName[index]);
      },
    );
  }

  Widget buildGridItem(String image, String name) {
    return Column(
      children: [
        Image.asset(image, scale: 4),
        Text(name),
      ],
    );
  }
}
