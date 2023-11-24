import 'package:flutter/material.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';

class TabCatScreen extends StatelessWidget {
  TabCatScreen({super.key});
  final List CatImages = [mdImg, mdhairImg, mdImg, mdImg];
  final List CatImageText = [mdText, mdHairText, mdRestorText, mdImg];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: CatImages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext contx, indx) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                width: size.width / 2,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8)),
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
                                  height: 120,
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                      size: 17,
                                    ),
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.pink,
                                      size: 17,
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
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: const Text(
                        bestsellerText,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
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
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 19,
                            ),
                          ),
                          Text('4.8')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
