import 'package:flutter/material.dart';
import 'package:lky_qr/src/pages/directionsPage.dart';
import 'package:lky_qr/src/pages/mapsPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int indexPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _callinPage(indexPage),
      bottomNavigationBar: _createBottomNavigate(),
    );
  }

  Widget _callinPage(int currentPage){

    switch (currentPage) {
      
      case 0:
      return MapsPage();

      case 1:
      return DirectionsPage();

      default:
      return MapsPage();
      
    }

  }

  Widget _createBottomNavigate(){

    return BottomNavigationBar(
      currentIndex: indexPage,
      onTap: (index) {
        setState(() {
          indexPage = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon( Icons.map ),
          title: Text('Maps')
        ),
        BottomNavigationBarItem(
          icon: Icon( Icons.brightness_5) ,
          title: Text('Directions')
        )
      ],
    );
  }
}