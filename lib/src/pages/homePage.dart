import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';

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
      appBar: AppBar(
        title: Text('QR Scanner') ,
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){}
          )

        ],
      ),
      body: _callinPage(indexPage),
      bottomNavigationBar: _createBottomNavigate(),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.filter_center_focus),
        onPressed: _scaningQR,
        backgroundColor: Theme.of(context).primaryColor,

      ),
    );
  }

  _scaningQR() async {

    // https://lkyco-2a58b.web.app/home
    // geo:40.792887770822034,-73.9551295324219

    dynamic futureString ='';
  
    try {
      futureString = await BarcodeScanner.scan();
    }catch(e){
      futureString=e.toString();
    }
  
    print('Future String: ${futureString.rawContent}');

    if (futureString != null) {
      print('INFORMACION OBTENIDA CON ÉXITO');
    }

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