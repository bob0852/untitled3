import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
void main() {
  runApp(MyApp());

}
class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('首頁'),
          ),
          body: _Page01()


      ),
    );
  }
}
class _Page01 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

      child: Text('Go to Page02'),
      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => Page02()));},

    );

  }

}
class HomePage extends StatelessWidget {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlertDialog Demo"),
      ),

      body: Center(
        child: ElevatedButton(
          child: Text("Show AlertDialog"),

          onPressed: () {
            showAlertDialog(context);
          },
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          index = index;
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.card_travel_outlined, ), label: 'Journey',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.search, ), label: 'Search',

          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.lightbulb, ), label: 'idea',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.notifications_on_outlined, ), label: 'Notify',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.list_outlined, ), label: 'Menu',
          ),
        ],
      ),

    );
  }
}
showAlertDialog(BuildContext context) {
  // Init
  AlertDialog dialog = AlertDialog(
    title: Text("多功能選單"),
    actions: [
      ElevatedButton(
          child: Text("好喔"),
          onPressed: () {
            Navigator.pop(context);
          }
      ),
      ElevatedButton(
          child: Text("計數器"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: '',)));
          }
      ),
      ElevatedButton(
          child: Text("回首頁"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
          }
      ),
      ElevatedButton(
          child: Text("側試頁面"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ButtonNavigationBarbHomePage()));
          }
      ),
    ],
  );
  // Show the dialog
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      }
  );
}

class Page02 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page02'  ),


      ),
      body: _Page02(),
    );
  }
}

class _Page02 extends StatelessWidget{
  get now => DateTime.now();
  @override

  Widget build(BuildContext context) {
    return ElevatedButton(

      child: Text('Go to Page showAlertDialog'),

      onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));},
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
  int index = 0;

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int index = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hello', style: TextStyle(
              color: Colors.deepPurple,
              fontWeight: FontWeight.w900,
              fontSize: 100,
            ),
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          index = index;
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.card_travel_outlined, ), label: 'Journey',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.search, ), label: 'Search',

          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.lightbulb, ), label: 'idea',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.notifications_on_outlined, ), label: 'Notify',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.list_outlined, ), label: 'Menu',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class ButtonNavigationBarbHomePage extends StatelessWidget {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(161, 225, 206, 243),
      appBar: AppBar(
          title: Text('MyNavigationBar'),
          backgroundColor: Colors.deepPurple
      ),
      body: Text('Hello', style: TextStyle(
        color: Colors.deepPurple,
        fontWeight: FontWeight.w900,
        fontSize: 100,
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.deepPurple,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (int index) {
          index = index;
        },
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.card_travel_outlined, ), label: 'Journey',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.search, ), label: 'Search',

          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.lightbulb, ), label: 'idea',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.notifications_on_outlined, ), label: 'Notify',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepPurpleAccent,
            icon: Icon(Icons.list_outlined, ), label: 'Menu',
          ),
        ],
      ),
    );
  }
}
