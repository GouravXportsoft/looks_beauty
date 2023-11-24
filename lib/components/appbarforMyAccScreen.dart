import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/authentication/login.dart';
import 'package:looks_beauty/Screens/cartscreen.dart';
import 'package:looks_beauty/Screens/tabBar_Screen.dart';

import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:looks_beauty/routes/routes.dart';

class appbarMyAcc extends StatefulWidget {
  final bool isBackEnabled;
  final bool isComponent;
  final VoidCallback? onBackPress;
  final String? onTextChange;
  final TextEditingController? searchInputController;
  final bool showCartIcon; // Add this flag

  const appbarMyAcc({
    Key? key,
    this.isBackEnabled = false,
    this.isComponent = false,
    this.onBackPress,
    this.onTextChange,
    this.searchInputController,
    this.showCartIcon = true,
    required String title,
    // Set default value to true
  }) : super(key: key);

  @override
  _SearchComponentState createState() => _SearchComponentState(
      onTextChange: onTextChange, showCartIcon: showCartIcon);
}

class _SearchComponentState extends State<appbarMyAcc> {
  String selectedOption = 'Option 1';

  final String? onTextChange;
  final bool showCartIcon; // Add this flag

  _SearchComponentState(
      {required this.onTextChange, required this.showCartIcon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration: BoxDecoration(color: base2Color),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                color: bottomBarColor,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => TabBarScreen()));
                },
              ),
              Text(
                onTextChange!,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: bottomBarColor),
              ),
              // Show the GestureDetector only if showCartIcon is true
              showCartIcon
                  ? GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen()));
                      },
                      child: Container(
                        height: 33,
                        width: 33,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          border: Border.all(color: baseColor),
                        ),
                        child: Center(
                          child: Image.asset(
                            cartImg,
                            scale: 3.2,
                          ),
                        ),
                      ),
                    )
                  : Container(
                      height: 33,
                      width: 33,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
