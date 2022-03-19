import 'package:flutter/material.dart';
import 'package:myfavmovie/models/favourites.dart';
import 'package:myfavmovie/screens/fav_page.dart';
import 'package:myfavmovie/screens/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Favourits(),
      child: MaterialApp(
        title: "Testing Sample Work",
        theme: ThemeData.dark(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          FavouritePage.routeName: (context) => FavouritePage()
        },
        initialRoute: HomePage.routeName,
      ),
    );
  }
}
