import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'JourneyPage.dart';
import 'Menu.dart';
import 'Notify.dart';
import 'SearchPage.dart';
import 'idea.dart';


// image: https://images-na.ssl-images-amazon.com/images/G/01/AmazonExports/Projects/Outlet/Amazon_OutletDeals_Desktop_TW.jpg

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) {
      return BottomNavigationBarHomePage();
    },
    '/TravelPage': (context) {
      return CreateTravelPage();
    }
  },
  // home: BottomNavigationBarHomePage()
));


// 動態
class BottomNavigationBarHomePage extends StatefulWidget {
  @override
  _BottomNavigationBarHomePageState createState() => _BottomNavigationBarHomePageState();
}

class _BottomNavigationBarHomePageState extends State<BottomNavigationBarHomePage> {
  int index = 0;
  final pages = [
    JourneyPage(),
    SearchPage(),
    idea(),
    Notify(),
    Menu(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 0, child: Scaffold(
      backgroundColor: Color.fromARGB(220, 204, 164, 245),
      appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(right: 235),
            child: Text('Harry', style: TextStyle(fontSize: 20),),
          ),

          leading: IconButton(

            icon: Container(
              width: 100,
              height: 100,
              child: ClipOval(
                child: Image.asset('lib/images/harry.jpg',//路徑要與pubspec.yaml的flutters:的assets:相同
                  width: 90,
                  height: 50,
                  fit: BoxFit.cover,
                ),
              ),
        ),
            onPressed: () {

            },
      ),
          actions: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 20),
              icon: Icon(Icons.add_circle_outline, size: 30, color: Colors.black38,),
              tooltip: 'Create 00',
              onPressed: () {
                Navigator.pushNamed(context, '/TravelPage');
              },
            ),
          ],

          backgroundColor: Color.fromARGB(72, 145, 128, 186)
      ),
      body: pages[index],


      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: Color.fromARGB(183, 145, 128, 186),
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int idx) {
          if (idx != index) {
            index = idx;
            setState(() {});
          }
        },
        selectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.card_travel_outlined,), label: 'Journey',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.search,), label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.lightbulb,), label: 'idea',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.notifications_on_outlined,), label: 'Notify',

          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.list_outlined,), label: 'Menu',
          ),
        ],
      )));
    }
  }






class CreateTravelPage extends StatefulWidget {
    @override
  _CreateTravelPageState createState() => _CreateTravelPageState();
}

class _CreateTravelPageState extends State<CreateTravelPage> {
  int currentIndex = 0;
  final pages = [
    JourneyPage(),
    SearchPage(),
    idea(),
    Notify(),
    Menu(),
  ];
  void OnChangeScreen(int idx) {
    if (idx != currentIndex) {
      setState(() {
        currentIndex = idx;
        pages[currentIndex];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(220, 204, 164, 245),
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(right: 90),
          child: Text('Create New Journey'),
        ),
        backgroundColor: Color.fromARGB(72, 145, 128, 186),
        actions: [
          IconButton(
              onPressed: () {
                print('save');
          },
              icon: Icon(Icons.save_outlined, size: 35,),
              padding: EdgeInsets.only(right: 30),
          )
        ],
      ),
      body: pages[currentIndex],

      /*Center(
          child: Text('APP', style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontSize: 100, fontWeight: FontWeight.w900
          ),)),*/


      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(183, 145, 128, 186),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: OnChangeScreen,
        selectedItemColor: Colors.white70,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.card_travel_outlined, ), label: 'Journey',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.search, ), label: 'Search',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.lightbulb, ), label: 'idea',
          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.notifications_on_outlined, ), label: 'Notify',

          ),
          BottomNavigationBarItem(
            backgroundColor: Color.fromARGB(183, 145, 128, 186),
            icon: Icon(Icons.list_outlined, ), label: 'Menu',
          ),
        ],
      ),
    );
  }
}










