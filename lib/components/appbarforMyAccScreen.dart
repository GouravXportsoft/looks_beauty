import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/authentication/login.dart';
import 'package:looks_beauty/Screens/tabBar_Screen.dart';

import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';

class appbarMyAcc extends StatefulWidget {
  final bool isBackEnabled;
  final bool isComponent;
  final VoidCallback? onBackPress;
  final Function(String)? onTextChange;
  final TextEditingController? searchInputController;

  const appbarMyAcc({
    Key? key,
    this.isBackEnabled = false,
    this.isComponent = false,
    this.onBackPress,
    this.onTextChange,
    this.searchInputController,
  }) : super(key: key);

  @override
  _SearchComponentState createState() => _SearchComponentState();
}

class _SearchComponentState extends State<appbarMyAcc> {
  String selectedOption = 'Option 1';

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
                "My Account",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent,
                        border: Border.all(color: baseColor)),
                    child: Center(
                      child: Image.asset(
                        cartImg,
                        scale: 3.2,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
