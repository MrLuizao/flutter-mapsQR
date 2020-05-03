import 'package:flutter/material.dart';
import 'package:lky_qr/src/pages/homePage.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR & Map',
      initialRoute: 'home',
        routes: {
          'home': (BuildContext context) =>  HomePage()
        },
    );
  }
}