import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

class Demo2App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        iconTheme: IconThemeData.fallback(),
        primarySwatch: Colors.red,
      ),
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
      return index ==_selectedIndex ? Colors.red : Colors.grey;
    }

    List<Tuple3<IconData, String, int>> items = [
      Tuple3(Icons.home, "Home", 0),
      Tuple3(Icons.menu, "Menu", 1),
      Tuple3(Icons.search, "Search", 2),
      Tuple3(Icons.person, "My", 3),
    ];

    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: items.map((tuple) => 
         BottomNavigationBarItem(
            activeIcon: Icon(tuple.item1, color: itemColor(tuple.item3)),
            icon: Icon(tuple.item1, color: itemColor(tuple.item3)),
            title: Text(tuple.item2, style: TextStyle(color: itemColor(tuple.item3)))
          )
        ).toList(),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("$_selectedIndex", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
      ),
      bottomNavigationBar:bottomNavigaationBar() ,
    );
  }
}
