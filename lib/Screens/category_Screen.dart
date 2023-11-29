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
              flexibleSpace: SearchComponent(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCategoryIndex = 1; // Men's
                                });
                              },
                              child: Ink(
                                width: 70,
                                decoration: BoxDecoration(
                                  color: selectedCategoryIndex == 1
                                      ? baseColor
                                      : null,
                                  border: Border.all(
                                    color: selectedCategoryIndex == 1
                                        ? baseColor
                                        : base2Color,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Text(
                                      "MEN'S",
                                      style: TextStyle(
                                        color: selectedCategoryIndex == 1
                                            ? Colors.white
                                            : baseColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedCategoryIndex = 0; // Women's
                                });
                              },
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: selectedCategoryIndex == 0
                                      ? baseColor
                                      : null,
                                  border: Border.all(
                                    color: selectedCategoryIndex == 0
                                        ? baseColor
                                        : base2Color,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Text(
                                      "WOMEN'S",
                                      style: TextStyle(
                                        color: selectedCategoryIndex == 0
                                            ? Colors.white
                                            : baseColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      selectedCategoryIndex == 0
                          ? GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyOrderScreen()),
                                );
                              },
                              child: womenGridItem())
                          : GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyOrderScreen()),
                                );
                              },
                              child: menGridItem()),
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
      itemBuilder: (BuildContext contx, indx) {
        return Column(
          children: [
            Image.asset(menImg[indx], scale: 4),
            Text(menImgname[indx])
          ],
        );
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
      itemBuilder: (BuildContext contx, indx) {
        return Column(
          children: [
            Image.asset(
              womenImg[indx],
              scale: 4,
            ),
            Text(womenimgName[indx])
          ],
        );
      },
    );
  }
}
