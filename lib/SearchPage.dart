import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();

}


class _SearchPageState extends State {
  final myController = TextEditingController();
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  final myController3 = TextEditingController();
  Completer<GoogleMapController> _controller = Completer();
  var mapController;


  final LatLng _center = const LatLng(25.0339206, 121.5636985);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);




  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    myController1.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding:  EdgeInsets.only(top: 10, left :100.0),

          child: Form(

            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  controller: myController,

                  decoration: InputDecoration(
                    hintText: 'Enter your full name',
                    labelText: 'Full Name',
                  ),
                ),
                AspectRatio(
                  aspectRatio: 5,
                  child: Image.asset(
                    "https://avatars1.githubusercontent.com/u/20992063?s=460&v=4",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(32.0),
                      ),
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.favorite_border,


                        ),
                      ),
                    ),
                  ),
                ),

                TextFormField(
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  controller:myController1,

                  decoration: InputDecoration(
                    hintText: 'Enter your phone number',
                    labelText: 'Phone Number',
                  ),
                ),
                new Card(
                  elevation: 4,
                  child: new Container(
                    height: 100,
                    alignment: Alignment.center,

                    child: new ListTile(
                      leading: new CircleAvatar(
                        maxRadius: 30,

                        child: Text(
                          'Flutter Container Demo',
                          textAlign: TextAlign.justify,
                          style: TextStyle(fontSize: 20,color: Colors.black),

                        ),
                        backgroundImage: NetworkImage('https://avatars1.githubusercontent.com/u/20992063?s=460&v=4',),
                      ),

                      title:  new Image.network(
                        "https://th.bing.com/th/id/R.7ce0f1948a41bcad9c5ca4c2e1630bec?rik=LlKxVm9kFpNxhQ&pid=ImgRaw",fit: BoxFit.fill,
                      ),

                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SecondRoute()),
                      );
                      print('Card tapped.');
                    },
                      subtitle:new Text('城市'+myController1.text,  textAlign: TextAlign.start,style: TextStyle(fontSize: 20,color: Colors.black),),



                      trailing: new IconButton(
                        onPressed: ()=>{},
                        iconSize: 24,
                        icon: new Icon(Icons.clear),

                      ),
                    ),

                  ),
                ),

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  controller: myController2,

                  decoration: InputDecoration(
                    hintText: 'Enter your email address',
                    labelText: 'Email Address',
                  ),
                ),
                new Card(
                  elevation: 4,
                  child: new Container(
                    color: Colors.cyanAccent,

                    height: 100,
                    alignment: Alignment.center,
                    child: new ListTile(
                      leading: new CircleAvatar(
                        maxRadius: 30,

                        child: new Image.network(
                          'lib/images/harry.jpg',
                        ),
                      ),
                      title: new Text("承諺"),

                      subtitle: new Image.network(
                        "https://th.bing.com/th/id/R.7ce0f1948a41bcad9c5ca4c2e1630bec?rik=LlKxVm9kFpNxhQ&pid=ImgRaw",fit: BoxFit.fill,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                        print('Card tapped.');
                      },
                      trailing: new IconButton(
                        onPressed: ()=>{},
                        iconSize: 36,
                        icon: new Icon(Icons.clear),
                      ),
                    ),
                  ),
                ),
                new Card(
                  elevation: 4,
                  child: new Container(
                    color: Colors.purple,
                    height: 100,
                    alignment: Alignment.center,
                    child: new ListTile(
                      leading: new CircleAvatar(

                        maxRadius: 30,
                        child: new Image.network(
                          'lib/images/harry.jpg',
                        ),
                      ),
                      title: new Text("蔡承諺"),
                      subtitle: new Text("寶雅最強工程師"),
                      trailing: new IconButton(
                        onPressed: ()=>{},
                        iconSize: 36,
                        icon: new Icon(Icons.clear),
                      ),

                    ),

                  ),
                ),
                new Card(
                  elevation: 4,
                  child: new Container(
// margin:EdgeInsets.only(top: 20),
// padding: EdgeInsets.all(0),
                    height: 100,
                    alignment: Alignment.center,
                    child: new ListTile(
//title: new Text(""),//這個可以用但是會讓圖片超出框格外
                      subtitle: new Image.network('https://th.bing.com/th/id/R.d5c092183347c6c8037019bac5e2f3fc?rik=rKdFo8o3iTGYSw&pid=ImgRaw',fit: BoxFit.fill,),
                      onTap: () {
                        print('Card tapped.');
                      },

                      trailing: new IconButton(
                        onPressed: ()=>{},
                        iconSize: 36,
                        icon: new Icon(Icons.clear,
                          color:Colors.blueAccent ,  ),


                      ),

                    ),

                  ),
                ),
                new Card(
                  elevation: 4,

                  child: new Container(
                    height: 100,
                    margin:EdgeInsets.only(top: 20),
                    child: new ListTile(
                      leading: new InkWell(
                        onTap: () {
                          print('Card tapped.');
                        },

                        child: const SizedBox(

                          child: Text('nothing here'),
                        ),
                      ),
// title: new Text("129"),
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
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  controller: myController3,

                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                ),
                GoogleMap(
                  zoomGesturesEnabled: false, //縮放手勢
                  onMapCreated: _onMapCreated,
                  mapType: MapType.normal,
                  compassEnabled: true, //指北針
                  initialCameraPosition: CameraPosition(
                      target: _center, //中心點座標
                      zoom: 16.0, //Camera縮放尺寸，越近數值越大，越遠數值越小，預設為0
                      bearing: 30, //Camera旋轉的角度，方向為逆時針轉動，預設為0
                      tilt: 120 //Camera侵斜角度
                  ),
                ),
                Column(
                  children: [
                    new Image.network(
                      "https://th.bing.com/th/id/R.7ce0f1948a41bcad9c5ca4c2e1630bec?rik=LlKxVm9kFpNxhQ&pid=ImgRaw",fit: BoxFit.fill,width: 50,height: 25,
                    ),
                    Text('COOK:'),
                    Text('1 hr'),

                  ],

                ),


                FloatingActionButton(
                  // When the user presses the button, show an alert dialog containing
                  // the text that the user has entered into the text field.
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text('地區:' +'日期:'),

                        );
                      },
                    );

                  },
                  tooltip: 'Show me the value!',
                  child: Icon(Icons.text_fields),
                ),
                FloatingActionButton(
                  // When the user presses the button, show an alert dialog containing
                  // the text that the user has entered into the text field.
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          // Retrieve the text the that user has entered by using the
                          // TextEditingController.
                          content: Text('地區:' +'日期:'),

                        );
                      },
                    );

                  },
                  tooltip: 'Show me the value!',
                  child: Icon(Icons.text_fields),


                ),

              ],

            ),

          )
      ),



      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text('第一個東西是'+myController.text +'最後一個東西是'+myController3.text),

              );
            },
          );

        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),

    );
    Future<void> _goToTheLake() async {
      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    }
  }
  @override
  Widget bud(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          mapType: MapType.hybrid,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
  @override
  Widget mapp(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Google Maps'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          zoomGesturesEnabled: false, //縮放手勢
          onMapCreated: _onMapCreated,
          mapType: MapType.normal,
          compassEnabled: true, //指北針
          initialCameraPosition: CameraPosition(
              target: _center, //中心點座標
              zoom: 16.0, //Camera縮放尺寸，越近數值越大，越遠數值越小，預設為0
              bearing: 30, //Camera旋轉的角度，方向為逆時針轉動，預設為0
              tilt: 120 //Camera侵斜角度
          ),
        ),
      ),
    );
  }
  @override
  Widget oo(BuildContext context ) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Retrieve Text Input'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),

      ),

      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },

        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),

    );
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}




class SecondRoute extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>SearchPage(  ) ),
            );
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}







