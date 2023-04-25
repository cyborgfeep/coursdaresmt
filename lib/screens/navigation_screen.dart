import 'package:coursdaresmt/screens/home_screen.dart';
import 'package:coursdaresmt/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        children: [
          const HomeScreen(),
          Container(color: Colors.yellow,),
          Container(color: Colors.green,),
          Container(color: Colors.orangeAccent,),
          Container(color: Colors.purple,),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: defaultColor,
        unselectedItemColor: Colors.grey,
        onTap: (value) {
          setState(() {
            currentIndex = value;
            _pageController.jumpToPage(currentIndex);
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: "Accueil"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_pie), label: "Conso"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.arrow_right_arrow_left), label: "O.M"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bag), label: "Services"),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.burn), label: "Assistance"),
        ],
      ),
    );
  }
}
