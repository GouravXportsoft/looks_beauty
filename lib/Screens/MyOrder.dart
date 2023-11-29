import 'package:flutter/material.dart';
import 'package:looks_beauty/components/appbarforMyAccScreen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({Key? key}) : super(key: key);

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

String selectedOption = 'Option 1';

class _MyOrderScreenState extends State<MyOrderScreen> {
  late GlobalKey _dropdownKey;
  String searchText = 'Search Your Order';

  @override
  void initState() {
    super.initState();
    _dropdownKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: safeareaColor,
            expandedHeight: 50, // Adjust the value as needed
            flexibleSpace: appbarMyAcc(
              showCartIcon: true,
              onTextChange: 'Your Order',
              title: '', // Add a title if needed
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 50),
                  child: GestureDetector(
                    onTap: () {
                      showDropDown(context);
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.transparent,
                        border: Border.all(color: bottomBarColor),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(searchText),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Orderss(context)
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showDropDown(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 200.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildDropDownItem('Option 1', context),
                buildDropDownItem('Option 2', context),
                buildDropDownItem('Option 3', context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildDropDownItem(String option, BuildContext context) {
    return ListTile(
      title: Text(option),
      onTap: () {
        setState(() {
          selectedOption = option;
          searchText = '$option';
        });
        Navigator.pop(context);
      },
    );
  }
}

Widget Orderss(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return ListView.builder(
    shrinkWrap: true,
    itemCount: 10, // Specify the itemCount
    itemBuilder: (BuildContext context, int index) {
      return Container(
        width: size.width,
        height: 100,
        decoration: BoxDecoration(color: trendingHimcolor),
      );
    },
  );
}
