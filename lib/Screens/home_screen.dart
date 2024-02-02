import 'package:looks_beauty/Screens/product_Screen.dart';
import 'package:looks_beauty/Screens/tab_cat_shop.dart';
import 'package:looks_beauty/components/priceCarousel.dart';
import 'package:looks_beauty/components/search_component.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  openProductDetailScreen(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final List bannerImgs = [
      bannerImage,
      bannerImage,
      bannerImage,
      bannerImage,
      bannerImage
    ];
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
              flexibleSpace: SearchComponent(),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                <Widget>[
                  const BodyCareProductCat(),
                  // const Carousel(),

                  VxSwiper.builder(
                      height: 160,
                      viewportFraction: 0.9,
                      autoPlayAnimationDuration: Duration(milliseconds: 600),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      itemCount: bannerImgs.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          height: size.height,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: Image.asset(
                                // width: 100,
                                bannerImgs[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        );
                      })),

                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        belowbannerText,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  BestSellerCard(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: PriceCaraousel(),
                  ),
                  BrandImage(context),
                  const TabCatShop(),
                  SizedBox(
                    height: 20,
                  ),
                  trendingforHer(
                    context,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 16, right: 16),
                    child: Image.asset(specialofferImg),
                  ),
                  trendingforHim(context)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget trendingforHer(
  context,
) {
  final List trendHerimage = [lumiImg, nykaaImg, swissImg, sunscreenImg];
  final List trenproductText = [
    buyOneGetText,
    upToOffText,
    buyOneGetText,
    upToOffText
  ];
  final List trenproductTitleText = [
    anniversaryText,
    comboText,
    almostText,
    sunscreenText
  ];

  return Container(
    // height: size.height * .56,
    color: base2Color,
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Text(
            trendingHerText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        GridView.builder(
            padding: const EdgeInsets.all(16),
            physics: const BouncingScrollPhysics(),
            itemCount: trendHerimage.length,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 16),
            itemBuilder: (BuildContext context, indx) {
              return Column(
                children: [
                  Image.asset(trendHerimage[indx]),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    trenproductText[indx],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    trenproductTitleText[indx],
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              );
            }),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            height: 30,
            width: 100,
            decoration: BoxDecoration(
                color: baseColor, borderRadius: BorderRadius.circular(30)),
            child: const Center(
                child: Text(
              checkMoreText,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    ),
  );
}

Widget trendingforHim(context) {
  final List trendHimimage = [menImg, hairbeardImg, niveaImg, hritikImg];
  final List trenproductText = [
    buyOneGetText,
    upToOffText,
    buyOneGetText,
    upToOffText
  ];
  final List trenproductTitleText = [
    anniversaryText,
    comboText,
    almostText,
    sunscreenText
  ];

  return Padding(
    padding: const EdgeInsets.only(top: 25, bottom: 100),
    child: Container(
      // height: size.height * .56,
      color: trendingHimcolor,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.0,
            ),
            child: Text(
              trendingHimText,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.builder(
              padding: const EdgeInsets.all(16),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: trendHimimage.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 16),
              itemBuilder: (BuildContext context, indx) {
                return Column(
                  children: [
                    Image.asset(trendHimimage[indx]),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      trenproductText[indx],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      trenproductTitleText[indx],
                      style: const TextStyle(fontWeight: FontWeight.w400),
                    ),
                  ],
                );
              }),
        ],
      ),
    ),
  );
}

Widget BrandImage(context) {
  final List brandListImage = [
    pondsImg,
    kayImg,
    bathbodyImg,
    eifImg,
    nyvedaImg,
    pondsImg,
    kayImg,
    bathbodyImg,
  ];
  openProductDetailScreen(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
  }

  return Container(
    height: 120,
    color: brandBackColor,
    child: Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 8.0,
          ),
          child: Text(
            brandText,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
              semanticChildCount: 5,
              shrinkWrap: true,

              // physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: brandListImage.length,
              itemBuilder: (BuildContext cntx, indx) {
                return GestureDetector(
                  onTap: () {
                    openProductDetailScreen(context);
                  },
                  child: Image.asset(
                    brandListImage[indx],
                    scale: 4,
                  ),
                );
              }),
        ),
      ],
    ),
  );
}

class BodyCareProductCat extends StatefulWidget {
  const BodyCareProductCat({super.key});

  @override
  State<BodyCareProductCat> createState() => _BodyCareProductCatState();
}

class _BodyCareProductCatState extends State<BodyCareProductCat> {
  List CatImages = [faceImg, hairImg, LipImg, eyesImg, nailsImg, spaImg];
  List CatName = ["Face", "Hair", "Lip Care", "Eyes", "Nails", "Spa"];
  bool enable = true;
  bool isDisposed = false; // Flag to track whether the widget is disposed

  void loadData() async {
    if (isDisposed)
      return; // Check if the widget is disposed before updating state

    await Future.delayed(const Duration(seconds: 3));

    if (!isDisposed) {
      // Check again before updating state
      setState(() {
        enable = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    isDisposed = true; // Set the flag to true before calling super.dispose()
    super.dispose();
  }

  openProductDetailScreen(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return enable
        ? Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            enabled: true,
            child: Container(
              height: 100, // Set the desired height for your horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: CatImages.length,
                itemBuilder: (BuildContext context, int index) {
                  // You can customize the CircleAvatar here
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            openProductDetailScreen(context);
                          },
                          child: Image.asset(
                            CatImages[index],
                            scale: 2.8,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            CatName[index],
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          )
        : Container(
            height: 100, // Set the desired height for your horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: CatImages.length,
              itemBuilder: (BuildContext context, int index) {
                // You can customize the CircleAvatar here
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          openProductDetailScreen(context);
                        },
                        child: Image.asset(
                          CatImages[index],
                          scale: 2.8,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          CatName[index],
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          );
  }
}

Widget BestSellerCard() {
  List Imglist = [Bestsellerimg1, Bestsellerimg2, Bestsellerimg3];
  openProductDetailScreen(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ProductDetailScreen()));
  }

  return Container(
    height: 130, // Set the desired height for your horizontal list
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: Imglist.length,
      itemBuilder: (BuildContext context, int index) {
        // You can customize each Card here
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Card(
            elevation: 4,
            shadowColor: baseColor,
            child: GestureDetector(
              onTap: () {
                openProductDetailScreen(context);
              },
              child: Image.asset(
                Imglist[index],
              ),
            ),
          ),
        );
      },
    ),
  );
}
