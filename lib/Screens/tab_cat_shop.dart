import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/tab_cat.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/string_constant.dart';

class TabCatShop extends StatefulWidget {
  const TabCatShop({super.key});

  @override
  State<TabCatShop> createState() => _TabCatShopState();
}

class _TabCatShopState extends State<TabCatShop> with TickerProviderStateMixin {
  TabController? _tabController;
  final List<Tab> myTabs = [
    const Tab(
      text: 'Category',
    ),
    const Tab(
      text: 'Skin Concern',
    ),
    const Tab(
      text: 'Routine',
    ),
    const Tab(
      text: 'Bestseller',
    )
  ];

  final List<Widget> tabViews = [
    TabCatScreen(),
    TabCatScreen(),
    TabCatScreen(),
    TabCatScreen(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 2,
      color: Colors.amber,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Container(
                    height: size.height * .11,
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        const Text(
                          shopText,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        TabBar(
                            controller: _tabController,
                            labelPadding: const EdgeInsets.all(0),
                            labelColor: baseColor,
                            tabs: myTabs,
                            indicatorColor: baseColor,
                            indicator: const UnderlineTabIndicator(
                                insets:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
                                borderSide: BorderSide(color: baseColor)),
                            unselectedLabelColor: Colors.black54),
                      ],
                    )),
              ),
              Expanded(
                  child: TabBarView(
                controller: _tabController,
                children: tabViews,
              )),
            ],
          ),
        ),
      ),
    );
  }
}
