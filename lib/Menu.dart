import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/calendar_popup_view.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Menu(),

    );
  }
}

class Menu extends StatefulWidget{

  @override
  _Menu createState()=> _Menu();
}


class _Menu extends State<Menu>{

  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(const Duration(days: 5));

  @override
  Widget build(BuildContext context){
    return new Stack(
      children: [
    Container(

    padding: const EdgeInsets.all(5.0),
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(

    gradient: LinearGradient(
    begin: Alignment.topCenter,

    end: Alignment.bottomCenter,
    colors: <Color>[
    Colors.black.withAlpha(0),
    Colors.black12,
    Colors.black45,

    ],
    ),
    ),
    child: new ListTile(
    leading: new InkWell(
    onTap: () {
    print('Card tapped.');
    },

    child: const SizedBox(

    child: Text('nothing here'),
    ),
    ),
   title: new Text("鄉村"),
    subtitle: new Image.network(

    "https://th.bing.com/th/id/R.a0e5533878e10891cefe3d5702066d24?rik=oAJ0rqrS35fnnQ&riu=http%3a%2f%2fden.gr.jp%2fden%2f_src%2f6825%2f73.jpg%3fv%3d1576059211340&ehk=3%2b6or0RSxkU%2fheAfigx2F6vsENrVcfjSf87wODGNajw%3d&risl=&pid=ImgRaw",
    fit: BoxFit.fill,

    ),onTap: () {
    print('Card tapped.');
    },
    trailing: new IconButton(
    onPressed: ()=>{},
    iconSize: 36,
    icon: new Icon(Icons.add),
    ),
    ),




    ),

        CircleAvatar(
          maxRadius: 30,

          child: Text(
            'Flutter Container Demo',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20,color: Colors.black),

          ),
          backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/20992063?s=460&v=4',),
        ),
    Padding(

    padding: const EdgeInsets.only(left: 18, bottom: 1),
    child: Row(
    children: <Widget>[
    Expanded(
    child: Row(
    children: <Widget>[
    Material(
    color: Colors.transparent,
    child: InkWell(
    focusColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    splashColor: Colors.grey.withOpacity(0.2),
    borderRadius: const BorderRadius.all(
    Radius.circular(4.0),
    ),
    onTap: () {
    FocusScope.of(context).requestFocus(FocusNode());
    // setState(() {
    //   isDatePopupOpen = true;
    // });
    showDemoDialog(context: context);
    },
    child: Padding(
    padding: const EdgeInsets.only(
    left: 8, right: 8, top: 4, bottom: 4),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    Text(
    'Choose date',
    style: TextStyle(
    fontWeight: FontWeight.w100,
    fontSize: 16,
    color: Colors.black.withOpacity(0.8)),
    ),
    const SizedBox(
    height: 8,
    ),
    Text(
    '${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}',
    style: TextStyle(

    fontWeight: FontWeight.w100,
    color: Colors.yellowAccent.withOpacity(0.8),
    fontSize: 16,
    ),
    ),
    ],
    ),
    ),
    ),
    ),
    ],
    ),
    ),
    Padding(
    padding: const EdgeInsets.only(right: 8),
    child: Container(
    width: 1,
    height: 2,
    color: Colors.grey.withOpacity(0.8),
    ),
    )

    ]
    )
    ),
        Positioned(
          top: 10,
          left: 10,
          child: Text('風景喔'),

        ),
      ],

    );
  }

  void showDemoDialog({BuildContext? context}) {
    showDialog<dynamic>(
      context: context!,
      builder: (BuildContext context) => CalendarPopupView(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime startData, DateTime endData) {
          setState(() {
            startDate = startData;
            endDate = endData;
          });
        },
        onCancelClick: () {},
      ),
    );
  }

}
