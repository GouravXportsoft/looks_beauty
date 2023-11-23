import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/authentication/login.dart';

import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';

class SearchComponent extends StatefulWidget {
  final bool isBackEnabled;
  final bool isComponent;
  final VoidCallback? onBackPress;
  final Function(String)? onTextChange;
  final TextEditingController? searchInputController;

  const SearchComponent({
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

class _SearchComponentState extends State<SearchComponent> {
  String selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration: BoxDecoration(color: base2Color),
        child: Row(
          children: [
            widget.isBackEnabled
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      if (widget.onBackPress != null) {
                        widget.onBackPress!();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: bottomBarColor,
                      ),
                    ),
                  )
                : SizedBox.shrink(),
            Expanded(
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: baseColor),
                ),
                child: GestureDetector(
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          autofocus: false,
                          onChanged: (String query) {
                            // widget.onTextChange?.call(query);
                          },
                          maxLines: 1,
                          controller: widget.searchInputController,
                          decoration: const InputDecoration(
                            hintText: searchText,
                            hintStyle: TextStyle(color: hintTextColor),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            isDense: true,
                          ),
                          style: const TextStyle(fontSize: 4 + 12),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                      const Icon(
                        Icons.search,
                        color: hintTextColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  foregroundImage: AssetImage(faceImg),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDropDown() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Positioned(
              top: 30,
              right: -30,
              child: Container(
                width: 280.0, // Set the desired width
                child: AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildDropDownItem('Profile'),
                      Divider(),
                      buildDropDownItem('Order Details'),
                      Divider(),
                      buildDropDownItem('Logout'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildDropDownItem(String option) {
    return ListTile(
      title: Text(option),
      onTap: () {
        setState(() {
          selectedOption = option;
        });
        Navigator.pop(context);
      },
    );
  }
}
