import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:uplisten/screens/player.dart';
import 'package:uplisten/screens/search.dart';
import 'package:uplisten/screens/settings.dart';
import 'explore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      ExplorePage(
        navigate: () => setState(() => idx = 2),
      ),
      SearchPage(
        navigate: () => setState(() => idx = 2),
      ),
      PlayerPage(),
      SettingsPage(),
    ];
    print(Theme.of(context).textSelectionTheme.cursorColor.toString());
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idx,
        onTap: (i) => setState(() => idx = i),
        elevation: 0,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).textSelectionTheme.cursorColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Feather.compass),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.search),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.play),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Feather.settings),
            label: "",
          ),
        ],
      ),
      body: IndexedStack(
        children: pages,
        index: idx,
      ),
    );
  }
}
