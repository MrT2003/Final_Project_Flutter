import 'package:final_project_flutter/core/themes/theme.dart';
import 'package:final_project_flutter/features/authetication/authentication_repository.dart';
import 'package:final_project_flutter/firebase_options.dart';
import 'package:final_project_flutter/pages/cart_page/cartpage_view.dart';
import 'package:final_project_flutter/pages/favourite_page/favourite_view.dart';
import 'package:final_project_flutter/pages/home_page/homepage_view.dart';
import 'package:final_project_flutter/pages/item_page/item_view.dart';
import 'package:final_project_flutter/pages/profile_page/profile_page.dart';
import 'package:final_project_flutter/pages/welcome_page/welcome_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: MyAppTheme.lightTheme,
      transitionDuration: Duration(milliseconds: 500),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => MyHomePage()),
        GetPage(name: '/cartPage', page: () => CartPage()),
        GetPage(name: '/itemPage', page: () => ItemPage()),
        GetPage(name: '/profilePage', page: () => ProfilePage()),
        GetPage(name: '/favouritePage', page: () => FavouriteView()),
      ],
      home: WelcomePage(),
    );
  }
}
