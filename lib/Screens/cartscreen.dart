import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/home_screen.dart';
import 'package:looks_beauty/Screens/orderDetails.dart';
import 'package:looks_beauty/Screens/product_Screen.dart';
import 'package:looks_beauty/components/appbarforMyAccScreen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({
    Key? key,
  }) : super(key: key);

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
              hasScrollBody: true,
              child: Stack(
                children: [
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
                                color: bottomBarColor,
                              ),
                            ),
                          ),
                        ),
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your order is delivering to:",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: bottomBarColor,
                            ),
                          ),
                        ),
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
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Orders(context),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 28,
                    left: 16,
                    right: 16,
                    child: ClipRRect(
                      child: Container(
                        height: 48,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Orders(context) {
    final List brandListImage = [mdImg, mdhairImg];

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        brandListImage.length,
        (index) => GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderDetail()),
            );
          },
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    brandListImage[index],
                    scale: 4,
                  ),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }
}
