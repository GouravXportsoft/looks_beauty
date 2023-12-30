import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:looks_beauty/components/product_detail_carousel.dart';
import 'package:looks_beauty/components/search_component.dart';
import 'package:looks_beauty/components/starRating.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/size_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final List catImages = [mdImg, mdImg, mdImg, mdImg];
  final List catImageText = [mdText, mdHairText, mdRestorText, mdImg];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: const BoxDecoration(color: safeareaColor),
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true, // Make the SearchComponent pinned at the top
              backgroundColor: safeareaColor,
              expandedHeight: 50, // Adjust the height as needed
              flexibleSpace: SearchComponent(
                isBackEnabled: true,
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Maybelline Fit Me - Matte+Poreless",
                                  style: TextStyle(fontSize: 19),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Text(
                                "4.5",
                                style: TextStyle(
                                    color: bottomBarColor, fontSize: 2 + 10),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 7),
                                child: SmoothStarRating(
                                  color: startColor, rating: 5,
                                  borderColor: startColor,
                                  // rating: double.tryParse(product[
                                  //         'average_rating']) ??
                                  //     0,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 5, bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(right: 8),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4, vertical: 2),
                                        decoration: const BoxDecoration(
                                            color: bottomBarColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(2))),
                                        child: const Text(
                                          "Bestseller",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 2 + 10),
                                        ),
                                      ),
                                      const Text(
                                        "From Maybelline",
                                        style: TextStyle(
                                            color: bottomBarColor,
                                            fontSize: 2 + 10),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const ProductDetailCarousel(),
                        const Divider(),
                        const SelctedSize(),
                        const Divider(),
                        const Padding(
                          padding: EdgeInsets.only(top: 0, right: 16, left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                productDetails,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 2 + 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Brand",
                                  style: TextStyle(
                                      color: bottomBarColor,
                                      fontSize: 2 + 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Maybelline",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Item Form",
                                  style: TextStyle(
                                      color: bottomBarColor,
                                      fontSize: 2 + 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Creame",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Material Feature",
                                  style: TextStyle(
                                      color: bottomBarColor,
                                      fontSize: 2 + 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "Hybrid",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "No. of Items",
                                  style: TextStyle(
                                      color: bottomBarColor,
                                      fontSize: 2 + 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "1",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "Net Quality",
                                  style: TextStyle(
                                      color: bottomBarColor,
                                      fontSize: 2 + 13,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  "120.0 ML",
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                        const Padding(
                          padding:
                              EdgeInsets.only(top: 8.0, right: 16, left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                discoverMoreText,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 2 + 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        discoverMore(context)
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget discoverMore(context) {
  Size size = MediaQuery.of(context).size;
  final List CatImages = [mdImg, mdImg, mdImg, mdImg];
  final List CatImageText = [mdText, mdHairText, mdRestorText, mdImg];
  return Container(
    height:
        size.height / 2.2, // Set the desired height for your horizontal list
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: CatImages.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext contx, indx) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: size.height,
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
                                height: 150,
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(Icons.shopping_cart),
                                  Icon(
                                    Icons.favorite,
                                    color: Colors.pink,
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
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  const Text(
                    bestsellerText,
                    style: TextStyle(fontWeight: FontWeight.w500),
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
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 19,
                          ),
                        ),
                        const Text('4.8')
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

class SelctedSize extends StatefulWidget {
  const SelctedSize({
    super.key,
  });

  @override
  State<SelctedSize> createState() => _SelctedSizeState();
}

class _SelctedSizeState extends State<SelctedSize> {
  var index = 0;
  List item = [1, 2, 3, 4, 5];
  final List<String> _item = ['1', '2', '3', '4', '5'];
  String? selectedItem = '1';
  bool isLoading = false;

  @override
  Widget build(
    BuildContext context,
  ) {
    Size size = MediaQuery.of(context).size;

    return Column(children: [
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              dealOfTheDayText,
              style: TextStyle(color: bottomBarColor, fontSize: 15),
            ),
          ],
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Text(
              "-10% ",
              style: TextStyle(color: baseColor, fontSize: 2 + 24),
            ),
            Text(
              "Rs. 980.00  ",
              style: TextStyle(color: bottomBarColor, fontSize: 2 + 24),
            ),
          ],
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: bottomBarColor, fontSize: 2 + 10),
                children: [
                  TextSpan(
                    text: "M.R.P.",
                  ),
                  TextSpan(
                      text: " Rs 1075 - ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: bottomBarColor)),
                  // if (product['on_sale']) ...[
                  //   TextSpan(
                  //       text: "Rs. ${product['regular_price']} ",
                  //       style: const TextStyle(
                  //           decoration: TextDecoration.lineThrough,
                  //           fontSize: 2 + 10))
                  // ],
                  TextSpan(
                      text: "Inclusive Of All Taxes",
                      style:
                          TextStyle(color: bottomBarColor, fontSize: 2 + 10)),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      const Divider(),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: bottomBarColor, fontSize: 2 + 10),
                children: [
                  TextSpan(
                    text: "Order in the ",
                  ),
                  TextSpan(
                      text: " next 9 hours 34 minutes ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: bottomBarColor)),
                  // if (product['on_sale']) ...[
                  //   TextSpan(
                  //       text: "Rs. ${product['regular_price']} ",
                  //       style: const TextStyle(
                  //           decoration: TextDecoration.lineThrough,
                  //           fontSize: 2 + 10))
                  // ],
                  TextSpan(
                      text: "to get it between",
                      style:
                          TextStyle(color: bottomBarColor, fontSize: 2 + 10)),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),

      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: bottomBarColor, fontSize: 2 + 10),
                children: [
                  TextSpan(
                      text: "Wednesday, 26th April",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: bottomBarColor)),

                  TextSpan(
                    text: " And Monday, 1st May",
                  ),
                  // if (product['on_sale']) ...[
                  //   TextSpan(
                  //       text: "Rs. ${product['regular_price']} ",
                  //       style: const TextStyle(
                  //           decoration: TextDecoration.lineThrough,
                  //           fontSize: 2 + 10))
                  // ],
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      //BUTTONS
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "In Stock",
                // product['stock_status'] == "instock"
                //     ? "In Stock"
                //     : "Out Of Stock",
                style: TextStyle(
                    fontSize: 14,
                    color: textGreenColor,
                    fontWeight: FontWeight.w700),
              ),
            ),
            // quantityChangeWrapper(cartItem, cartProvider),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 7),
              child: Container(
                height: 40,
                // width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffE4E4E4),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Text(
                            'Qty:',
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                color: bottomBarColor),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: DropdownButton<String>(
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedItem = newValue;
                              });
                            },
                            underline: Container(
                              height: 1,
                              color: const Color(0xffE4E4E4),
                            ),
                            value: selectedItem,
                            alignment: Alignment.center,
                            borderRadius: BorderRadius.circular(10),
                            items: _item
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                            color: bottomBarColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ));
                            }).toList(),
                          ),
                        )
                      ]),
                ),
              ),
            ),
          ],
        ),
      ),
      const Divider(),

      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: Row(children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: featuresSize,
                      height: featuresSize,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          deliveryImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      freeDeliveryText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: bottomBarColor, fontSize: 2 + 10),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: featuresSize,
                      height: featuresSize,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          cashImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      codText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: bottomBarColor, fontSize: 2 + 10),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: featuresSize,
                      height: featuresSize,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          returnImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      refundableText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: bottomBarColor, fontSize: 2 + 10),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(50)),
                    child: SizedBox(
                      width: featuresSize,
                      height: featuresSize,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          privacyImage,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      secureTransactionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: bottomBarColor, fontSize: 2 + 10),
                    ),
                  ),
                ],
              ),
            ),
          ])),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {},
              child: Container(
                height: 50,
                width: size.width / 2.2,
                // margin: const EdgeInsets.only(top: 8, right: 16, left: 16),
                // width: double.infinity,
                // padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    addToCartText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 + 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {},
              child: Container(
                height: 50, width: size.width / 2.2,
                // margin: const EdgeInsets.only(top: 8, right: 16, left: 16),
                // width: double.infinity,
                // padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                    color: bottomBarColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: const Center(
                  child: Text(
                    buyNowText,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2 + 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }
}
