import 'package:flutter/material.dart';
import 'package:looks_beauty/components/appbarforMyAccScreen.dart';
import 'package:looks_beauty/constants/color_constant.dart';

class myAccScreen extends StatefulWidget {
  const myAccScreen({super.key});

  @override
  State<myAccScreen> createState() => _myAccScreenState();
}

class _myAccScreenState extends State<myAccScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: safeareaColor),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true, // Make the SearchComponent pinned at the top
              backgroundColor: safeareaColor,
              expandedHeight: 50, // Adjust the height as needed
              flexibleSpace: appbarMyAcc(
                onTextChange: 'My Account',
                showCartIcon: true,
                title: 'Cart',
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Stack(children: [
                    SizedBox(
                      height: size.height,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: bottomBarColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      "Orders",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: bottomBarColor,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: const Center(
                                    child: Text(
                                      "Wishlist",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 30,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: baseColor,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Wallet",
                                    style: TextStyle(color: Colors.white),
                                  )),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: 16),
                                      child: Text(
                                        "Settings",
                                        style: TextStyle(
                                            color: bottomBarColor,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    )),
                                accountList(context),
                                // Stack(
                                //     alignment: Alignment.bottomCenter,
                                //     children: [
                                //       Container(
                                //         height: 30,
                                //         width: size.width,
                                //         decoration: BoxDecoration(
                                //           color: baseColor,
                                //           borderRadius: BorderRadius.circular(20),
                                //         ),
                                //         child: const Center(
                                //             child: Text(
                                //           "LogOut",
                                //           style: TextStyle(color: Colors.white),
                                //         )),
                                //       ),
                                //     ])
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 260,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Container(
                          height: 40,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: baseColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                              child: Text(
                            "LogOut",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget accountList(context) {
    final List settingOption = ["Address", "Payment Method", "Profile"];
    final List<Function> onTapFunctions = [
      () {
        // Function for the first row
        // Add your code here
      },
      () {
        // Function for the second row
        // Add your code here
      },
      () {
        // Function for the third row
        // Add your code here
      },
    ];

    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        itemCount: settingOption.length,
        itemBuilder: (BuildContext cntx, indx) {
          return Column(
            children: [
              GestureDetector(
                onTap: () {
                  onTapFunctions[indx]();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        settingOption[indx],
                        style: const TextStyle(color: bottomBarColor),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                    )
                  ],
                ),
              ),
              const Divider(),
            ],
          );
        });
  }
}
