import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitchclone/Screens/Browse.dart';
import 'package:twitchclone/Screens/Discover.dart';
import 'package:twitchclone/Screens/Esports.dart';
import 'package:twitchclone/Screens/Following.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, title: 'Twitch', home: Homepage());
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    int selectedIndex = 0;
    void onTap(int value) {
      setState(() {
        selectedIndex = value;
      });
      pageController.jumpToPage(value);
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView(
        physics: ScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        controller: pageController,
        children: [Following(), Discover(), Browse(), Esports()],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: Colors.black,
        selectedFontSize: 14,
        selectedLabelStyle: TextStyle(color: Colors.white),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        unselectedFontSize: 12.0,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        selectedIconTheme: IconThemeData(color: Colors.purple),
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.heart,
                //color: Colors.white,
              ),
              title: Text('Following')),
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.activity,
                // color: Colors.white,
              ),
              title: Text(
                'Discover',
                // style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.browser,
                //color: Colors.white,
              ),
              title: Text(
                'Browse',
                // style: TextStyle(color: Colors.white),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                EvaIcons.trendingUpOutline,
                //color: Colors.white,
              ),
              title: Text(
                'Esports',
                //style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
