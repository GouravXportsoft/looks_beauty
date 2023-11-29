// const initialRoute = '/';

import 'package:looks_beauty/Screens/authentication/loginSingup.dart';
import 'package:looks_beauty/Screens/cartscreen.dart';
import 'package:looks_beauty/Screens/category_Screen.dart';
import 'package:looks_beauty/Screens/home_screen.dart';
import 'package:looks_beauty/Screens/notification_Screen.dart';
import 'package:looks_beauty/Screens/offers_Screen.dart';
import 'package:looks_beauty/Screens/profile_Screen.dart';
import 'package:looks_beauty/Screens/tabBar_Screen.dart';

const homeRoute = '/home_screen.dart';
const tabsRoute = '/tabBar_Screen.dart';
const logSingupRoute = '/loginSingup.dart';
const categoryRoute = '/Category_Screen.dart';
const profileRoute = '/Profile_Screen.dart';
const offersRoute = '/Offers_Screen.dart';
const notificationRoute = '/notification_Screen.dart';
const cartScreen = '/lib/Screens/cartscreen.dart';

// const productDetailsRoute = '/product_Screen.dart';

final routes = {
  homeRoute: (context) => HomeScreen(),
  tabsRoute: (context) => const TabBarScreen(),
  logSingupRoute: (context) => const LoginSignup(),
  categoryRoute: (context) => const CategoryScreen(),
  profileRoute: (context) => const ProfileScreen(),
  offersRoute: (context) => const OfferScreen(),
  notificationRoute: (context) => const NotificationScreen(),
  cartScreen: (context) => const CartScreen(),

  // productDetailsRoute: (context) => const ProductDetailScreen()
};
