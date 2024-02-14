import 'package:add_to_cart_practice/cart_provider.dart';
//import 'package:add_to_cart_practice/productlist.dart';
import 'package:add_to_cart_practice/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(),
      /*the first step when the application runs is to set up the ChangeNotifierProvider
       with a CartProvider instance, followed by the configuration of the MaterialApp and 
       rendering of the home screen (ProductList).*/
      child: Builder(builder: (BuildContext context) {
        // ignore: unused_local_variable
        final themeChanger = Provider.of<ThemeChanger>(context);
        SystemChrome.setSystemUIOverlayStyle(
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: themeChanger.themeMode,
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(brightness: Brightness.dark),
          home: const Home(),
        );
      }),
    );
  }
}
