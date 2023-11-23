import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/authentication/login.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';

class SearchComponent extends StatelessWidget {
  final bool isBackEnabled;
  final bool isComponent;
  final VoidCallback? onBackPress;

  final Function(String)? onTextChange;
  final TextEditingController? searchInputController;

  const SearchComponent(
      {super.key,
      this.isBackEnabled = false,
      this.isComponent = false,
      this.onBackPress,
      this.onTextChange,
      this.searchInputController});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 70,
        decoration: const BoxDecoration(color: base2Color),
        child: Row(
          children: [
            isBackEnabled
                ? GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      if (onBackPress != null) {
                        onBackPress!();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: bottomBarColor,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: baseColor)),
                child: GestureDetector(
                  // onTap: isComponent
                  //     ? () {
                  //         // Navigator.pushNamed(context, searchScreen);
                  //       }
                  //     : null,
                  child: Row(
                    children: [
                      Expanded(
                        child:
                            // isComponent
                            //     ?
                            //      const Text(
                            //         emailText,
                            //         style: TextStyle(
                            //             fontSize: 2 + 12, color: hintTextColor),
                            //       )
                            //     :
                            TextField(
                          autofocus: false,
                          onChanged: (String query) {
                            // onTextChange?.call(query);
                          },
                          maxLines: 1,
                          controller: searchInputController,
                          decoration: const InputDecoration(
                            hintText: searchText,
                            hintStyle: TextStyle(color: hintTextColor),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            isDense: true, // Added this
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
            // GestureDetector(
            //   onTap: () {
            //     // _openScanner(context);
            //   },
            //   child: SizedBox(
            //     // width: searchComponentIcons,
            //     // height: searchComponentIcons,
            //     child: Image.asset(appleImage, scale: 5),
            //   ),
            // ),grgr
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    foregroundImage: AssetImage(faceImg),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  openScanner(BuildContext context) {
    // Navigator.pushNamed(context, qrScannerRoute);
  }

  _sendEmail() {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@orthooil.com',
      queryParameters: {'subject': '', 'body': ''},
    );
    // launchUrl(emailLaunchUri);
  }
}
