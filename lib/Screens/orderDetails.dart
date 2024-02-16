// ignore: file_names
import 'package:flutter/material.dart';
import 'package:looks_beauty/components/appbarforMyAccScreen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class OrderDetail extends StatefulWidget {
  const OrderDetail({Key? key}) : super(key: key);

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: safeareaColor,
            expandedHeight: 50, // Adjust the value as needed
            flexibleSpace: appbarMyAcc(
              showCartIcon: true,
              onTextChange: 'Order Details',
              title: '', // Add a title if needed
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                OrderIncart(),
                const Text("How’s your item?",
                    style: TextStyle(
                        color: bottomBarColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: orderDetailsItem(context),
                ),
                const Text(
                  "Order info",
                  style: TextStyle(
                      color: bottomBarColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: orderInfoItem(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget OrderIncart() {
  return Container(
    decoration: const BoxDecoration(color: trendingHimcolor),
    padding: const EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          mdImg,
          scale: 3,
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Maybellinne Fit me - Matte+Poreless',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 8),
                Text(
                  'Purchased on 20-Nov-2023',
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 30,
            width: 100,
            decoration: const BoxDecoration(
              color: baseColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: const Center(
              child: Text(
                "Buy it again",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget orderDetailsItem(context) {
  final List settingOption = [
    "Write a Product Review",
    "Create a Video Review",
  ];
  final List<Function> onTapFunctions = [
    () {
      // Function for the first row
      // Add your code here
    },
    () {
      // Function for the second row
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

Widget orderInfoItem(context) {
  final List settingOption = [
    "View order details",
    "Download invoice",
  ];
  final List<Function> onTapFunctions = [
    () {
      // Function for the first row
      // Add your code here
    },
    () {
      // Function for the second row
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
