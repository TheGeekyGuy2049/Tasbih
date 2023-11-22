import 'package:flutter/material.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redirect_icon/redirect_icon.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final _defaultLightColorScheme =
  ColorScheme.fromSwatch(primarySwatch: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightColorScheme, darkColorScheme) {
      return MaterialApp(
          theme: ThemeData(
            colorScheme: darkColorScheme ?? _defaultLightColorScheme,
            useMaterial3: true,
          ),
          home: Navigation()
      );
    }
    );
  }
}

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          HapticFeedback.heavyImpact();
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.info),
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
      body: <Widget>[
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                onPressed: (){
                  _resetCounter();
                  HapticFeedback.heavyImpact();
                },
                tooltip: 'Reset',
                child: const Icon(Icons.refresh),
              ),
              SizedBox(
                child: Text(
                  '$_counter',
                  style: const TextStyle(
                    fontSize: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              FloatingActionButton(
                onPressed: (){
                  _incrementCounter();
                  HapticFeedback.heavyImpact();
                },
                tooltip: 'Increment',
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: ExactAssetImage('assets/myPhoto.jpg'),
                radius: 80,
              ),
              Text(
                'Abd El Rahman Mohamed',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
              Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              Text(
                'Follow me on:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RedirectSocialIcon(
                      url: "https://www.facebook.com/AbdElRahamnMohamed2000/",
                      icon: FontAwesomeIcons.facebook,
                      radius: 25,
                      size: 30,
                      iconColor: Colors.white,
                      circleAvatarColor: Colors.black
                  ),
                  RedirectSocialIcon(
                      url: "https://twitter.com/Abdelrahman5T",
                      icon: FontAwesomeIcons.xTwitter,
                      radius: 25,
                      size: 30,
                      iconColor: Colors.white,
                      circleAvatarColor: Colors.black
                  ),
                  RedirectSocialIcon(
                      url: "https://www.instagram.com/abd_el_rahman.mohammed.3152/",
                      icon: FontAwesomeIcons.instagram,
                      radius: 25,
                      size: 30,
                      iconColor: Colors.white,
                      circleAvatarColor: Colors.black
                  ),
                ],
              ),
            ],
          ),
        ),
      ]
      [currentPageIndex],
    );
  }
}

