import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/home_screen.dart';
import 'package:looks_beauty/Screens/product_Screen.dart';
import 'package:looks_beauty/components/appbarforMyAccScreen.dart';
import 'package:looks_beauty/components/starRating.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    super.key,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  showSnackbar() {
    const snackBar = SnackBar(
      content: Text('Something went wrong, please try again'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showPaymentSuccessSnackbar() {
    const snackBar = SnackBar(
      content: Text('Order created successfully'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(color: safeareaColor),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: safeareaColor,
              expandedHeight: 50,
              flexibleSpace: appbarMyAcc(
                showCartIcon: false,
                onTextChange: 'Cart',
                title: '',
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 28),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 48,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: baseColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
                          child: Text(
                            "Proceed To Buy",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(12),
                          child: Center(
                              child: Text(
                            "Subtotal ₹1100.00",
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: bottomBarColor),
                          )),
                        ),
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Your order is delivering to:",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: bottomBarColor),
                            )),
                        Row(
                          children: [
                            const Expanded(
                              child: Text(
                                "Xportsoft Technologies, Kardhan Road, Khojkipur, Ambala Cantt - 133001",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Change",
                                  style: TextStyle(color: bottomBarColor),
                                ))
                          ],
                        ),
                        Orders(context),
                        BestSellerCard(),
                        // discoverMore(context)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Orders(context) {
    Size size = MediaQuery.of(context).size;
    final List brandListImage = [mdImg, mdhairImg];
    openProductDetailScreen(context) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
    }

    return Container(
      height: 200,
      color: brandBackColor,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                semanticChildCount: 2,
                shrinkWrap: true,

                // physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: brandListImage.length,
                itemBuilder: (BuildContext cntx, indx) {
                  return GestureDetector(
                    onTap: () {
                      openProductDetailScreen(context);
                    },
                    child: Image.asset(
                      brandListImage[indx],
                      scale: 2,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
