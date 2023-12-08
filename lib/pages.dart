import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:redirect_icon/redirect_icon.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int currentPageIndex = 0;
  int _counter = 0;


  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }
  final PageController _controller =
  PageController(viewportFraction: 0.1, initialPage: 100);

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: (){
                  _resetCounter();
                  HapticFeedback.heavyImpact();
                },
                tooltip: 'Reset',
                child: const Icon(Icons.refresh),
              ),
              Text(
                '$_counter',
                style: const TextStyle(
                  fontSize: 80,
                  color: Colors.white,
                ),
              ),
              Container(
                width: 90,
                child: GestureDetector(
                  onVerticalDragDown: (dragDownDetails){
                    HapticFeedback.heavyImpact();
                    setState(() {
                      _counter++;
                    });
                  },
                  child: PageView.builder(
                    reverse: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Image.asset(
                          'assets/bead.png'
                      );
                    },
                    itemCount: null,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.black,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      Fluttertoast.showToast(
                          msg: 'Mr. Robot is hacking your smartphone right now.'
                      );
                    });
                  },
                  child: const CircleAvatar(
                    backgroundImage: ExactAssetImage('assets/myPhoto.jpg'),
                    radius: 80,
                  ),
                ),
              ),
              const Text(
                'Abd El Rahman Mohamed',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                ),
              ),
              const Text(
                'Flutter Developer',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
              const Text(
                'Follow me on:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const Row(
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