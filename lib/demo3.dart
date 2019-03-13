import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:flutter/services.dart';

class Demo3App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 2;

  Widget bottomNavigaationBar() {
    Color itemColor(int index) {
      return index == _selectedIndex ? Colors.red : Colors.grey;
    }

    List<Tuple3<IconData, String, int>> items = [
      Tuple3(Icons.home, "Home", 0),
      Tuple3(Icons.menu, "Menu", 1),
      Tuple3(Icons.search, "Search", 2),
      Tuple3(Icons.person, "My", 3),
    ];

    return BottomAppBar(
      color: Colors.lightBlue,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              }),
          IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              }),
          IconButton(
              icon: Icon(Icons.home),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
              }),
          IconButton(
              icon: Icon(Icons.airport_shuttle),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
              }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text(
          "$_selectedIndex",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: bottomNavigaationBar(),
      floatingActionButton: FloatingActionButton(child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
