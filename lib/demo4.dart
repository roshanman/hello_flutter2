import 'package:flutter/material.dart';

class Demo4App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: PageA(),
    );
  }
}

class PageA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.green[300],
      child: Center(
        child: IconButton(
          iconSize: 100,
          icon: Icon(Icons.navigate_next, size: 100),
          onPressed: () {
            Navigator.of(context).push(CustomPageRoute(PageB()));
          },
        ),
      ),
    ));
  }
}

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.pink[200],
      child: Center(
        child: IconButton(
          iconSize: 100,
          icon: Icon(Icons.navigate_before, size: 100),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    ));
  }
}

class CustomPageRoute extends PageRouteBuilder {
  Widget child;
  CustomPageRoute(this.child)
      : super(
            transitionDuration: Duration(seconds: 1),
            pageBuilder: (context, animation1, animation2) {
              return child;
            },
            transitionsBuilder: (context, animation1, animation2, child) {
              return SlideTransition(
                position: Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0)).animate(CurvedAnimation(
                        parent: animation1, 
                        curve: Curves.fastOutSlowIn
                    )
                ),
                child: child,
              );

              // return RotationTransition(
              //     turns: Tween(begin: 0.0, end: 1.0).animate(
              //       CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)
              //     ),
              //     child: ScaleTransition(
              //       scale: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
              //       child: FadeTransition(
              //         child: child,
              //         opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)),
              //       ),
              //     )
              //   );

              // return FadeTransition(
              //   child: child,
              //   opacity: Tween(begin: 0.0, end: 1.0).animate(
              //     CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn)
              //   ),
              // );
            });
}
