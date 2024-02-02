import 'package:flutter/material.dart';
import 'package:looks_beauty/Screens/MyAccountScreen.dart';
import 'package:looks_beauty/Screens/category_Screen.dart';
import 'package:looks_beauty/Screens/home_screen.dart';
import 'package:looks_beauty/Screens/offers_Screen.dart';
import 'package:looks_beauty/constants/color_constant.dart';
import 'package:looks_beauty/constants/image_constant.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  TabController? _tabController;
  _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    _selectedIndex = 0;
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  getScreen() {
    switch (_selectedIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return const CategoryScreen();

      case 2:
        return const OfferScreen();
      case 3:
        return const myAccScreen();
      default:
        return HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        getScreen(),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(50)),
              child: Container(
                decoration: BoxDecoration(
                  color: base2Color,
                ),
                child: TabBar(
                    onTap: (value) {
                      setState(() {
                        _selectedIndex = value;
                      });
                    },
                    indicatorColor: base2Color,
                    controller: _tabController,
                    unselectedLabelColor: Colors.black54,
                    labelColor: baseColor,
                    labelStyle: const TextStyle(
                        fontSize: 10, fontWeight: FontWeight.bold),
                    tabs: const <Widget>[
                      Tab(
                        icon: ImageIcon(AssetImage(homeImage)),
                        text: 'Home',
                      ),
                      Tab(
                        icon: ImageIcon(AssetImage(catImage)),
                        text: 'Category',
                      ),
                      Tab(
                        icon: ImageIcon(AssetImage(offersImage)),
                        text: 'Offers',
                      ),
                      Tab(
                        icon: ImageIcon(AssetImage(myaccimg)),
                        text: 'Account',
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
