import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vce_hackathon_front/screens/homepage.dart';
import 'package:vce_hackathon_front/screens/profile.dart';

import 'main.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key, required this.selected});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final int selected;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _counter = 0;

  var _selectedIndex = 0;

  List<Widget> pages = [
    MyHomePage(title: "home"),
    MyHomePage(title: "home"),
    ProfilePage(title: "profile")
  ];

  Route _createRoute(pageIndex) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => pages[pageIndex],
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 0.0);
        const end = Offset(0.0, 0.0);
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      Navigator.of(context).popUntil((route) => route.isFirst);
      Navigator.of(context).push(_createRoute(_selectedIndex));
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
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.health_and_safety),
          label: 'Insurance',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          label: 'Diagnosis',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: 'History',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
      currentIndex: widget.selected,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Theme.of(context).primaryColor,
      showUnselectedLabels: true,
      selectedFontSize: 14,
      unselectedFontSize: 14,
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
